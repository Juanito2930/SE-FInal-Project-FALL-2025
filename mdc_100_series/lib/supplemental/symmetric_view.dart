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
import 'package:intl/intl.dart';
import 'package:path/path.dart';
// import 'package:shrine/colors.dart';

// import '/login.dart';

import '../model/product.dart';
// import 'product_columns.dart';
// import '/model/products_repository.dart';

import '/cart.dart';

class SymmetricView extends StatelessWidget {
  final List<Product> products;

   const SymmetricView({Key? key, required this.products}) : super(key: key);

  //List<Product> products = ProductsRepository.loadProducts(Category.all);

  List<Card> _buildGridCards(BuildContext context)
  {
    if (products.isEmpty)
    {
      return const <Card>[];
    }
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());


    return products.map((product)
    {
      return Card
      (
        clipBehavior: Clip.antiAlias,
        child: Column
        (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>
          [
            AspectRatio
            (
              aspectRatio: 18 / 11,
              child: Image.asset
              (
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
          ),
          Expanded
          (
            child: Padding
            (
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column
              (
                // TODO: Align labels to the bottom and center (103)
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                // TODO: Change innermost Column (103)
                children: <Widget>
                [
                  Text
                  (
                    product.name,
                    style: theme.textTheme.titleLarge,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8.0),
                  Text
                  (
                    formatter.format(product.price),
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }).toList();
}

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body: GridView.count
      (
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
      ),
      
      resizeToAvoidBottomInset: false,
      floatingActionButton: _shoppingCartButton(),
    );
  }


  Widget _shoppingCartButton()
  {
    return FloatingActionButton
    (
      onPressed: () 
      {
        Navigator.push
        (
          context as BuildContext,
          MaterialPageRoute(builder:(context) => const CartPage()),
        );
        // TODO: hook into DatabaseService here
      },
      child: Image.asset
      (
        'assets/shoppingcart.png',
        width: 24,
        height: 24,
      ),
    );
  }
}


  /*
        List.generate(_listItemCount(products.length), (int index) {
      double width = .59 * MediaQuery.of(context).size.width;
      Widget column;
      if (index % 2 == 0) {
        /// Even cases
        int bottom = _evenCasesIndex(index);
        column = TwoProductCardColumn(
            bottom: products[bottom],
            top: products.length - 1 >= bottom + 1
                ? products[bottom + 1]
                : null);
        width += 32.0;
      } else {
        /// Odd cases
        column = OneProductCardColumn(
          product: products[_oddCasesIndex(index)],
        );
      }
      return SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: column,
        ),
      );
    }).toList();
  }

  int _evenCasesIndex(int input) {
    /// The operator ~/ is a cool one. It's the truncating division operator. It
    /// divides the number and if there's a remainder / decimal, it cuts it off.
    /// This is like dividing and then casting the result to int. Also, it's
    /// functionally equivalent to floor() in this case.
    return input ~/ 2 * 3;
  }

  int _oddCasesIndex(int input) {
    assert(input > 0);
    return (input / 2).ceil() * 3 - 1;
  }

  int _listItemCount(int totalItems) {
    if (totalItems % 3 == 0) {
      return totalItems ~/ 3 * 2;
    } else {
      return (totalItems / 3).ceil() * 2 - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(0.0, 34.0, 16.0, 44.0),
      children: _buildColumns(context),
    );
  }
}



    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(

                  // TODO: Align labels to the bottom and center (103)
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // TODO: Change innermost Column (103)
                  children: <Widget>[
                    Text(
                      product.name,
                      style: theme.textTheme.titleLarge,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: GridView.count
      (
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
      ),
      
      resizeToAvoidBottomInset: false,
      floatingActionButton: _shoppingCartButton(),
    );

  }


  Widget _shoppingCartButton() {
    return FloatingActionButton(
      onPressed: () {

       Navigator.push(
          context,
          MaterialPageRoute(builder:(context) => const CartPage()),
        );
        // TODO: hook into DatabaseService here
        
      },
      child: Image.asset(
      'assets/shoppingcart.png',
      width: 24,
      height: 24,
      ),
    );
  }
}


*/