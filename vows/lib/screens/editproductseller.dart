import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vows/helpers/consts.dart';
import 'package:vows/screens/sellerhome.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  bool _isEditing = false;
  int _editingIndex = -1;
  List<Map<String, dynamic>> _products = [];

  final _productNameController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchSellerProducts();
  }

  Future<void> _fetchSellerProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final sellerId = prefs.getInt('id');
    final url = Uri.parse('$backendURL/api/get-product/$sellerId');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      setState(() {
        _products = List<Map<String, dynamic>>.from(responseData['data']);
      });
    } else {
      print(
          'Failed to fetch seller products. Status code: ${response.statusCode}');
    }
  }

  Future<void> _updateProduct(String productId) async {
    final url = Uri.parse('$backendURL/api/products/$productId');
    final updatedProduct = {
      'name': _productNameController.text,
      'price': double.parse(_priceController.text),
    };
    final response = await http.put(
      url,
      body: jsonEncode(updatedProduct),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      print(response.body);
      setState(() {
        _products[_editingIndex]['name'] = _productNameController.text;
        _products[_editingIndex]['price'] = double.parse(_priceController.text);
        _isEditing = false;
        _editingIndex = -1;
      });
    } else {
      print('Failed to update product. Status code: ${response.body}');
    }
  }

  Future<void> _deleteProduct(String productId, int index) async {
    final url = Uri.parse('$backendURL/api/products/$productId');
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      setState(() {
        _products.removeAt(index);
      });
    } else {
      print('Failed to delete product. Status code: ${response.body}');
    }
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _toggleEditing(int index) {
    setState(() {
      if (_isEditing && _editingIndex == index) {
        _isEditing = false;
        _editingIndex = -1;
        _productNameController.clear();
        _priceController.clear();
      } else {
        _isEditing = true;
        _editingIndex = index;
        _productNameController.text = _products[index]['name'];
        _priceController.text = _products[index]['price'].toString();
      }
    });
  }

  void _saveChanges() {
    if (_editingIndex >= 0 && _editingIndex < _products.length) {
      final productId = _products[_editingIndex]['id'].toString();
      _updateProduct(productId);
    } else {
      print('Invalid product index: $_editingIndex');
    }
  }

  void _showDeleteDialog(String productId, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Product'),
          content: Text('Are you sure you want to delete this product?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteProduct(productId, index);
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 101, 143, 193),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const Sellerhome(),
              ),
            );
          },
        ),
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              "تعديل منتج",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _toggleEditing(index),
            child: SizedBox(
              width: 250,
              height: 240,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (_isEditing && _editingIndex == index)
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: TextField(
                            controller: _productNameController,
                            textAlign: TextAlign.right,
                          ),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 10),
                          child: Text(_products[index]['name']),
                        ),
                      const SizedBox(height: 8.0),
                      if (_isEditing && _editingIndex == index)
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: TextField(
                            controller: _priceController,
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.number,
                          ),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 10),
                          child: Text(
                              "${_products[index]['price'].toStringAsFixed(2)}"),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (_isEditing && _editingIndex == index)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => _toggleEditing(index),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            ElevatedButton(
                              onPressed: _saveChanges,
                              child: const Text(
                                "Save",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete,
                                color: Color.fromARGB(154, 18, 18, 18)),
                            onPressed: () => _showDeleteDialog(
                                _products[index]['id'].toString(), index),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
