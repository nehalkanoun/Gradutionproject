import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/drinksscreen.dart';
import 'package:vows/screens/shoppingcart.dart';
import 'package:vows/widgets/card.dart';

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
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => const drinks(),
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
              "المشروبات",
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
                  title = 'كافي دانيا';
                  subtitle = 'كروافل ';
                  price = '5د.ل';
                  imageUrl = 'assets/croffle.jpg';
                  break;
                case 1:
                  title = 'كافي دانيا';
                  subtitle = 'ايس كريم فيريرو';
                  price = '2د.ل';
                  imageUrl = 'assets/ferreroicecream.jpg';
                  break;
                case 2:
                  title = 'كافي دانيا';
                  subtitle = 'يوقو كراميل';
                  price = '6د.ل';
                  imageUrl = 'assets/yugocrameal.jpg';
                  break;
                case 3:
                  title = 'كافي دانيا';
                  subtitle = 'عصير طبيعي';
                  price = '5د.ل';
                  imageUrl = 'assets/freshjuice.jpg';
                  break;
                case 4:
                  title = 'كافي دانيا';
                  subtitle = 'ايس كريم بستاشيو';
                  price = '4د.ل';
                  imageUrl = 'assets/pestashioicecream.jpg';
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
                            builder: (context) => const shoppingcart()),
                        (route) => false);
                  },
                ),
              );
            },
          ),
        ));
  }
}
