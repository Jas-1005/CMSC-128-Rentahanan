import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/services.dart';


class TenantPayNowPage extends StatefulWidget {
  const TenantPayNowPage({super.key});

  @override
  State<TenantPayNowPage> createState() => _TenantPayNowPageState();
}

class _TenantPayNowPageState extends State<TenantPayNowPage> {
  static final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.account_balance_wallet, 'label': 'Pay with Gcash'},
    {'icon': Icons.attach_money, 'label': 'Cash', 'route': '/tenant-pay-with-cash'},
    {'icon': Icons.account_balance, 'label': 'Pay Through Bank'},
    {'icon': Icons.public, 'label': 'OTC'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pay Now')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Hello, Tenant!')
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Payment Options',
                      style: TextStyle(
                        fontSize: 24
                      ),
                    ),
                  ),
                  Table(
                    children: List.generate(
                      (menuItems.length / 4).ceil(), // number of rows
                          (rowIndex) {
                        final int startIndex = rowIndex * 4;
                        final int endIndex = (startIndex + 4).clamp(0, menuItems.length);
                        final rowItems = menuItems.sublist(startIndex, endIndex);

                        // Fill empty cells if less than 4 items
                        while (rowItems.length < 4) {
                          rowItems.add({'icon': null, 'label': ''});
                        }

                        return TableRow(
                          children: rowItems.map((item) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: () => Navigator.pushNamed(context, item['route']),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (item['icon'] != null) Icon(item['icon'], size: 50),
                                    if ((item['label'] ?? '').isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Text(
                                          item['label'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Payment History',
                        style: TextStyle(
                            fontSize: 24
                        ),
                      ),
                    )
                )
            )
          ],
        ),
      )
    );
  }


}
