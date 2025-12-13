import 'package:flutter/material.dart';
import 'package:shrine/colors.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _passwordVisible = false;

  void _login() {
    // TEMP admin credentials (replace with DB later)
    if (_usernameController.text == 'admin' &&
        _passwordController.text == 'admin123') {
      Navigator.pushReplacementNamed(context, '/adminDashboard');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid admin credentials')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          children: <Widget>[
            const SizedBox(height: 80.0),

            // Logo + Title
            Column(
              children: <Widget>[
                Image.asset('assets/mammal.png', width: 150, height: 150),
                const SizedBox(height: 50.0),
                const Text(
                  'Admin Portal',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            const SizedBox(height: 120.0),

            // Username
            TextField(
              controller: _usernameController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                label: const Center(child: Text('Admin Username')),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                suffixIcon: const Opacity(
                  opacity: 0.0,
                  child: Icon(Icons.visibility_off),
                ),
              ),
            ),

            const SizedBox(height: 12.0),

            // Password
            TextField(
              controller: _passwordController,
              textAlign: TextAlign.center,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                label: const Center(child: Text('Admin Password')),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 25.0),

            // Buttons
            OverflowBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('BACK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    foregroundColor: coconutWhite,
                    backgroundColor: inkBlack,
                  ),
                ),
                ElevatedButton(
                  child: const Text('LOGIN'),
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    foregroundColor: inkBlack,
                    backgroundColor: bananaYellow,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
