import 'package:flutter/cupertino.dart';

void main() => runApp(const MainLoginApp());

class MainLoginApp extends StatelessWidget {
  const MainLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: HalamanLogin(),
    );
  }
}

class HalamanLogin extends StatefulWidget {
  const HalamanLogin({super.key});

  @override
  _HalamanLoginState createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Function to handle login action
  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Simple static check for username and password
    if (email == 'mukhlis@gmail.com' && password == '123456') {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => DashboardPage(username: email),
        ),
      );
    } else {
      // Show alert dialog if login fails
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Login Gagal'),
          content: const Text('Username atau password salah.'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Halaman Login'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Add a logo at the top
              Image.asset(
                'images/logo.png', // Ensure the image path is correct
                width: 150,
                height: 200,
              ),
              const SizedBox(height: 20), // Space between logo and form

              // Email field
              CupertinoTextField(
                controller: _emailController,
                placeholder: 'Masukan Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20), // Space between fields

              // Password field
              CupertinoTextField(
                controller: _passwordController,
                placeholder: 'Masukan Password',
                obscureText: true, // Hides the text for password input
              ),
              const SizedBox(height: 20), // Space between form and button

              // Login button with custom style
              Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.systemPink, // Pink color
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                child: CupertinoButton(
                  onPressed: _login,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: const Text('Login',
                      style: TextStyle(color: CupertinoColors.white)), // White text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  final String username;

  const DashboardPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Dashboard'),
      ),
      child: Center(
        child: Text(
          'Selamat Datang, $username!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}