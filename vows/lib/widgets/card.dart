import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/cart.dart';
import 'package:vows/screens/shoppingcart.dart';

class ProductCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final double price;
  final String imageUrl;
  final VoidCallback onAddToCart;
  final String? productid;
  final VoidCallback onCartUpdated;

  ProductCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.onAddToCart,
    required this.imageUrl,
    required this.onCartUpdated,
    this.productid,
  });

  @override
  _ProductCard createState() => _ProductCard();
}

class _ProductCard extends State<ProductCard> {
  int quantity = 1;
  final quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    quantityController.text = quantity.toString();
  }

  void _addToCart() {
    final item = CartItem(
      title: widget.title,
      subtitle: widget.subtitle,
      price: widget.price,
      imageUrl: widget.imageUrl,
      quantity: int.parse(quantityController.text),
    );

    setState(() {
      cartItems.add(item);
    });

    widget.onCartUpdated();

    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => const ShoppingCart(customerId: '',)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 100,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 160,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.imageUrl),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              height: 150,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.subtitle,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('د.ل',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                      const SizedBox(width: 2),
                      Text(widget.price.toString(),
                          style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(0.4),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 101, 143, 193),
                          ),
                        ),
                        onPressed: _addToCart,
                        child: const Text(
                          " اضافه ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(right: 2, top: 5),
                        child: SizedBox(
                          width: 60,
                          height: 35,
                          child: TextField(
                            controller: quantityController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.right,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'الكمية',
                              labelStyle: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            onChanged: (value) {
                              quantity = int.tryParse(value) ?? 1;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
