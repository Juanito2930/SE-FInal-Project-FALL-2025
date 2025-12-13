import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/product.dart';
import 'cart/cart.dart';
import 'model/products_repository.dart';
import 'model/product_detail_page.dart';
import 'services/hive_service.dart';

class HomePage extends StatefulWidget {
  final Category category;
  const HomePage({this.category = Category.all, Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  List<Product> _loadProductsFromHive() {
    final printerMaps = HiveService.getPrinters();

    List<Product> products = printerMaps.map((p) {
      return Product(
        id: p['id'],
        name: p['name'],
        price: p['price'],
        category: Category.values.firstWhere(
          (c) => c.name == p['category'],
          orElse: () => Category.laser,
        ),
        isFeatured: false,
      );
    }).toList();

    if (widget.category != Category.all) {
      products = products
          .where((p) => p.category == widget.category)
          .toList();
    }

    return products;
  }

  List<Widget> _buildGridCards(BuildContext context) {
    final products = _loadProductsFromHive();

    if (products.isEmpty) {
      return const [
        Center(
          child: Text(
            'No printers available',
            style: TextStyle(fontSize: 18),
          ),
        )
      ];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toString(),
    );

    return products.map((product) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(product: product),
            ),
          );
        },
        child: Card(
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
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.print, size: 80),
                    );
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        product.name,
                        style: theme.textTheme.titleLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
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
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
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
      
      tooltip: 'Cart',

      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CartPage()),
        );
      },
      child: Image.asset(
        'assets/shoppingcart.png',
        width: 24,
        height: 24,
      ),
    );
  }
}
