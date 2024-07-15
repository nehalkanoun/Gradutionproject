import 'package:flutter/material.dart';

class Shoppingcartcard extends StatefulWidget {
  final String? sellerName;
  final String? productName;
  final String? price;
  final String? imageUrl;
  final int? amount;
  final VoidCallback? onpressed;

  Shoppingcartcard({
    this.sellerName,
    this.productName,
    this.price,
    this.amount,
    this.imageUrl,
    this.onpressed,
  });

  @override
  _ShoppingcartcardState createState() => _ShoppingcartcardState();
}

class _ShoppingcartcardState extends State<Shoppingcartcard> {
  final quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.amount != null) {
      quantityController.text = widget.amount.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 185,
        maxHeight: 140,
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
                  image: widget.imageUrl != null
                      ? AssetImage(widget.imageUrl!)
                      : AssetImage('assets/default.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                width: 100,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.sellerName ?? '',
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
                          widget.productName ?? '',
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
                      Text(widget.price ?? '',
                          style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
