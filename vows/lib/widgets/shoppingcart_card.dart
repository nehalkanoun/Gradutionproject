import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Shoppingcartcard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imageUrl;

  Shoppingcartcard({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
  });

  @override
  _ShoppingcartcardState createState() => _ShoppingcartcardState();
}

class _ShoppingcartcardState extends State<Shoppingcartcard> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 185,
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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.imageUrl),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        const Spacer(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
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
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              Text(widget.price, style: TextStyle(fontSize: 13)),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '$quantity',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    GestureDetector(
                      onTap: _increaseQuantity,
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
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ))
      ]),
    );
  }
}
