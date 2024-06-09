import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imageUrl;
  final VoidCallback onAddToCart;

  ProductCard({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.onAddToCart,
    required this.imageUrl,
  });

  @override
  _ProductCard createState() => _ProductCard();
}

class _ProductCard extends State<ProductCard> {
  int quantity = 1;

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 140,
        maxHeight: 130,
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
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          const Spacer(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.subtitle,
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              Text(widget.price, style: TextStyle(fontSize: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    onPressed: widget.onAddToCart,
                    child: const Text(
                      " اضافه ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      child: Center(
                        child: GestureDetector(
                          onTap: _increaseQuantity,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              width: 20,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 210, 210, 210),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 2.0),
                  Text(
                    '$quantity',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 2.0),
                  GestureDetector(
                    onTap: _decreaseQuantity,
                    child: Container(
                      width: 20,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 210, 210, 210),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.remove,
                          color: Colors.black,
                          size: 10,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ))
        ],
      ),
    );
  }
}
