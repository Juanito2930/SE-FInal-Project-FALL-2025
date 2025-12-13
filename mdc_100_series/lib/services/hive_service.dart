import 'package:hive/hive.dart';
import 'package:shrine/model/product.dart';
import 'package:shrine/model/products_repository.dart';

class HiveService {
  static const String userBox = 'users';
  static const String printerBox = 'printers';

  static Future<void> openBoxes() async {
    await Hive.openBox(userBox);
    await Hive.openBox(printerBox);
  }

  // ---------- SEED DEFAULT PRINTERS ----------
  static void seedPrintersIfEmpty() {
    final box = Hive.box(printerBox);
    if (box.isNotEmpty) return;

    final defaults = ProductsRepository.loadProducts(Category.all);

    for (final p in defaults) {
      box.add({
        'id': p.id,
        'name': p.name,
        'price': p.price,
        'category': p.category.name,
      });
    }
  }

  // ---------- USERS ----------
  static bool validateUser(String username, String password) {
    final box = Hive.box(userBox);

    for (var user in box.values) {
      if (user['username'] == username &&
          user['password'] == password) {
        return true;
      }
    }
    return false;
  }

  static void addUser(
    String fullname,
    String email,
    String username,
    String password,
  ) {
    Hive.box(userBox).add({
      'fullname': fullname,
      'email': email,
      'username': username,
      'password': password,
    });
  }

  // ---------- PRINTERS ----------
  static List<Map<String, dynamic>> getPrinters() {
    final box = Hive.box(printerBox);

    return box.keys.map((key) {
      final value = box.get(key) as Map<String, dynamic>;
      return {
        ...value,
        '_key': key, // IMPORTANT: Hive key
      };
    }).toList();
  }

  static void addPrinter(Map<String, dynamic> printer) {
    Hive.box(printerBox).add(printer);
  }

  static void updatePrinter(dynamic key, Map<String, dynamic> printer) {
    Hive.box(printerBox).put(key, printer);
  }

  static void deletePrinter(dynamic key) {
    Hive.box(printerBox).delete(key);
  }

  static void resetCatalog() {
    final box = Hive.box(printerBox);
    box.clear();
    seedPrintersIfEmpty();
  }
}
