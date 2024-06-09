import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Editproductcard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imageUrl;
  final Function(String, String, String) onEditPressed;

  Editproductcard({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
    required this.onEditPressed,
    required bool isEditing,
  });

  @override
  _EditproductcardState createState() => _EditproductcardState();
}

class _EditproductcardState extends State<Editproductcard> {
  late String _title;
  late String _subtitle;
  late String _price;
  late bool _isEditing;
  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _subtitle = widget.subtitle;
    _price = widget.price;
    _isEditing = false;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _title,
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
                    _isEditing
                        ? TextField(
                            controller: TextEditingController(text: _subtitle),
                            onChanged: (value) => _subtitle = value,
                          )
                        : Text(
                            _subtitle,
                            style: TextStyle(fontSize: 15),
                          ),
                  ],
                ),
              ),
              _isEditing
                  ? TextField(
                      controller: TextEditingController(text: _price),
                      onChanged: (value) => _price = value,
                    )
                  : Text(_price, style: TextStyle(fontSize: 13)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isEditing = !_isEditing;
                        if (!_isEditing) {
                          widget.onEditPressed(_title, _subtitle, _price);
                        }
                      });
                    },
                    child: _isEditing
                        ? Icon(Icons.check)
                        : Icon(Icons.edit_outlined),
                  ),
                  SizedBox(width: 8.0),
                  GestureDetector(child: Icon(Icons.delete_outline_rounded)),
                ],
              ),
            ],
          ),
        ))
      ]),
    );
  }
}
