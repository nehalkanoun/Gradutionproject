import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/arabiankitchenscreen.dart';
import 'package:vows/screens/cart.dart';
import 'package:vows/screens/jumairadetailedscreen.dart';
import 'package:vows/screens/home.dart';
import 'package:badges/badges.dart' as badges;
import 'package:vows/screens/shoppingcart.dart';
import 'package:vows/widgets/maincard.dart';

class Food extends StatelessWidget {
  const Food({super.key});

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
                style: TextStyle(color: Colors.black),
              ),
              child: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const ShoppingCart(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
        title: const Center(
          child: Text(
            "الاكل",
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
              title: 'جميره للتموين',
              location: 'الهواري',
              cardText: 'This is the text for the first card.',
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const Jumairadetailedscreen(),
                  ),
                );
              },
              imageUrl: 'assets/jumeira.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Maincards(
              title: 'المطبخ العربي',
              location: 'الرحبه',
              cardText: 'This is the text for the second card.',
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const Arabiankitchenscreen(),
                  ),
                );
              },
              imageUrl: 'assets/arabiankitchen.jpg',
            ),
          ),
        ],
      ),
    );
  }
}
