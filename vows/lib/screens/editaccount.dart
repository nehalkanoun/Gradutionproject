import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/settings.dart';
import 'package:vows/screens/shoppingcart.dart';

class Editaccount extends StatelessWidget {
  const Editaccount({super.key});

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
                  builder: (context) => const Settings(),
                ),
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const shoppingcart(),
                  ),
                );
              },
            ),
          ],
          title: const Center(
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                "حسابك",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        body: Center(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 90),
            child: Text(
              "الاسم:",
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 90),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 4),
              ),
              textAlign: TextAlign.left,
              keyboardType: TextInputType.text,
              cursorColor: Colors.black,
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 90),
            child: Text(
              "البريد الالكتروني:",
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 90),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 4),
              ),
              textAlign: TextAlign.left,
              keyboardType: TextInputType.text,
              cursorColor: Colors.black,
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 90),
            child: Text(
              "الهاتف:",
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 90),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 4),
              ),
              textAlign: TextAlign.left,
              keyboardType: TextInputType.text,
              cursorColor: Colors.black,
            ),
          ),
          const SizedBox(
            height: 105,
          ),
          Center(
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
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const Settings()),
                );
              },
              child: const Text(
                " حفظ التغيير",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ])));
  }
}
