// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/helpers/consts.dart';
import 'package:vows/screens/home.dart';
import 'package:vows/widgets/buttombarcus.dart';
import 'package:vows/widgets/shoppingcart_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'cart.dart';

class ShoppingCart extends StatefulWidget {
  final String customerId; // Add customerId

  const ShoppingCart({super.key, required this.customerId});

  @override
  // ignore: library_private_types_in_public_api
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  double _calculateTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  Future<void> _confirmOrder() async {
    double total = _calculateTotal();
    final response = await http.post(
      Uri.parse('$backendURL/api/carts/'),
      body: jsonEncode({
        'customer_ID': widget.customerId,
        'total_price': total,
        'status': 'Waiting',
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Order confirmed successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to confirm order')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double total = _calculateTotal();

    return Bottomnavigationbar(
      selectedIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 101, 143, 193),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
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
                      price: item.price.toString(),
                      imageUrl: item.imageUrl,
                      amount: item.quantity,
                      onpressed: () {},
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100, right: 33),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    ' الاجمالي : ${total.toStringAsFixed(2)} د.ل',
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(20)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 101, 143, 193))),
                      onPressed:
                          _confirmOrder, // Call the confirm order function
                      child: const Text(
                        "تأكيدالطلب",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
