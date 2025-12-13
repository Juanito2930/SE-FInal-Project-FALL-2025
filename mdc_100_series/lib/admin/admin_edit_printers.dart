import 'package:flutter/material.dart';
import 'package:shrine/services/hive_service.dart';
import '/model/product.dart';
import 'dart:math';

class AddEditPrinterPage extends StatefulWidget {
  final Map<String, dynamic>? product;
  final dynamic hiveKey;

  const AddEditPrinterPage({
    Key? key,
    this.product,
    this.hiveKey,
  }) : super(key: key);

  @override
  State<AddEditPrinterPage> createState() => _AddEditPrinterPageState();
}

int _getRandomImageId() {
  final random = Random();
  return random.nextInt(6); // matches your 0–5 image assets
}

class _AddEditPrinterPageState extends State<AddEditPrinterPage> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  Category _category = Category.laser;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.product?['name'] ?? '');
    _priceController =
        TextEditingController(text: widget.product?['price']?.toString() ?? '');
    _category = widget.product != null
        ? Category.values.firstWhere(
            (c) => c.name == widget.product!['category'],
            orElse: () => Category.laser,
          )
        : Category.laser;
  }

  void _save() {
    final productMap = {
      'id': widget.product?['id'] ?? _getRandomImageId(),
      'name': _nameController.text,
      'price': int.parse(_priceController.text),
      'category': _category.name,
    };

    if (widget.hiveKey == null) {
      HiveService.addPrinter(productMap);
    } else {
      HiveService.updatePrinter(widget.hiveKey, productMap);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? "Add Printer" : "Edit Printer"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Printer Name"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Price"),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<Category>(
              value: _category,
              decoration: const InputDecoration(labelText: "Category"),
              items: Category.values
                  .where((c) => c != Category.all)
                  .map(
                    (c) => DropdownMenuItem(
                      value: c,
                      child: Text(c.name.toUpperCase()),
                    ),
                  )
                  .toList(),
              onChanged: (val) => setState(() => _category = val!),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: _save,
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
