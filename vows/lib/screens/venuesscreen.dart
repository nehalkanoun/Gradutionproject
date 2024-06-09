import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:vows/screens/home.dart';
import 'package:vows/screens/shoppingcart.dart';
import 'package:vows/screens/venuesdetailedscreen.dart';
import 'package:vows/widgets/maincard.dart';

class venues extends StatelessWidget {
  const venues({super.key});

  void initState() {
    Timer(const Duration(seconds: 3), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 101, 143, 193),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                builder: (context) => const Home(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            color: Colors.black,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => const shoppingcart(),
                ),
              );
            },
          ),
        ],
        title: const Center(
          child: Text(
            "القاعات",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Maincards(
              imageAsset: 'alamiravenue.jpg',
              title: 'قاعة الاميره',
              location: 'فينيسيا',
              cardText: 'This is the text for the first card.',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const VenuesDetailedScreen(),
                  ),
                );
              },
              imageUrl: 'alamiravenue.jpg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Maincards(
              imageAsset: 'venesia1.jpg',
              title: 'قاعة فينيسيا1',
              location: 'فينيسيا',
              cardText: 'This is the text for the second card.',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const VenuesDetailedScreen(),
                  ),
                );
              },
              imageUrl: 'venesia1.jpg',
            ),
          ),
        ],
      ),
    );
  }
}
