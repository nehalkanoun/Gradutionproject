import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/home.dart';
import 'package:vows/widgets/shoppingcart_card.dart';

import 'cart.dart'; 

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
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
                builder: (context) => const Home(),
              ),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 33, top: 70),
            child: Text(
              "الطلب من",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 12.0,
                    right: 12.0,
                  ),
                  child: Shoppingcartcard(
                    sellerName: item.title,
                    productName: item.subtitle,
                    price: item.price,
                    imageUrl: item.imageUrl,
                    amount: item.quantity,
                    onpressed:
                        () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
