import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:vows/screens/cardsscreen.dart';
import 'package:vows/screens/drinksscreen.dart';
import 'package:vows/screens/foodscreen.dart';

import 'package:vows/screens/login.dart';
import 'package:vows/screens/shoppingcart.dart';
import 'package:vows/screens/venuesscreen.dart';
import 'package:vows/widgets/buttombar.dart';

import 'package:vows/widgets/card.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 101, 143, 193),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => const Login()),
                (route) => false);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            color: Colors.black,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const shoppingcart()),
                  (route) => false);
            },
          ),
        ],
        title: const Center(
          child: Text(
            "الصفحة الرئيسية",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.only(right: 27.0, top: 20, bottom: 15),
          child: Text(
            "الفئات",
            style: TextStyle(fontSize: 20),
            textDirection: TextDirection.rtl,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20),
                child: CategoryBox(
                  text: 'القاعات',
                  image: AssetImage('assets/venues.jpg'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const venues(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: CategoryBox(
                  text: 'الكروت',
                  image: AssetImage('assets/cards.jpg'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const cards(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: CategoryBox(
                  text: 'المشروبات',
                  image: AssetImage('assets/drinks.jpg'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const drinks(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20.0,
                ),
                child: CategoryBox(
                  text: 'الأكل',
                  image: AssetImage('assets/food.jpg'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const Food(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, top: 10, bottom: 20),
          child: Text(
            "المنتجات",
            style: TextStyle(fontSize: 20),
            textDirection: TextDirection.rtl,
          ),
        ),
        Expanded(
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
                  title = 'كافي فيقو';
                  subtitle = 'ايس كراميل';
                  price = '10د.ل';
                  imageUrl = 'assets/icedcramel.jpg';
                  break;
                case 2:
                  title = ' جميره للتموين';
                  subtitle = 'شربه ليبيه';
                  price = '8د.ل';
                  imageUrl = 'assets/jumairasoup.jpg';
                  break;
                case 3:
                  title = 'الفخامه الملكيه';
                  subtitle = 'كرت';
                  price = '6د.ل';
                  imageUrl = 'assets/card5.jpg';
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
        ),
        Buttombar(
            title1: "الاعدادات",
            title2: "الموردين",
            title3: "الصفحه الرئيسيه",
            imageUrl1: "settingsicon.png",
            imageUrl2: "vendors.png",
            imageUrl3: "homeicon.png")
      ]),
    );
  }
}

class CategoryBox extends StatelessWidget {
  final String text;
  final ImageProvider image;
  final VoidCallback onPressed;

  CategoryBox({
    required this.text,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 80,
        height: 55,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Image(
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.3),
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
