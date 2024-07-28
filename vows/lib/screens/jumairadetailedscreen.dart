import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/cart.dart';
import 'package:vows/screens/foodscreen.dart';
import 'package:vows/screens/shoppingcart.dart';
import 'package:vows/widgets/card.dart';
import 'package:badges/badges.dart' as badges;

class Jumairadetailedscreen extends StatefulWidget {
  const Jumairadetailedscreen({super.key});

  @override
  State<Jumairadetailedscreen> createState() => _JumairadetailedscreenState();
}

class _JumairadetailedscreenState extends State<Jumairadetailedscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 101, 143, 193),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                context,
                CupertinoPageRoute(
                  builder: (context) => const Food(),
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
              "الاكل",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            String title;
            String subtitle;
            String priceString;
            String imageUrl;
            double price;

            switch (index) {
              case 0:
                title = ' Jumeira Catering';
                subtitle = 'مقبلات ';
                priceString = '10';
                imageUrl = 'assets/jumaira(appe).jpg';
                break;
              case 1:
                title = ' Jumeira Catering';
                subtitle = '  طبق رئيسي';
                priceString = '20';
                imageUrl = 'assets/jumaira(maindish).jpg';
                break;
              case 2:
                title = ' Jumeira Catering';
                subtitle = 'شربه ليبيه';
                priceString = '9';
                imageUrl = 'assets/شربه ليبيه-Jumeira Catering.jpg';
                break;

              case 3:
                title = ' Jumeira Catering';
                subtitle = 'فواكه متنوعه';
                priceString = "4";
                imageUrl = 'assets/jumairafruitsalad.jpg';
                break;
              default:
                title = 'Jumeira Catering';
                subtitle = '//';
                priceString = '//';
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
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const ShoppingCart(
                                customerId: '',
                              )),
                      (route) => false);
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
