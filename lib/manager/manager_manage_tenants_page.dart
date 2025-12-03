import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/material/icons.dart';
import 'manager_helper.dart';


class ManagerManageTenantsPage extends StatefulWidget {
  const ManagerManageTenantsPage({super.key});

  @override
  State<ManagerManageTenantsPage> createState() => _ManagerManageTenantsPageState();
}

class _ManagerManageTenantsPageState extends State<ManagerManageTenantsPage> {

  Future <void> fetchTenants() async { //firebase fetch info from manager info

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Manage Tenants")),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child:  SizedBox(
                  height: 52,
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search tenant",
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Filter"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Sort By"),
              )
            ],
          ),
          Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                )
                            ),
                            child: Column(
                              children: [
                                Text("Name"),
                                Text("Room name and type"),
                                Text("Payment status and due date"),
                                Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () => Navigator.pushNamed(context, '/manager-view-tenant-info', arguments: "tenant ID"),
                                        child: Text("VIEW INFO")
                                    ),
                                    ElevatedButton(
                                        onPressed: () => Navigator.pushNamed(context, '/manager-input-tenant-due', arguments: "tenant ID"),
                                        child: Text("ADD DUES")
                                    )
                                  ],
                                )

                              ],
                            ),
                          )
                        ],
                      )
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF9B6A44)
                      ),
                      child: SizedBox(
                        height: 55,
                        width: 55,
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () => Navigator.pushNamed(context, '/manager-tenant-requests'),
                          color: Colors.white,
                          icon: Icon(Icons.add, size: 44)
                        ),
                      )
                    )
                  )
                ],
              )
          )
        ],
      )
    );
  }
}
