import 'package:flutter/material.dart';
import 'checkout.dart';
// A simple cart item model
class CartItem {
  final String productName;
  int quantity;
  final int price; // price stored as integer

  CartItem({
    required this.productName,
    required this.quantity,
    required this.price,
  });
}

// A global cart list (for demo purposes)
// In production, replace with a provider, Riverpod, or database service
class CartModel {
  static final List<CartItem> items = [];

  static void addItem(String name, int price) {
    // If item already exists, increase quantity
    final existing = items.where((i) => i.productName == name).toList();
    if (existing.isNotEmpty) {
      existing.first.quantity += 1; // increment properly
    } else {
      items.add(CartItem(productName: name, quantity: 1, price: price));
    }
  }

  static void clear() {
    items.clear();
  }

  static int get totalPrice {
    return items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartItems = CartModel.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        leading: const Icon(Icons.print),
                        title: Text(item.productName),
                        subtitle: Text("Quantity: ${item.quantity}"),
                        trailing: Text("\$${item.price}"),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Total: \$${CartModel.totalPrice}",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {

                            Navigator.push( 
                              context,
                              MaterialPageRoute(builder: (context) => const CheckoutPage()),
                            
                            );
 
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          
                          child: const Text(
                            "Proceed to Checkout",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                                
                          ),

                         
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            CartModel.clear();
          });
        },
        child: const Icon(Icons.delete),
        tooltip: "Clear Cart",
      ),
    );
  }


}