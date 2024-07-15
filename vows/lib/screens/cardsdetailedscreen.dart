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
              "الكروت",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              String title;
              String subtitle;
              String price;
              String imageUrl;

              switch (index) {
                case 0:
                  title = 'الفخامه الملكيه';
                  subtitle = 'كرت';
                  price = '10د.ل';
                  imageUrl = 'assets/card1.jpg';
                  break;
                case 1:
                  title = 'الفخامه الملكيه';
                  subtitle = 'كرت';
                  price = '4د.ل';
                  imageUrl = 'assets/card2.jpg';
                  break;
                case 2:
                  title = 'الفخامه الملكيه';
                  subtitle = 'كرت';
                  price = '6د.ل';
                  imageUrl = 'assets/card3.jpg';
                  break;
                case 3:
                  title = 'الفخامه الملكيه';
                  subtitle = 'كرت';
                  price = '10د.ل';
                  imageUrl = 'assets/card4.jpg';
                  break;
                case 4:
                  title = 'الفخامه الملكيه';
                  subtitle = 'كرت';
                  price = '6د.ل';
                  imageUrl = 'assets/card5.jpg';
                  break;
                default:
                  title = 'الفخامه الملكيه';
                  subtitle = 'كرت';
                  price = '6د.ل';
                  imageUrl = 'https://example.com/default.jpg';
              }

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
                      CupertinoPageRoute(builder: (context) => ShoppingCart()),
                    );
                  },
                  onCartUpdated: () {},
                ),
              );
            },
          ),
        ));
  }
}
