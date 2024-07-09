import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Orderscard extends StatefulWidget {
  final String id;
  final String name;
  final String number;
  final String imageUrl;
  final String price;
  final String description;
  final String amount;

  Orderscard({
    required this.id,
    required this.name,
    required this.number,
    required this.price,
    required this.description,
    required this.amount,
    required this.imageUrl,
  });

  @override
  _Orderscard createState() => _Orderscard();
}

class _Orderscard extends State<Orderscard> {
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 100, maxHeight: 150),
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
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Row(
                children: [
                  Text(
                    widget.id,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    widget.description,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              Text(widget.number, style: TextStyle(fontSize: 12)),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.amount,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Text(
                widget.price,
                style: TextStyle(fontSize: 12),
              ),
            ]),
          ))
        ],
      ),
    );
  }
}