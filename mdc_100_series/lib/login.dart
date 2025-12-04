// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/mammal.png', width: 150, height: 150),
                const SizedBox(height: 50.0),
                const Text(
                'GorillaPrintShop',
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
                label: Center(child: Text('Username')),
                floatingLabelBehavior: FloatingLabelBehavior.never,

                suffixIcon: Opacity(
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

                label: Center(child: Text('Password')),
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
                ),
                // TODO: Add an elevation to NEXT (103)
                // TODO: Add a beveled rectangular border to NEXT (103)
                ElevatedButton(
                  child: const Text('LOGIN'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
