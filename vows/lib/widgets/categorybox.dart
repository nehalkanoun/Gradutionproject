import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Categorybox extends StatelessWidget {
  final String text;
  final ImageProvider image;
  final VoidCallback onPressed;

  Categorybox({
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
