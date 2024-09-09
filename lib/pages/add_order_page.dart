import 'package:flutter/material.dart';

class AddOrderPage extends StatefulWidget {
  @override
  _AddOrderPageState createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  final _formKey = GlobalKey<FormState>();
  String dishName = '';
  int votes = 0;
  String notes = '';
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Dish Name'),
                onSaved: (value) {
                  dishName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Votes'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  votes = int.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Notes'),
                onSaved: (value) {
                  notes = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  quantity = int.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitOrder,
                child: Text('Add Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitOrder() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Xử lý thêm đơn hàng vào cơ sở dữ liệu (chưa làm Firebase)
      Navigator.pop(context); // Quay lại trang trước sau khi thêm
    }
  }
}
