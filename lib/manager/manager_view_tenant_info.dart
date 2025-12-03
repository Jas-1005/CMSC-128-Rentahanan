import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/material/icons.dart';
import 'manager_helper.dart';


class ManagerViewTenantInfoPage extends StatefulWidget {
  const ManagerViewTenantInfoPage({super.key});

  @override
  State<ManagerViewTenantInfoPage> createState() => _ManagerViewTenantInfoPageState();
}

class _ManagerViewTenantInfoPageState extends State<ManagerViewTenantInfoPage> {

  Future <void> fetchTenantInfo() async { //firebase fetch info from manager info

  }

  Future <void> tenantActions() async {

  }


  @override
  Widget build(BuildContext context) {
    final tenantID = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        appBar: AppBar(title: Text("Tenant Info (id: $tenantID)")),
        body: Container(
          width: double.infinity,
          height: 500,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              )
          ),
          child: Column(
            children: [
              Text("Get tenant name"),
              Text("Get room number and room type"),
              Text("Get tenant email"),
              Text("Contact number"),
              Text("Get tenant address"),
              ElevatedButton(
                  onPressed: () {},
                  child: Text("View payment history")
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text("View dues")
              )
            ],
          ),
        )
    );
  }
}
