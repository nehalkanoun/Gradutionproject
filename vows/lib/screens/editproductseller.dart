import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vows/helpers/consts.dart';
import 'package:vows/screens/sellerhome.dart';
import 'package:vows/widgets/buttombarseller.dart';

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
      _isEditing = !_isEditing;
      _editingIndex = _isEditing ? index : -1;

      if (_isEditing) {
        _productNameController.text = _products[index]['name'];
        _priceController.text = _products[index]['price'].toString();
      } else {
        _productNameController.clear();
        _priceController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Bottomnavigationbarseller(
      selectedIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 101, 143, 193),
          title: const Center(
            child: Text(
              "تعديل المنتجات",
              style: TextStyle(color: Colors.white),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              final sellerName = prefs.getString('name') ?? 'Unknown';
              final sellerId = prefs.getInt('id') ?? 0;
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => Sellerhome(
                    sellerName: sellerName,
                    sellerId: sellerId,
                  ),
                ),
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    final product = _products[index];

                    return Card(
                      elevation: 5,
                      child: ListTile(
                        title: _isEditing && _editingIndex == index
                            ? Column(
                                children: [
                                  TextField(
                                    controller: _productNameController,
                                    decoration: const InputDecoration(
                                        labelText: 'Product Name'),
                                  ),
                                  TextField(
                                    controller: _priceController,
                                    decoration:
                                        const InputDecoration(labelText: 'Price'),
                                    keyboardType: TextInputType.number,
                                  ),
                                  ElevatedButton(
                                    onPressed: () => _updateProduct(
                                        product['id'].toString()),
                                    child: const Text('Update Product'),
                                  ),
                                ],
                              )
                            : Text('Product: ${product['name']}'),
                        subtitle: _isEditing && _editingIndex == index
                            ? null
                            : Text('Price: ${product['price']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(_isEditing && _editingIndex == index
                                  ? Icons.cancel
                                  : Icons.edit),
                              onPressed: () => _toggleEditing(index),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _deleteProduct(
                                  product['id'].toString(), index),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
