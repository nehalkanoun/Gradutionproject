import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/drinksdetailedcsreen.dart';
import 'package:vows/screens/home.dart';
import 'package:vows/screens/shoppingcart.dart';
import 'package:vows/widgets/maincard.dart';

class drinks extends StatelessWidget {
  const drinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 101, 143, 193),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                builder: (context) => const Home(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            color: Colors.black,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => const shoppingcart(),
                ),
              );
            },
          ),
        ],
        title: const Center(
          child: Text(
            "المشروبات",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Maincards(
              imageAsset: 'vigo.png',
              title: 'فيقو كافي ',
              location: 'الوكالات',
              cardText: 'This is the text for the first card.',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const drinksdetailedscreens(),
                  ),
                );
              },
              imageUrl: 'vigo.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Maincards(
              imageAsset: 'dania.jpg',
              title: ' دانية ',
              location: 'فينيسيا',
              cardText: 'This is the text for the second card.',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const drinksdetailedscreens(),
                  ),
                );
              },
              imageUrl: 'dania.jpg',
            ),
          ),
        ],
      ),
    );
  }
}
