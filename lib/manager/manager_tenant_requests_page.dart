import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/material/icons.dart';
import 'manager_helper.dart';


class ManagerTenantRequestsPage extends StatefulWidget {
  const ManagerTenantRequestsPage({super.key});

  @override
  State<ManagerTenantRequestsPage> createState() => _ManagerTenantRequestsPageState();
}

class _ManagerTenantRequestsPageState extends State<ManagerTenantRequestsPage> {

  Future <void> fetchTenants() async { //firebase fetch info from manager info

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Tenant Requests"),
              bottom: TabBar(
                tabs: [
                  Tab(text: "Pending"),
                  Tab(text: "Denied"),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Expanded(
                  child: SingleChildScrollView(
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
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Full Name"),
                                    Text("Email"),
                                    Text("Contact Number"),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: (){},
                                  child: Text("Approve")
                              ),
                              ElevatedButton(
                                  onPressed: (){},
                                  child: Text("Deny")
                              )
                            ],
                          ),
                        )
                      ]
                    ),
                  ),
                ),

                //DENIED TAB
                Expanded(
                  child: SingleChildScrollView(
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
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Full Name"),
                                      Text("Email"),
                                      Text("Contact Number"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
