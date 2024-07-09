import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/addproductseller.dart';
import 'package:vows/screens/cardsdetailedscreen.dart';
import 'package:vows/screens/drinksdetailedcsreen.dart';
import 'package:vows/screens/drinksscreen.dart';
import 'package:vows/screens/editproductseller.dart';
import 'package:vows/screens/fooddetailedscreen.dart';
import 'package:vows/screens/foodscreen.dart';
import 'package:vows/screens/home.dart';
import 'package:vows/screens/login.dart';
import 'package:vows/screens/sellerhome.dart';
import 'package:vows/screens/settings.dart';
import 'package:vows/screens/shoppingcart.dart';
import 'package:vows/screens/test.dart';
import 'package:vows/screens/vendorsscreen.dart';
import 'package:vows/screens/venuesdetailedscreen.dart';

import 'package:vows/screens/venuesscreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 101, 143, 193),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset('assets/logo.png'),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 101, 143, 193))),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(builder: (context) => Editproduct()),
                      (route) => false);
                },
                child: const Text(
                  "انشاء حساب",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 101, 143, 193))),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(builder: (context) => const Home()),
                      (route) => false);
                },
                child: const Text(
                  "تسجيل دخول",
                  style: TextStyle(color: Colors.white),
                )),
            ElevatedButton(
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 101, 143, 193))),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const MyNavigationBar()),
                      (route) => false);
                },
                child: const Text(
                  " test",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
