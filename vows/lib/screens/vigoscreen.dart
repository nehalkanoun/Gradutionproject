import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/drinksscreen.dart';
import 'package:vows/screens/shoppingcart.dart';
import 'package:vows/widgets/card.dart';

class Vigoscreen extends StatefulWidget {
  const Vigoscreen({super.key});

  @override
  State<Vigoscreen> createState() => _VigoscreenState();
}

class _VigoscreenState extends State<Vigoscreen> {
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
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              color: Colors.black,
              onPressed: () {
                Navigator.push(
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
                  title = 'كافي فيقو';
                  subtitle = 'وايت موكا';
                  price = '8د.ل';
                  imageUrl = 'assets/whitemoka.jpg';
                  break;
                case 1:
                  title = 'كافي فيقو';
                  subtitle = 'ميلك شيك بستاشيو';
                  price = '6د.ل';
                  imageUrl = 'assets/milkshake.jpg';
                  break;
                case 2:
                  title = 'كافي فيقو';
                  subtitle = 'كراميل لاتي';
                  price = '10د.ل';
                  imageUrl = 'assets/caramellattejpg.jpg';
                  break;
                case 3:
                  title = 'كافي فيقو';
                  subtitle = 'عصير برتقال';
                  price = '15د.ل';
                  imageUrl = 'assets/orangejuice.jpg';
                  break;
                case 4:
                  title = 'كافي فيقو';
                  subtitle = 'ايس كراميل';
                  price = '10د.ل';
                  imageUrl = 'assets/icedcramel.jpg';
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
                      CupertinoPageRoute(
                          builder: (context) => const shoppingcart()),
                    );
                  },
                ),
              );
            },
          ),
        ));
  }
}
