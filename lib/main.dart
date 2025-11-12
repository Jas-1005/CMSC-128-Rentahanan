import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rentahanan',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/role': (context) => const RolePage(),
        '/manager-login': (context) => const ManagerLoginPage(),
        '/tenant-login': (context) => const TenantLoginPage(),
        '/manager-dashboard': (context) => const ManagerDashboard(),
        '/manager-profile': (context) => const ManagerProfile(),
        '/tenant-dashboard': (context) => const TenantDashboard(),
        '/tenant-profile': (context) => const TenantProfile(),
      },
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Landing Page')),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'RENTAHANAN',
              style: TextStyle(
                fontSize: 30
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/role');
                },
                child: const Text('GET STARTED')
            )
          ],
        ),
      )
    );
  }
}

class RolePage extends StatelessWidget {
  const RolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Role')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Continue as...'),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/manager-login');
                      },
                      child: Image.asset(
                        'assets/images/cute_cat_placeholder.jpg',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('MANAGER')
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/tenant-login');
                      },
                      child: Image.asset(
                        'assets/images/cute_cat_placeholder.jpg',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('TENANT'),

                  ],
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}

class ManagerLoginPage extends StatefulWidget {
  const ManagerLoginPage({super.key});

  @override
  State<ManagerLoginPage> createState() => _ManagerLoginPageState();
}

class _ManagerLoginPageState extends State<ManagerLoginPage> {
  // Controllers to get text from input fields
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String errorMessage = '';
  bool _obscureText = true;

  void handleLogin() {
    final username = usernameController.text;
    final password = passwordController.text;

    // Simple login logic for now
    if (username == 'admin' && password == '1234') {
      Navigator.pushReplacementNamed(context, '/manager-dashboard');
    } else {
      setState(() {
        errorMessage = 'Invalid username or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manager Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: _obscureText, // hides password input
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText; // toggle visibility
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: handleLogin,
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

class TenantLoginPage extends StatefulWidget {
  const TenantLoginPage({super.key});

  @override
  State<TenantLoginPage> createState() => _TenantLoginPageState();
}

class _TenantLoginPageState extends State<TenantLoginPage> {
  // Controllers to get text from input fields
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String errorMessage = '';
  bool _obscureText = true;

  void handleLogin() {
    final username = usernameController.text;
    final password = passwordController.text;

    // Simple login logic for now
    if (username == 'user' && password == '1234') {
      Navigator.pushReplacementNamed(context, '/tenant-dashboard');
    } else {
      setState(() {
        errorMessage = 'Invalid username or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tenant Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: _obscureText, // hides password input
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText; // toggle visibility
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: handleLogin,
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

class ManagerDashboard extends StatefulWidget {
  const ManagerDashboard({super.key});

  @override
  State<ManagerDashboard> createState() => _ManagerDashboardPageState();
}

class _ManagerDashboardPageState extends State<ManagerDashboard> {
  static final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.payment, 'label': 'Manage Tenants'},
    {'icon': Icons.calendar_month, 'label': 'Input Dues'},
    {'icon': Icons.payments, 'label': 'View Payment'},
    {'icon': Icons.house, 'label': 'About'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manager Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hello, Manager!'),
                Icon(
                  Icons.notifications,
                  size: 30,
                ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Announcements:',
                            style: TextStyle(
                                fontSize: 24
                            ),
                          )
                      ),

                      Row(
                        children: [
                          Icon(Icons.add),
                          Icon(Icons.edit),
                          Icon(Icons.delete),
                        ],
                      )
                    ],
                  ),

                  Text('Power outage notice: Scheduled maintenance on Oct. 17, 1-3PM. Expect temporary interruption!'),
                  Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/announcement');
                          },
                          child: Text('>')
                      )
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
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Overview:',
                        style: TextStyle(
                            fontSize: 24
                        ),
                      )
                  ),
                  Table(
                    children: [
                      TableRow(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Tenants'),
                              Text('20')
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.pushNamed(context, '/manager-add-tenant'),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.add),
                                  Text('Add Tenant')
                                ],
                              ),
                            )
                          )
                        ]
                      ),
                      TableRow(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Pending Payments'),
                                Text('Php 18,450')
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Pending Reports'),
                                Text('5')
                              ],
                            ),
                          ]
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text('Rent:'),
                            Text('Php 2,500')
                          ],
                        ),
                        Column(
                          children: [
                            Text('Water:'),
                            Text('Php 100')
                          ],
                        ),
                        Column(
                          children: [
                            Text('Electricity:'),
                            Text('Php 350')
                          ],
                        ),
                        Column(
                          children: [
                            Text('Total:'),
                            Text('Php 2,950')
                          ],
                        )
                      ],
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
                            );
                          }).toList(),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ManagerHelper.buildNavItems(context)
            ),
          ],
        ),
      ),
    );
  }
}

class ManagerProfile extends StatefulWidget {
  const ManagerProfile({super.key});

  @override
  State<ManagerProfile> createState() => _ManagerProfilePageState();
}

class _ManagerProfilePageState extends State<ManagerProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manager Profile')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                child: Text('Logout')
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: TenantHelper.buildNavItems(context)
            ),
          ]
      ),
    );
  }
}

class TenantDashboard extends StatefulWidget {
  const TenantDashboard({super.key});

  @override
  State<TenantDashboard> createState() => _TenantDashboardPageState();
}

class _TenantDashboardPageState extends State<TenantDashboard> {
  static final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.payment, 'label': 'Pay'},
    {'icon': Icons.calendar_month, 'label': 'Dues'},
    {'icon': Icons.cloud_upload_outlined, 'label': 'Upload Proof'},
    {'icon': Icons.error_outline, 'label': 'Report Issue'},
    {'icon': Icons.house, 'label': 'About'},
    {'icon': Icons.notifications, 'label': 'Announcement'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tenant Dashboard')),
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
                        'Announcements:',
                        style: TextStyle(
                            fontSize: 24
                        ),
                      )
                  ),
                  Text('Power outage notice: Scheduled maintenance on Oct. 17, 1-3PM. Expect temporary interruption!'),
                  Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/announcement');
                          },
                          child: Text('>')
                      )
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
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Upcoming Dues:',
                        style: TextStyle(
                            fontSize: 24
                        ),
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Php 2,950',
                            style: TextStyle(
                                fontSize: 28
                            ),
                          ),
                          Text(
                            'Due on 10/31/25',
                            style: TextStyle(
                                fontSize: 12
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/transaction');
                              },
                              child: Text('Pay Now')
                          ),
                          Text(
                            'Tap Pay Now to settle dues securely.',
                            style: TextStyle(
                                fontSize: 8
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text('Rent:'),
                            Text('Php 2,500')
                          ],
                        ),
                        Column(
                          children: [
                            Text('Water:'),
                            Text('Php 100')
                          ],
                        ),
                        Column(
                          children: [
                            Text('Electricity:'),
                            Text('Php 350')
                          ],
                        ),
                        Column(
                          children: [
                            Text('Total:'),
                            Text('Php 2,950')
                          ],
                        )
                      ],
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
                            );
                          }).toList(),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: TenantHelper.buildNavItems(context)
            ),
          ],
        ),
      ),
    );
  }
}

class TenantProfile extends StatefulWidget {
  const TenantProfile({super.key});

  @override
  State<TenantProfile> createState() => _TenantProfilePageState();
}

class _TenantProfilePageState extends State<TenantProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tenant Profile')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
            child: Text('Logout')
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: TenantHelper.buildNavItems(context)
          ),
        ]
      ),
    );
  }
}

class ManagerHelper {
  static final List<Map<String, dynamic>> navItems = [
    {'icon': Icons.home, 'label': 'Home', 'route': '/manager-dashboard'},
    {'icon': Icons.person_add, 'label': 'Add Tenant', 'route': '/manager-add-tenant'},
    {'icon': Icons.error_outline, 'label': 'Reports', 'route': '/manager-reports'},
    {'icon': Icons.account_circle, 'label': 'Profile', 'route': '/manager-profile'},
  ];

  static List<Widget> buildNavItems(BuildContext context) {
    return navItems.map((item) {
      return Material(
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () => Navigator.pushNamed(context, item['route']),
          child: SizedBox(
            width: 80,
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item['icon'], size: 30),
                Text(
                  item['label'],
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}

class TenantHelper {
  static final List<Map<String, dynamic>> navItems = [
    {'icon': Icons.home, 'label': 'Home', 'route': '/tenant-dashboard'},
    {'icon': Icons.question_answer_outlined, 'label': 'Chat', 'route': '/tenant-chat'},
    {'icon': Icons.handshake, 'label': 'Transaction', 'route': '/tenant-transaction'},
    {'icon': Icons.account_circle, 'label': 'Profile', 'route': '/tenant-profile'},
  ];

  static List<Widget> buildNavItems(BuildContext context) {
    return navItems.map((item) {
      return Material(
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () => Navigator.pushNamed(context, item['route']),
          child: SizedBox(
            width: 80,
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item['icon'], size: 30),
                Text(
                  item['label'],
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}
