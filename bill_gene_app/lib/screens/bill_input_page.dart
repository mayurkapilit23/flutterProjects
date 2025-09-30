import 'package:bill_gene_app/pdf/pdf_generator.dart';
import 'package:flutter/material.dart';
import '../models/bill_item.dart';


class BillInputPage extends StatefulWidget {
  const BillInputPage({super.key});

  @override
  State<BillInputPage> createState() => _BillInputPageState();
}

class _BillInputPageState extends State<BillInputPage> {
  final customerController = TextEditingController();
  final List<BillItem> items = [];
  final nameController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();

  void addItem() {
    final name = nameController.text;
    final quantity = int.tryParse(quantityController.text) ?? 0;
    final price = double.tryParse(priceController.text) ?? 0.0;

    if (name.isNotEmpty && quantity > 0 && price > 0) {
      setState(() {
        items.add(BillItem(name: name, quantity: quantity, price: price));
        nameController.clear();
        quantityController.clear();
        priceController.clear();
      });
    }
  }

  void handleGeneratePDF() async {
    await generatePDF(customerController.text, items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Bill')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: customerController,
                decoration: const InputDecoration(labelText: 'Customer Name'),
              ),
              const SizedBox(height: 10),
              const Text('Add Item:'),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Item Name'),
              ),
              TextField(
                controller: quantityController,
                decoration: const InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: addItem,
                child: const Text('Add Item'),
              ),
              const SizedBox(height: 10),
              const Text('Items:'),
              ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    title: Text('${item.name} x${item.quantity} @ \₹${item.price}'),
                    subtitle: Text('Total: \₹${item.quantity * item.price}'),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: handleGeneratePDF,
                child: const Text('Generate & Share PDF'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
