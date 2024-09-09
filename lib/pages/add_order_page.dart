import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddOrderPage extends StatefulWidget {
  @override
  _AddOrderPageState createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  final _dishNameController = TextEditingController();
  final _votesController = TextEditingController();
  final _noteController = TextEditingController();
  final _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Order'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _dishNameController,
              decoration: InputDecoration(labelText: 'Dish Name'),
            ),
            TextField(
              controller: _votesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Votes'),
            ),
            TextField(
              controller: _noteController,
              decoration: InputDecoration(labelText: 'Note'),
            ),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Quantity'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addOrder,
              child: Text('Add Order'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addOrder() async {
    final dishName = _dishNameController.text;
    final votes = int.tryParse(_votesController.text) ?? 0;
    final note = _noteController.text;
    final quantity = int.tryParse(_quantityController.text) ?? 0;

    if (dishName.isEmpty || votes < 0 || quantity < 0) {
      // Display an error message if validation fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please provide valid data')),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('orders').add({
        'dishName': dishName,
        'votes': votes,
        'note': note,
        'quantity': quantity,
      });

      // Navigate back to the order list page
      Navigator.pop(context);
    } catch (e) {
      // Handle errors if any
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add order: $e')),
      );
    }
  }
}
