import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

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
        '/admin-dashboard': (context) => const AdminDashboard(),
        '/tenant-dashboard': (context) => const TenantDashboard(),
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
      Navigator.pushReplacementNamed(context, '/admin');
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
      Navigator.pushReplacementNamed(context, '/user');
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

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: const Center(
        child: Text('Welcome, Admin!'),
      ),
    );
  }
}

class TenantDashboard extends StatelessWidget {
  const TenantDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Dashboard')),
      body: const Center(
        child: Text('Welcome, User!'),
      ),
    );
  }
}
