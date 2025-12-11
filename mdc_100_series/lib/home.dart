
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'login.dart';

import 'package:shrine/colors.dart';

import 'model/product.dart';
import 'cart.dart';
import 'model/products_repository.dart';
import 'supplemental/symmetric_view.dart';


class HomePage extends StatelessWidget {
  // TODO: Add a variable for Category (104)
  final Category category;

  const HomePage({this.category = Category.all, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Pass Category variable to AsymmetricView (104)
    return SymmetricView(
      products: ProductsRepository.loadProducts(category),
    );
  }
}


/*
class HomePage extends StatefulWidget {
  final Category category;

  const HomePage({this.category = Category.all, Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final DatabaseService _databaseService = DatabaseService.instance;

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