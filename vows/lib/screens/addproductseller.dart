import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart'; // Import permission_handler

import 'package:vows/screens/sellerhome.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddproductState createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  String _productName = '';
  String _productPrice = '';
  File? _imageFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    // Check for permissions
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } else {
      // Handle the case when permissions are denied
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Storage permission is required to pick images.')),
      );
    }
  }

  Future<File> _saveImageToAssets(File image) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = image.path.split('/').last;
    final savedImage = await image.copy('${appDir.path}/$fileName');
    return savedImage;
  }

  Future<void> _saveProduct() async {
    // Debugging statements to check field values
    print('Product Name: $_productName');
    print('Product Price: $_productPrice');
    print('Image File: $_imageFile');

    if (_productName.isEmpty || _productPrice.isEmpty || _imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields and select an image.')),
      );
      return;
    }

    final savedImage = await _saveImageToAssets(_imageFile!);

    final url = 'https://yourapi.com/api/products/';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': _productName,
        'price': double.parse(_productPrice),
        'seller_ID': '2', // Replace with actual seller ID
        'image': savedImage.path,
      }),
    );

    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product added successfully!')),
      );
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        CupertinoPageRoute(builder: (context) => const Sellerhome()),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to add product. Please try again.')),
      );
    }
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
              "  اضافة منتج",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 430),
          child: Row(
            children: [
              Expanded(
                child: Container(
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: _imageFile != null
                                ? Image.file(_imageFile!, fit: BoxFit.cover)
                                : Image.asset(
                                    'assets/addimage.png',
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'كافي فيقو',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(height: 2.0),
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
                            const SizedBox(height: 2.0),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 101, 143, 193),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32.0,
                                  vertical: 16.0,
                                ),
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
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
