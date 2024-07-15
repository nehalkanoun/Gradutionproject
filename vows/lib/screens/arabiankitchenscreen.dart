import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/cart.dart';
import 'package:vows/screens/foodscreen.dart';
import 'package:vows/screens/shoppingcart.dart';
import 'package:vows/widgets/card.dart';
import 'package:badges/badges.dart' as badges;

class Arabiankitchenscreen extends StatefulWidget {
  const Arabiankitchenscreen({super.key});

  @override
  State<Arabiankitchenscreen> createState() => _ArabiankitchenscreenState();
}

class _ArabiankitchenscreenState extends State<Arabiankitchenscreen> {
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
        body: Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              String title;
              String subtitle;
              String price;
              String imageUrl;

              switch (index) {
                case 0:
                  title = ' المطبخ العربي ';
                  subtitle = 'مكرونة باللحم بالمكسرات';
                  price = '6د.ل';
                  imageUrl = 'assets/arabiankitchenpasta.jpg';
                  break;
                case 1:
                  title = ' المطبخ العربي ';
                  subtitle = '  طبق رئيسي';
                  price = '10د.ل';
                  imageUrl = 'assets/araibiankitchenmaindish.jpg';
                  break;
                case 2:
                  title = ' المطبخ العربي ';
                  subtitle = 'طبق رئيسي';
                  price = '8د.ل';
                  imageUrl = 'assets/araibiankitchenmaindish2.jpg';
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
                    Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => ShoppingCart()),
                        (route) => false);
                  },
                  onCartUpdated: () {},
                ),
              );
            },
          ),
        ));
  }
}
