class CartItem {
  final String productName;
  int quantity;
  final int price;

  CartItem({
    required this.productName,
    required this.quantity,
    required this.price,
  });
}

class CartModel {
  static final List<CartItem> items = [];

  static void addItem(String name, int price) {
    final existing = items.where((i) => i.productName == name).toList();
    if (existing.isNotEmpty) {
      existing.first.quantity += 1;
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