import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'login.dart';
// import 'package:shrine/colors.dart';

import 'model/product.dart';
import 'cart.dart';
import 'model/products_repository.dart';
import 'model/product_detail_page.dart';
import 'supplemental/symmetric_view.dart';

class HomePage extends StatefulWidget {

final Category category;
  const HomePage({this.category = Category.all, Key? key}) : super(key: key);

   @override
  Widget CategoryFilter_(BuildContext context) {
    // TODO: Pass Category variable to AsymmetricView (104)
    return SymmetricView(
      products: ProductsRepository.loadProducts(category),
    );
  }
  
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {


  List<Widget> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(widget.category);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

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
          // color: coconutBrown,
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
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        product.name,
                        style: theme.textTheme.titleLarge,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
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
//--------------



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