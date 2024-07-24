import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/cart.dart';
import 'package:vows/screens/shoppingcart.dart';
import 'package:vows/screens/venuesscreen.dart';
import 'package:badges/badges.dart' as badges;

class VenuesDetailedScreen extends StatelessWidget {
  const VenuesDetailedScreen({super.key});

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
                builder: (context) => const Venues(),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Image.asset('assets/image1.jpg'),
              ),
            ),
            const SizedBox(height: 20),
            Image.asset('assets/image2.jpg'),
            const SizedBox(height: 20),
            Image.asset('assets/image3.jpg'),
          ],
        ),
      ),
    );
  }
}
