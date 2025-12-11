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
import 'package:shrine/colors.dart';

import 'home.dart';
import 'login.dart';
import 'backdrop.dart';

import 'model/product.dart';

import 'category_menu_page.dart';

// TODO: Convert ShrineApp to stateful widget (104)
class GorillaApp extends StatefulWidget {
  const GorillaApp({Key? key}) : super(key: key);

  @override
  State<GorillaApp> createState() => _GorillaAppState();
}

class _GorillaAppState extends State<GorillaApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gorilla Printer Shop',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
       // TODO: Change to a Backdrop with a HomePage frontLayer (104)
'/': (BuildContext context) => Backdrop(
     // TODO: Make currentCategory field take _currentCategory (104)
     currentCategory: Category.all,
     // TODO: Pass _currentCategory for frontLayer (104)
     frontLayer: HomePage(category: _currentCategory),
     // TODO: Change backLayer field value to CategoryMenuPage (104)
     backLayer: CategoryMenuPage(
                currentCategory: _currentCategory,
                onCategoryTap: _onCategoryTap,
     ),
     frontTitle: Text('GORILLA PRINTER SHOP'),
     backTitle: Text('MENU'),
),
        // TODO: Make currentCategory field take _currentCategory (104)
        // TODO: Pass _currentCategory for frontLayer (104)
        
        // TODO: Change backLayer field value to CategoryMenuPage (104)
      },
      // TODO: Customize the theme (103)
      theme: _gorillaTheme,
    );
  }
}

// TODO: Build a Gorilla Theme (103)
final ThemeData _gorillaTheme = _buildGorillaTheme();

ThemeData _buildGorillaTheme() {
  final ThemeData base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: gorillaGrey,
      onPrimary: bananaYellow,
      secondary: coconutWhite,
      error: errorRed,
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: coconutWhite,
      backgroundColor: gorillaGrey,
    ),
    // TODO: Add the text themes (103)
    // TODO: Decorate the inputs (103)
    inputDecorationTheme: const InputDecorationTheme
    (
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide
        (
          width: 2.0,
          color: jungleGreen,
        ),
      ),
    ),
  );
}
// TODO: Build a Shrine Text Theme (103)
