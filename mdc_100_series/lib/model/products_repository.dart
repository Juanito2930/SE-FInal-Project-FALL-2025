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

import 'product.dart';

class ProductsRepository {
  static final List<Product> _allProducts = [
      Product(
        category: Category.laser,
        id: 0,
        isFeatured: true,
        name: 'Brother HL L2320D',
        price: 300,
      ),
      Product(
        category: Category.inkjet,
        id: 1,
        isFeatured: true,
        name: 'Canon PIXMA TR160',
        price: 220,
      ),
      Product(
        category: Category.inkjet,
        id: 2,
        isFeatured: true,
        name: 'Epson Expression Premium',
        price: 300,
      ),
      Product(
        category: Category.laser,
        id: 3,
        isFeatured: true,
        name: 'HP LaserJet 1012',
        price: 85,
      ),
      Product(
        category: Category.laser,
        id: 4,
        isFeatured: true,
        name: 'HP LaserJet 4050tn',
        price: 450,
      ),
      Product(
        category: Category.dotmatrix,
        id: 5,
        isFeatured: true,
        name: 'Oki Microline 590',
        price: 450,
      ),
    ];

    static final List<Product> _deletedProducts =[];

    static List<Product> loadProducts(Category category) {
    if (category == Category.all) {
      return List<Product>.from(_allProducts);
    } else {
      return _allProducts.where((p) => p.category == category).toList();
    }
  }

  // For admin
  static void addProduct(Product product) {
    _allProducts.add(product);
  }

  static void updateProduct(int index, Product product) {
    _allProducts[index] = product;
  }

  static void deleteProduct(int index) {
    final removed = _allProducts.removeAt(index);
    _deletedProducts.add(removed);
  }

  static bool restoreLastDeleted() {
    if (_deletedProducts.isEmpty) return false;

    _allProducts.add(_deletedProducts.removeLast());
    return true;
  }

  static List<Product> get allProducts => _allProducts;

}
