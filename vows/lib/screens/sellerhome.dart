import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/addproductseller.dart';

import 'package:vows/screens/editproductseller.dart';
import 'package:vows/widgets/buttombarseller.dart';

class Sellerhome extends StatelessWidget {
  const Sellerhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Bottomnavigationbarseller(
      selectedIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 101, 143, 193),
          title: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: const Center(
              child: Text(
                "الصفحة الرئيسية",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 25),
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(20),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 101, 143, 193),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const Addproduct()),
                    (route) => false,
                  );
                },
                child: const Text(
                  " اضافة منتج",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 30.0),
            Padding(
              padding: const EdgeInsets.only(top: 60, right: 35),
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(20),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 101, 143, 193),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const EditProductScreen()),
                    (route) => false,
                  );
                },
                child: const Text(
                  " تعديل منتج",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
