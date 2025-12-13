import 'package:flutter/material.dart';
import 'admin_edit_printers.dart';
import 'package:shrine/services/hive_service.dart';

class AdminProductsPage extends StatefulWidget {
  const AdminProductsPage({Key? key}) : super(key: key);

  @override
  State<AdminProductsPage> createState() => _AdminProductsPageState();
}

class _AdminProductsPageState extends State<AdminProductsPage> {
  void _refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final products = HiveService.getPrinters();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Printers"),
        actions: [
          IconButton(
            icon: const Icon(Icons.restart_alt),
            tooltip: 'Reset Catalog',
            onPressed: () {
              HiveService.resetCatalog();
              _refresh();
            },
          ),
        ],
      ),
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
              title: Text(product['name']),
              subtitle: Text(
                "${product['category'].toUpperCase()} • \$${product['price']}",
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
                            hiveKey: product['_key'],
                          ),
                        ),
                      );
                      _refresh();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      HiveService.deletePrinter(product['_key']);
                      _refresh();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Printer deleted')),
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
