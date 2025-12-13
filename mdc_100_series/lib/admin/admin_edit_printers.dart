import 'package:flutter/material.dart';
import 'package:shrine/model/products_repository.dart';
import '/model/product.dart';

class AddEditPrinterPage extends StatefulWidget {
  final Product? product;
  final int? index;

  const AddEditPrinterPage({Key? key, this.product, this.index})
      : super(key: key);

  @override
  State<AddEditPrinterPage> createState() => _AddEditPrinterPageState();
}

class _AddEditPrinterPageState extends State<AddEditPrinterPage> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  Category _category = Category.laser;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.product?.name ?? '');
    _priceController =
        TextEditingController(text: widget.product?.price.toString() ?? '');
    _category = widget.product?.category ?? Category.laser;
  }

  void _save() {
    final newProduct = Product(
      id: widget.product?.id ??
          DateTime.now().millisecondsSinceEpoch, // unique ID
      name: _nameController.text,
      price: int.parse(_priceController.text),
      category: _category,
      isFeatured: false,
    );

    if (widget.product == null) {
      ProductsRepository.addProduct(newProduct);
    } else {
      ProductsRepository.updateProduct(widget.index!, newProduct);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null
            ? "Add Printer"
            : "Edit Printer"),
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
