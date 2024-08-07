import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/cart.dart';
import 'package:vows/screens/daniascreen.dart';
import 'package:vows/screens/vigoscreen.dart';
import 'package:vows/screens/home.dart';
import 'package:vows/screens/shoppingcart.dart';
import 'package:vows/widgets/buttombarcus.dart';
import 'package:vows/widgets/maincard.dart';
import 'package:badges/badges.dart' as badges;

class Drinks extends StatelessWidget {
  const Drinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Bottomnavigationbar(
      selectedIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 101, 143, 193),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                context,
                CupertinoPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: badges.Badge(
                badgeContent: Text(
                  cartItems.length.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const ShoppingCart(
                          customerId: '',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
          title: const Center(
            child: Text(
              "المشروبات",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(color: Colors.white),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Maincards(
                title: 'vigo ',
                location: 'الوكالات',
                cardText: 'This is the text for the first card.',
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const Vigoscreen(),
                    ),
                  );
                },
                imageUrl: 'assets/vigo.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Maincards(
                title: ' Dania ',
                location: 'فينيسيا',
                cardText: 'This is the text for the second card.',
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const Daniascreen(),
                    ),
                  );
                },
                imageUrl: 'assets/dania.jpg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
