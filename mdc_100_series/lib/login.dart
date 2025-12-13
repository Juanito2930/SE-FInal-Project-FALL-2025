
import 'package:flutter/material.dart';
import 'package:shrine/colors.dart';
import 'package:shrine/home.dart';
// import 'package:sqflite/sqflite.dart';
import 'register_page.dart';
// import 'services/database_services.dart';
import 'services/hive_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  // final DatabaseCredentials _databaseService = DatabaseCredentials.instance;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/mammal.png', width: 150, height: 150),
                const SizedBox(height: 50.0),
                const Text(
                'Gorilla Printer Shop',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center
                ),
              ],
            ),
            const SizedBox(height: 120.0),
            // TODO: Remove filled: true values (103)
            TextField(
              controller: _usernameController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100)
                ),
                label: const Center(child: Text('Username')),
                floatingLabelBehavior: FloatingLabelBehavior.never,

                suffixIcon: const Opacity(
                  opacity: 0.0,
                   child: Icon(Icons.visibility_off),
                   ),
              ),
            ),

            const SizedBox(height: 12.0),

            TextField(
              controller: _passwordController,
              textAlign: TextAlign.center,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100)
              ),

                label: const Center(child: Text('Password')),
                floatingLabelBehavior: FloatingLabelBehavior.never,

                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                )
              ),
            ),

            const SizedBox(height: 25.0),

            OverflowBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // TODO: Add a beveled rectangular border to CANCEL (103)
                ElevatedButton(
                  child: const Text('SIGNUP'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context) => const RegisterPage()),
                      );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    foregroundColor: coconutWhite,
                    backgroundColor: inkBlack,
                    
                  ),
                ),
                // TODO: Add an elevation to NEXT (103)
                // TODO: Add a beveled rectangular border to NEXT (103)
                ElevatedButton(
                  child: const Text('LOGIN'),

                  onPressed: () {
                    final username = _usernameController.text.trim();
                    final password = _passwordController.text.trim();

                    if (username.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter username and password')),
                      );
                      return;
                    }

                    final isValid = HiveService.validateUser(username, password);

                    if (isValid) {
                      Navigator.pushReplacementNamed(context, '/');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid username or password')),
                      );
                    }
                  },


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
