import 'package:flutter/material.dart';
import '../../models/item.dart';
import '../../utils/apiItem.dart';

class AddItemView extends StatefulWidget {
  @override
  _AddItemViewState createState() => _AddItemViewState();
}

class _AddItemViewState extends State<AddItemView> {
  final ApiItem apiItem = ApiItem();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama Barang'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Quantity'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: hargaController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Harga'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Item Saved'),
          content: Text('Item has been successfully saved.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Kembali ke layar sebelumnya
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _addItem() async {
    String namaBarang = namaController.text;
    int quantity = int.tryParse(quantityController.text) ?? 0;
    double harga = double.tryParse(hargaController.text) ?? 0.0;

    Item newItem = Item(
      namaBarang: namaBarang,
      quantity: quantity,
      harga: harga,
    );

    try {
      await apiItem.addItem(newItem);
      _showSuccessDialog();
      // Clear the text fields after saving
      namaController.clear();
      quantityController.clear();
      hargaController.clear();
    } catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to save item: $error'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
