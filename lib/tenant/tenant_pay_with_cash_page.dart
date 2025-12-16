import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class TenantPayWithCashPage extends StatefulWidget {
  const TenantPayWithCashPage({super.key});

  @override
  State<TenantPayWithCashPage> createState() => _TenantPayWithCashPageState();
}

class _TenantPayWithCashPageState extends State<TenantPayWithCashPage> {
  File ? _selectedImage;
  final DateFormat formatter = DateFormat('MMMM dd, yyyy');
  final _formKey = GlobalKey<FormState>();
  final TextEditingController paymentDateController = TextEditingController();
  final TextEditingController paymentProofController = TextEditingController();
  final TextEditingController paymentAmountController = TextEditingController();
  final TextEditingController paymentNotesController = TextEditingController();

  String errorMessage = "";

  Future _pickProofOfPayment(ImageSource source) async {
    final proofOfPayment = await ImagePicker().pickImage(source: source);

    if(proofOfPayment == null) return;
    setState(() {
      _selectedImage = File(proofOfPayment.path);
      paymentProofController.text = proofOfPayment.name;
    });
  }

  Future _pickDateOfPayment() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if(pickedDate != null){
      paymentDateController.text = formatter.format(pickedDate);
    } else {
      paymentDateController.text = "";
    }
  }

  Future<bool?> _showConfirmationDialog() async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Payment'),
          content: Text('Are you sure you want to submit this payment?'),
          actions: [
            ElevatedButton(
              child: Text('Confirm'),
              onPressed: () => Navigator.of(context).pop(true), // returns true
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(false), // returns false
            ),
          ],
        );
      },
    );
  }

  Future<void> _showLandladyNotifiedDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min, // keeps dialog compact
            children: [
              Text(
                'The landlady has been notified. Check your inbox for confirmation.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showPickImageDialog() async {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Select Image Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  _pickProofOfPayment(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  _pickProofOfPayment(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future <void> handlePayment() async{
    final paymentDate = paymentDateController.text;
    final paymentProof = paymentProofController.text;
    final paymentAmount = paymentAmountController.text;
    final paymentNotes = paymentNotesController.text;
  }

  @override
  void dispose() {
    paymentDateController.dispose();
    paymentAmountController.dispose();
    paymentProofController.dispose();
    paymentNotesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pay via Cash')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column (
              children: [
                TextFormField(
                  controller: paymentDateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Select Date of Payment',
                      suffixIcon: Icon(Icons.calendar_month),
                  ),
                  onTap: () async{
                    await _pickDateOfPayment();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select date of payment';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: paymentProofController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Upload Photo as Proof of Payment',
                    suffixIcon: Icon(Icons.upload),
                  ),
                  onTap: () {
                    _showPickImageDialog();
                  }
                ),
                const SizedBox(height: 20),
                _selectedImage != null
                    ? Row(
                  children: [
                    Image.file(
                      _selectedImage!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Expanded(child: Text(paymentProofController.text)),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          _selectedImage = null;
                          paymentProofController.clear();
                        });
                      },
                    ),
                  ],
                )
                : Text("Please upload a proof of payment"),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.\d*)?')),
                  ],
                  controller: paymentAmountController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter amount',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter payment amount';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: paymentNotesController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Notes (Optional)',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        bool? confirmed = await _showConfirmationDialog();
                        if (confirmed == true) {
                          // await handlePayment();
                          _showLandladyNotifiedDialog();
                        }
                      }
                    },
                    child: Text("Notify Landlady")
                )
              ]
            )
          ),
        ),
      ),
    );
  }
}