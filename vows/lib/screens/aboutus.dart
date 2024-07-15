import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/cart.dart';
import 'package:vows/screens/settings.dart';
import 'package:badges/badges.dart' as badges;
import 'package:vows/screens/shoppingcart.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

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
                builder: (context) => const Settings(),
              ),
            );
          },
        ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: badges.Badge(
                badgeContent: Text(
                  cartItems.length.toString(),
                  style: TextStyle(color: Colors.black),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const ShoppingCart(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              "معلومات عنا",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: Text(
              "Introducing our innovative wedding app, designed to simplify and enhance every aspect of your wedding planning journey. With our app, you can effortlessly organize and manage all the essential details of your special day, ensuring a seamless and unforgettable wedding experience. From creating and sharing digital invitations to managing guest lists and RSVPs, our app streamlines the entire invitation process. It also provides a comprehensive wedding checklist, helping you stay on top of tasks such as choosing vendors, selecting the perfect venue, and arranging transportation. With a built-in budget tracker, you can easily monitor your wedding expenses and keep them within your desired range. Additionally, our app offers a curated selection of wedding inspiration, including stunning themes, décor ideas, and real wedding stories, to fuel your creativity. Stay connected with your guests through our interactive messaging platform, allowing for seamless communication and updates. As your big day approaches, our app will help you create personalized timelines and schedules, ensuring that everything runs smoothly. With its user-friendly interface and intuitive features, our wedding app is your ultimate companion for planning and organizing a beautiful, stress-free wedding."),
        ),
      ),
    );
  }
}
