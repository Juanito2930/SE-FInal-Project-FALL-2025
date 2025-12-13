// // import 'package:hive/hive.dart';
// // import 'package:shrine/model/product.dart';
// // import 'package:shrine/model/products_repository.dart';

// // class HiveService {
// //   static const String userBox = 'users';
// //   static const String printerBox = 'printers';

// //   static Future<void> openBoxes() async {
// //     await Hive.openBox(userBox);
// //     await Hive.openBox(printerBox);
// //   }

// //   // ---------- SEED DEFAULT PRINTERS ----------
// //   static void seedPrintersIfEmpty() {
// //     final box = Hive.box(printerBox);
// //     if (box.isNotEmpty) return;

// //     final defaults = ProductsRepository.loadProducts(Category.all);

// //     for (final p in defaults) {
// //       box.add({
// //         'id': p.id,
// //         'name': p.name,
// //         'price': p.price,
// //         'description': p.description,
// //         'category': p.category.name,
// //       });
// //     }
// //   }

// //   // ---------- USERS ----------
// //   static bool validateUser(String username, String password) {
// //     final box = Hive.box(userBox);

// //     for (var user in box.values) {
// //       if (user['username'] == username &&
// //           user['password'] == password) {
// //         return true;
// //       }
// //     }
// //     return false;
// //   }

// //   static void addUser(
// //     String fullname,
// //     String email,
// //     String username,
// //     String password,
// //   ) {
// //     Hive.box(userBox).add({
// //       'fullname': fullname,
// //       'email': email,
// //       'username': username,
// //       'password': password,
// //     });
// //   }

// //   //-------USER ORDER HISTORY------



// //   // ---------- PRINTERS ----------
// //   static List<Map<String, dynamic>> getPrinters() {
// //     final box = Hive.box(printerBox);

// //     return box.keys.map((key) {
// //       final value = box.get(key) as Map<String, dynamic>;
// //       return {
// //         ...value,
// //         '_key': key, // IMPORTANT: Hive key
// //       };
// //     }).toList();
// //   }

// //   static void addPrinter(Map<String, dynamic> printer) {
// //     Hive.box(printerBox).add(printer);
// //   }

// //   static void updatePrinter(dynamic key, Map<String, dynamic> printer) {
// //     Hive.box(printerBox).put(key, printer);
// //   }

// //   static void deletePrinter(dynamic key) {
// //     Hive.box(printerBox).delete(key);
// //   }

// //   static void resetCatalog() {
// //     final box = Hive.box(printerBox);
// //     box.clear();
// //     seedPrintersIfEmpty();
// //   }
// // }

//----------------------------------------------------------------------------------------------------
// import 'package:hive/hive.dart';
// import 'package:shrine/model/product.dart';
// import 'package:shrine/model/products_repository.dart';

// class HiveService {
//   static const String userBox = 'users';
//   static const String printerBox = 'printers';

//   static Future<void> openBoxes() async {
//     await Hive.openBox(userBox);
//     await Hive.openBox(printerBox);
//   }

//   // ---------- SEED DEFAULT PRINTERS ----------
//   static void seedPrintersIfEmpty() {
//     final box = Hive.box(printerBox);
//     if (box.isNotEmpty) return;

//     final defaults = ProductsRepository.loadProducts(Category.all);

//     for (final p in defaults) {
//       box.add({
//         'id': p.id,
//         'name': p.name,
//         'price': p.price,
//         'description': p.description,
//         'category': p.category.name,
//       });
//     }
//   }

//   // ---------- USERS ----------
//   static bool validateUser(String username, String password) {
//     final box = Hive.box(userBox);

//     for (var user in box.values) {
//       if (user['username'] == username &&
//           user['password'] == password) {
//         return true;
//       }
//     }
//     return false;
//   }

//   static void addUser(
//     String fullname,
//     String email,
//     String username,
//     String password,
//   ) {
//     Hive.box(userBox).add({
//       'fullname': fullname,
//       'email': email,
//       'username': username,
//       'password': password,
//       'orders': <Map<String, dynamic>>[], // initialize empty order history
//     });
//   }

//   // ---------- USER ORDER HISTORY ----------


//   static void addOrder(String username, Product product) {
//     final box = Hive.box(userBox);

//     // Find the user by username
//     final userKey = box.keys.firstWhere(
//       (key) => box.get(key)['username'] == username,
//       orElse: () => null,
//     );

//     if (userKey != null) {
//       final user = Map<String, dynamic>.from(box.get(userKey));
//       final orders = List<Map<String, dynamic>>.from(user['orders'] ?? []);

//       orders.add({
//         'id': product.id,
//         'name': product.name,
//         'price': product.price,
//         'description': product.description,
//         'category': product.category.name,
//         'timestamp': DateTime.now().toIso8601String(),
//       });

//       user['orders'] = orders;
//       box.put(userKey, user);
//     }
//   }
//   //---------------------------working^^------------------------------------------
// // hive_service.dart
// // static void addOrder(String username, List<CartItem> cartItems, int totalPrice) {
// //   final box = Hive.box(userBox);

// //   final userKey = box.keys.firstWhere(
// //     (key) => box.get(key)['username'] == username,
// //     orElse: () => null,
// //   );

// //   if (userKey != null) {
// //     final user = Map<String, dynamic>.from(box.get(userKey));
// //     final orders = List<Map<String, dynamic>>.from(user['orders'] ?? []);

// //     orders.add({
// //       'items': cartItems.map((item) => {
// //         'productName': item.productName,
// //         'quantity': item.quantity,
// //         'price': item.price,
// //       }).toList(),
// //       'totalPrice': totalPrice,
// //       'timestamp': DateTime.now().toIso8601String(),
// //     });

// //     user['orders'] = orders;
// //     box.put(userKey, user);
// //   }
// // }
// //--------------------------------------------------------------
//   static List<Map<String, dynamic>> getOrders(String username) {
//     final box = Hive.box(userBox);

//     final user = box.values.firstWhere(
//       (u) => u['username'] == username,
//       orElse: () => null,
//     );

//     if (user != null && user['orders'] != null) {
//       return List<Map<String, dynamic>>.from(user['orders']);
//     }
//     return [];
//   }

//   // ---------- PRINTERS ----------
//   static List<Map<String, dynamic>> getPrinters() {
//     final box = Hive.box(printerBox);

//     return box.keys.map((key) {
//       final value = box.get(key) as Map<String, dynamic>;
//       return {
//         ...value,
//         '_key': key, // IMPORTANT: Hive key
//       };
//     }).toList();
//   }

//   static void addPrinter(Map<String, dynamic> printer) {
//     Hive.box(printerBox).add(printer);
//   }

//   static void updatePrinter(dynamic key, Map<String, dynamic> printer) {
//     Hive.box(printerBox).put(key, printer);
//   }

//   static void deletePrinter(dynamic key) {
//     Hive.box(printerBox).delete(key);
//   }

//   static void resetCatalog() {
//     final box = Hive.box(printerBox);
//     box.clear();
//     seedPrintersIfEmpty();
//   }
// }

//------------------------------------------------------------------------------------------

import 'package:hive/hive.dart';
import '../model/product.dart';
import '../model/products_repository.dart';
import '../cart/cart_model.dart';

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
        'description': p.description,
        'category': p.category.name,
        'imagePath': p.imagePath,
      });
    }
  }

  // ---------- USERS ----------
  static bool validateUser(String username, String password) {
    final box = Hive.box(userBox);

    for (var user in box.values) {
      if (user['username'] == username && user['password'] == password) {
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
      'orders': <Map<String, dynamic>>[],
    });
  }

  // ---------- USER ORDER HISTORY ----------
  static void addOrder(String username, List<CartItem> cartItems, int totalPrice) {
    final box = Hive.box(userBox);

    final userKey = box.keys.firstWhere(
      (key) => box.get(key)['username'] == username,
      orElse: () => null,
    );

    if (userKey != null) {
      final user = Map<String, dynamic>.from(box.get(userKey));
      final orders = List<Map<String, dynamic>>.from(user['orders'] ?? []);

      orders.add({
        'items': cartItems.map((item) => {
          'productName': item.productName,
          'quantity': item.quantity,
          'price': item.price,
        }).toList(),
        'totalPrice': totalPrice,
        'timestamp': DateTime.now().toIso8601String(),
      });

      user['orders'] = orders;
      box.put(userKey, user);
    }
  }

  static List<Map<String, dynamic>> getOrders(String username) {
    final box = Hive.box(userBox);

    final user = box.values.firstWhere(
      (u) => u['username'] == username,
      orElse: () => null,
    );

    if (user != null && user['orders'] != null) {
      return List<Map<String, dynamic>>.from(user['orders']);
    }
    return [];
  }

  // ---------- PRINTERS ----------
  static List<Map<String, dynamic>> getPrinters() {
    final box = Hive.box(printerBox);

    return box.keys.map((key) {
      final value = box.get(key) as Map<String, dynamic>;
      return {
        ...value,
        '_key': key,
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