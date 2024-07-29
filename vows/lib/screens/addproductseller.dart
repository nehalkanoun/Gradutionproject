import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vows/helpers/consts.dart';
import 'dart:convert';

import 'package:vows/screens/sellerhome.dart';
import 'package:vows/widgets/buttombarseller.dart';

class Addproduct extends StatefulWidget {
  final String sellerName;
  final int sellerId;

  const Addproduct({super.key, required this.sellerName, required this.sellerId});

  @override
  _AddproductState createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  String _productName = '';
  String _productPrice = '';

  Future<void> _saveProduct() async {
    if (_productName.isEmpty || _productPrice.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields.')),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final sellerId = prefs.getInt('id');
    final sellerName = prefs.getString('username');

    if (sellerId == null || sellerName == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to get seller details.')),
      );
      return;
    }

    final url = '$backendURL/api/products/';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': _productName,
        'price': double.parse(_productPrice),
        'seller_ID': sellerId,
      }),
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product added successfully!')),
      );
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => Sellerhome(
            sellerName: widget.sellerName,
            sellerId: widget.sellerId,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Failed to add product. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Bottomnavigationbarseller(
      selectedIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 101, 143, 193),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => Sellerhome(
                    sellerName: widget.sellerName,
                    sellerId: widget.sellerId,
                  ),
                ),
              );
            },
          ),
          title: const Center(
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                "اضافة منتج",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'المطبخ العربي',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _productName = value;
                        });
                      },
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      decoration: const InputDecoration(
                        hintText: 'اسم الصنف',
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(fontSize: 14.0),
                        contentPadding: EdgeInsets.only(right: 10.0),
                        border: InputBorder.none,
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _productPrice = value;
                        });
                      },
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        hintText: 'السعر',
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(fontSize: 14.0),
                        contentPadding: EdgeInsets.only(right: 10.0),
                        border: InputBorder.none,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 101, 143, 193),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: _saveProduct,
                      child: const Text(
                        'حفظ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
