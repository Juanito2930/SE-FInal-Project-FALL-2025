// // Copyright 2018-present the Flutter authors. All Rights Reserved.
// //
// // Licensed under the Apache License, Version 2.0 (the "License");
// // you may not use this file except in compliance with the License.
// // You may obtain a copy of the License at
// //
// // http://www.apache.org/licenses/LICENSE-2.0
// //
// // Unless required by applicable law or agreed to in writing, software
// // distributed under the License is distributed on an "AS IS" BASIS,
// // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// // See the License for the specific language governing permissions and
// // limitations under the License.

// import 'product.dart';

// class ProductsRepository {
//   static final List<Product> _allProducts = [
//       Product(
//         category: Category.laser,
//         id: 0,
//         isFeatured: true,
//         name: 'Brother HL L2320D',
//         price: 300,
//         description: 'The Brother HL L2320D is a compact monochrome laser printer designed for reliable everyday printing. It offers fast print speeds and automatic duplex (two sided) printing, making it efficient for home or office use. With a 250 sheet paper tray, it handles standard workloads without frequent refills. Its simple USB connectivity ensures easy setup and operation. Priced at \$300, it delivers solid performance and durability at a reasonable cost.',
//       ),
//       Product(
//         category: Category.inkjet,
//         id: 1,
//         isFeatured: true,
//         name: 'Canon PIXMA TR160',
//         price: 220,
//          description: 'The Canon PIXMA TR160 is a versatile inkjet printer built for everyday home and office tasks. It delivers sharp text and vibrant color prints, making it suitable for documents, photos, and creative projects. With wireless connectivity, it supports easy printing from laptops, tablets, and smartphones. Its compact design helps save space while still offering reliable performance. Priced at \$220, it provides a balanced mix of functionality and affordability',
//       ),
//       Product(
//         category: Category.inkjet,
//         id: 2,
//         isFeatured: true,
//         name: 'Epson Expression Premium',
//         price: 300,
//          description: 'The Epson Expression Premium is a high‑quality inkjet printer designed for both documents and photos. It produces sharp text and rich, vibrant colors, making it ideal for creative projects and everyday printing. With wireless connectivity, it supports easy printing from computers, tablets, and smartphones. Its sleek design fits well in home or office spaces while delivering consistent performance. Priced at \300, it offers a strong balance of versatility and value.',
//       ),
//       Product(
//         category: Category.laser,
//         id: 3,
//         isFeatured: true,
//         name: 'HP LaserJet 1012',
//         price: 85,
//          description: 'The HP LaserJet 1012 is a compact monochrome laser printer built for simple, everyday printing needs. It delivers crisp text and reliable performance, making it suitable for home offices or small workspaces. With straightforward USB connectivity, setup and operation are quick and easy. Its lightweight design ensures it does not take up much desk space while still handling routine tasks efficiently. Priced at \$85, it offers dependable printing at an affordable cost',
//       ),
//       Product(
//         category: Category.laser,
//         id: 4,
//         isFeatured: true,
//         name: 'HP LaserJet 4050tn',
//         price: 450,
//          description: 'The HP LaserJet 4050tn is a robust monochrome laser printer designed for heavy duty office environments. It delivers fast, high volume printing with sharp text quality, making it ideal for businesses that need consistent performance. Equipped with multiple paper trays, it supports large workloads and flexible media handling. Its durable build ensures long term reliability even under demanding use. Priced at \$450, it offers professional grade printing power and efficiency',
//       ),
//       Product(
//         category: Category.dotmatrix,
//         id: 5,
//         isFeatured: true,
//         name: 'Oki Microline 590',
//         price: 450,
//          description: 'The Oki Microline 590 is a durable dot matrix printer built for demanding business environments. It excels at handling multi part forms and continuous feed paper, making it ideal for warehouses, banks, and industrial settings. Known for its rugged design, it delivers consistent performance even under heavy workloads. Its straightforward connectivity and reliable mechanics ensure long term usability. Priced at \$450, it offers dependable printing power for specialized professional needs.',
//       ),
//     ];

//     static final List<Product> _deletedProducts =[];

//     static List<Product> loadProducts(Category category) {
//     if (category == Category.all) {
//       return List<Product>.from(_allProducts);
//     } else {
//       return _allProducts.where((p) => p.category == category).toList();
//     }
//   }

//   // For admin
//   static void addProduct(Product product) {
//     _allProducts.add(product);
//   }

//   static void updateProduct(int index, Product product) {
//     _allProducts[index] = product;
//   }

//   static void deleteProduct(int index) {
//     final removed = _allProducts.removeAt(index);
//     _deletedProducts.add(removed);
//   }

//   static bool restoreLastDeleted() {
//     if (_deletedProducts.isEmpty) return false;

//     _allProducts.add(_deletedProducts.removeLast());
//     return true;
//   }

//   static List<Product> get allProducts => _allProducts;

// }

import 'product.dart';

class ProductsRepository {
  static final List<Product> _allProducts = [
    Product(
      id: 0,
      name: 'Brother HL L2320D',
      price: 300,
      description:
          'The Brother HL L2320D is a compact monochrome laser printer designed for reliable everyday printing. It offers fast print speeds and automatic duplex printing, making it efficient for home or office use.',
      category: Category.laser,
      imagePath: 'assets/brother_12320d.jpg',
    ),
    Product(
      id: 1,
      name: 'Canon PIXMA TR160',
      price: 220,
      description:
          'The Canon PIXMA TR160 is a versatile inkjet printer built for everyday home and office tasks. It delivers sharp text and vibrant color prints, making it suitable for documents, photos, and creative projects.',
      category: Category.inkjet,
      imagePath: 'assets/canon_pixma_tri160.jpg',
    ),
    Product(
      id: 2,
      name: 'Epson Expression Premium',
      price: 300,
      description:
          'The Epson Expression Premium is a high‑quality inkjet printer designed for both documents and photos. It produces sharp text and rich, vibrant colors, making it ideal for creative projects and everyday printing.',
      category: Category.inkjet,
      imagePath: 'assets/epson_expression_premium.jpg',
    ),
    Product(
      id: 3,
      name: 'HP LaserJet 1012',
      price: 85,
      description:
          'The HP LaserJet 1012 is a compact monochrome laser printer built for simple, everyday printing needs. It delivers crisp text and reliable performance, making it suitable for home offices or small workspaces.',
      category: Category.laser,
      imagePath: 'assets/hp_laserjet_1012.jpg',
    ),
    Product(
      id: 4,
      name: 'HP LaserJet 4050tn',
      price: 450,
      description:
          'The HP LaserJet 4050tn is a robust monochrome laser printer designed for heavy‑duty office environments. It delivers fast, high‑volume printing with sharp text quality, making it ideal for businesses.',
      category: Category.laser,
      imagePath: 'assets/hp_laserjet_4050tn.jpg',
    ),
    Product(
      id: 5,
      name: 'Oki Microline 590',
      price: 450,
      description:
          'The Oki Microline 590 is a durable dot matrix printer built for demanding business environments. It excels at handling multi‑part forms and continuous feed paper, making it ideal for warehouses and banks.',
      category: Category.dotmatrix,
      imagePath: 'assets/oki_microline_590.jpg',
    ),
  ];

  static List<Product> loadProducts(Category category) {
    if (category == Category.all) {
      return List<Product>.from(_allProducts);
    } else {
      return _allProducts.where((p) => p.category == category).toList();
    }
  }
}