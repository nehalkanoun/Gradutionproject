import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/foodscreen.dart';
import 'package:vows/screens/shoppingcart.dart';
import 'package:vows/widgets/card.dart';

class Fooddetailedscreen extends StatelessWidget {
  const Fooddetailedscreen({super.key});
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
                  builder: (context) => const Food(),
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
              "الاكل",
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
                  title = ' جميره للتموين';
                  subtitle = 'مقبلات ';
                  price = '6د.ل';
                  imageUrl = 'assets/jumaira(appe).jpg';
                  break;
                case 1:
                  title = ' جميره للتموين';
                  subtitle = '  طبق رئيسي';
                  price = '6د.ل';
                  imageUrl = 'assets/jumaira(maindish).jpg';
                  break;
                case 2:
                  title = ' جميره للتموين';
                  subtitle = 'شربه ليبيه';
                  price = '8د.ل';
                  imageUrl = 'assets/jumairasoup.jpg';
                  break;
                case 3:
                  title = ' جميره للتموين';
                  subtitle = 'لحم بالصوص البني';
                  price = '7د.ل';
                  imageUrl = 'assets/meat_image.jpg';
                  break;
                case 4:
                  title = ' جميره للتموين';
                  subtitle = 'فواكه متنوعه';
                  price = '4د.ل';
                  imageUrl = 'assets/jumairafruitsalad.jpg';
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
