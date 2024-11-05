import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddInventoryScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  AddInventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Item')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Item Name')),
            TextField(
                controller: quantityController,
                decoration: const InputDecoration(labelText: 'Quantity')),
            ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('inventory').add({
                  'name': nameController.text,
                  'quantity': int.parse(quantityController.text),
                });
                Navigator.pop(context);
              },
              child: const Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
