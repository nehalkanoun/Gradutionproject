import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.only(
                left: 16, right: 16, top: 16, bottom: 430),
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
                          child: Image.asset(
                            'assets/addimage.png',
                            fit: BoxFit.cover,
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
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => const Sellerhome()),
                                );
                              },
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
                ))
              ],
            ),
          ),
        ));
  }
}
