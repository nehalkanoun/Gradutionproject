import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/cart.dart';

import 'package:vows/screens/home.dart';
import 'package:vows/screens/shoppingcart.dart';
import 'package:vows/screens/venuesdetailedscreen.dart';
import 'package:vows/widgets/maincard.dart';
import 'package:badges/badges.dart' as badges;

class Venues extends StatelessWidget {
  const Venues({super.key});

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
                style: const TextStyle(color: Colors.black),
              ),
              child: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const ShoppingCart(customerId: '',),
                    ),
                  );
                },
              ),
            ),
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
              title: 'Alamira',
              location: 'فينيسيا',
              cardText: 'This is the text for the first card.',
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const VenuesDetailedScreen(),
                  ),
                );
              },
              imageUrl: 'assets/alamiravenue.jpg',
            ),
          ),
        ],
      ),
    );
  }
}
