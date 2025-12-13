import 'package:flutter/material.dart';
import 'package:shrine/model/products_repository.dart';
// import 'package:shrine/model/product.dart';
import 'admin_edit_printers.dart';

class AdminProductsPage extends StatefulWidget {
  const AdminProductsPage({Key? key}) : super(key: key);

  @override
  State<AdminProductsPage> createState() => _AdminProductsPageState();
}

class _AdminProductsPageState extends State<AdminProductsPage> {
  void _refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final products = ProductsRepository.allProducts;

    return Scaffold(
      appBar: AppBar(title: const Text("Manage Printers")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddEditPrinterPage(),
            ),
          );
          _refresh();
        },
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(product.name),
              subtitle: Text(
                "${product.category.name.toUpperCase()} • \$${product.price}",
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AddEditPrinterPage(
                            product: product,
                            index: index,
                          ),
                        ),
                      );
                      _refresh();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      ProductsRepository.deleteProduct(index);
                      _refresh();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Printer deleted'),
                          action: SnackBarAction(
                            label: 'UNDO',
                             onPressed: (){
                              ProductsRepository.restoreLastDeleted();
                              _refresh();
                             },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

