import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/cardsscreen.dart';
import 'package:vows/screens/cart.dart';
import 'package:vows/screens/shoppingcart.dart';
import 'package:vows/widgets/card.dart';
import 'package:badges/badges.dart' as badges;

class Cardsdetailedscreen extends StatefulWidget {
  const Cardsdetailedscreen({super.key});

  @override
  State<Cardsdetailedscreen> createState() => _CardsdetailedscreenState();
}

class _CardsdetailedscreenState extends State<Cardsdetailedscreen> {
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
                  builder: (context) => const Cards(),
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
              "الكروت",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            String title;
            String subtitle;
            String priceString;
            String imageUrl;
            double price;

            switch (index) {
              case 0:
                title = 'Alfakama cards';
                subtitle = 'كرت';
                priceString = '10';
                imageUrl = 'assets/كرت دعوة-Alfakama cards.jpg';
                break;
              case 1:
                title = 'Alfakama cards';
                subtitle = 'كرت';
                priceString = '4';
                imageUrl = 'assets/card2.jpg';
                break;
              case 2:
                title = 'Alfakama cards';
                subtitle = 'كرت';
                priceString = '6';
                imageUrl = 'assets/card3.jpg';
                break;
              case 3:
                title = 'Alfakama cards';
                subtitle = 'كرت';
                priceString = "15";
                imageUrl = 'assets/card4.jpg';
                break;
              case 4:
                title = 'Alfakama cards';
                subtitle = 'كرت';
                priceString = '6';
                imageUrl = 'assets/card5.jpg';
                break;
              default:
                title = 'Alfakama cards';
                subtitle = 'كرت';
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
