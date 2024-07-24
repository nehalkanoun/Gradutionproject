import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/cart.dart';
import 'package:vows/screens/drinksscreen.dart';
import 'package:vows/screens/shoppingcart.dart';
import 'package:vows/widgets/card.dart';
import 'package:badges/badges.dart' as badges;

class Daniascreen extends StatefulWidget {
  const Daniascreen({super.key});

  @override
  State<Daniascreen> createState() => _DaniascreenState();
}

class _DaniascreenState extends State<Daniascreen> {
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
                  builder: (context) => const Drinks(),
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
              "المشروبات",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            String title;
            String subtitle;
            String priceString;
            String imageUrl;
            double price;
            switch (index) {
              case 0:
                title = 'Dania';
                subtitle = 'عصير طبيعي';
                priceString = '5';
                imageUrl = 'assets/freshjuice.jpg';
                break;

              default:
                title = 'Dania ';
                subtitle = '//';
                priceString = '6';
                imageUrl = 'https://example.com/default.jpg';
            }
            price = double.parse(priceString);
            return Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 12.0, right: 12.0),
              child: ProductCard(
                title: title,
                subtitle: subtitle,
                price: price,
                imageUrl: imageUrl,
                onAddToCart: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => const ShoppingCart(customerId: '',)),
                  );
                },
                onCartUpdated: () {
                  setState(() {});
                },
              ),
            );
          },
        ));
  }
}
