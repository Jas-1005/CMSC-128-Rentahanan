import 'package:flutter/material.dart';

class ManagerHelper {
  static final List<Map<String, dynamic>> navItems = [
    {'icon': Icons.home, 'label': 'Home', 'route': '/manager-dashboard'},
    {
      'icon': Icons.message,
      'label': 'Inbox',
      'route': '/manager-inbox'
    },
    {
      'icon': Icons.payments,
      'label': 'Transactions',
      'route': '/manager-transactions'
    },
    {
      'icon': Icons.account_circle,
      'label': 'Profile',
      'route': '/manager-profile'
    },
  ];

  static List<Widget> buildNavItems(BuildContext context) {
    return navItems.map((item) {
      return Expanded(
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () => Navigator.pushNamed(context, item['route']),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item['icon'],
                  size: 35,
                  color: Color(0xFF222222),
                ),
                const SizedBox(height: 2),
                Text(
                  item['label'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF222222),
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}
