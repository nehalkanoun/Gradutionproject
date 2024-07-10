import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/cardsscreen.dart';
import 'package:vows/screens/drinksscreen.dart';
import 'package:vows/screens/foodscreen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vows/screens/shoppingcart.dart';
import 'package:vows/screens/venuesscreen.dart';

import 'package:vows/widgets/card.dart';

class Randomproducts {
  static Future<List<Map<String, dynamic>>> fetchRandomProducts() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/random-products/'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'] as List<dynamic>;
      return jsonData
          .map((product) => {
                'title': product['username'],
                'subtitle': product['name'],
                'price': product['price'].toString(),
              })
          .toList();
    } else {
      throw Exception('Failed to fetch random products');
    }
  }
}

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 101, 143, 193),
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
          const Padding(
            padding: EdgeInsets.only(right: 27.0, top: 20, bottom: 15),
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
                    image: const AssetImage('assets/venues.jpg'),
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
                    image: const AssetImage('assets/cards.jpg'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const Cards(),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: CategoryBox(
                    text: 'المشروبات',
                    image: const AssetImage('assets/drinks.jpg'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const Drinks(),
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
                    image: const AssetImage('assets/food.jpg'),
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
          const Padding(
            padding: EdgeInsets.only(right: 20.0, top: 10, bottom: 20),
            child: Text(
              "المنتجات",
              style: TextStyle(fontSize: 20),
              textDirection: TextDirection.rtl,
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: Randomproducts.fetchRandomProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final products = snapshot.data!;
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 12.0, right: 12.0),
                        child: ProductCard(
                          title: product['title'],
                          subtitle: product['subtitle'],
                          price: product['price'],
                          imageUrl:
                              "vows/assets/سان سابيستيان-vigo.jpg", // Replace with the appropriate asset name
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
                  );
                }
              },
            ),
          )
        ]));
  }
}

class CategoryBox extends StatelessWidget {
  final String text;
  final ImageProvider image;
  final VoidCallback onPressed;

  const CategoryBox({
    super.key,
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
