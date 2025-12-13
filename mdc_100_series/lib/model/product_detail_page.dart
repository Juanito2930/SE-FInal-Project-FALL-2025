import 'package:flutter/material.dart';
import 'package:shrine/colors.dart';
import 'package:shrine/home.dart';
import 'product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: gorillaGrey,
        title: Text(product.name,style: TextStyle(color: bananaYellow)),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.2,
                child: Image.asset(
                  product.assetName,
                  package: product.assetPackage,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 20),

              Text(
                product.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: 10),

              Text(
                "\$${product.price}",
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const SizedBox(height: 20),

              Text(
                "More product details",
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              const SizedBox(height: 30),


                SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Image.asset('assets/shoppingcart.png', width: 20, height: 20,),
                  label: const Text("Add to Cart", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  onPressed: () {

                    // Cart logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${product.name} added to cart"),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                    Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => HomePage()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
