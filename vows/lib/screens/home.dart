import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:vows/helpers/consts.dart';
import 'package:vows/screens/cardsscreen.dart';
import 'package:vows/screens/cart.dart';
import 'package:vows/screens/drinksscreen.dart';
import 'package:vows/screens/foodscreen.dart';
import 'package:vows/screens/shoppingcart.dart';

import 'package:vows/screens/venuesscreen.dart';
import 'package:vows/widgets/buttombarcus.dart';
import 'package:vows/widgets/categorybox.dart';
import 'package:vows/widgets/homecard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Randomproducts {
  static Future<List<Map<String, dynamic>>> fetchRandomProducts() async {
    final response =
        await http.get(Uri.parse('$backendURL/api/random-products/'));
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
      print(response.body);
      throw Exception('Failed to fetch random products');
    }
  }
}

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Bottomnavigationbar(
      selectedIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 101, 143, 193),

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
          // ignore: prefer_const_constructors
          title: Center(
            child: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "الصفحة الرئيسية",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
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
                    child: Categorybox(
                      text: 'القاعات',
                      image: const AssetImage('assets/venues.jpg'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const Venues(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Categorybox(
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
                    child: Categorybox(
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
                    child: Categorybox(
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
                          child: Homecard(
                            title: product['title'],
                            subtitle: product['subtitle'],
                            price: double.parse(product['price']),
                            imageUrl:
                                "assets/${product['subtitle']}-${product['title']}.jpg",
                            onAddToCart: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const ShoppingCart(
                                          customerId: '',
                                        )),
                              );
                            },
                            onCartUpdated: () {},
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
