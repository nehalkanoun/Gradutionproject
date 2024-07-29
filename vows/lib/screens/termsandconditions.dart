import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/cart.dart';
import 'package:vows/screens/settings.dart';
import 'package:vows/screens/shoppingcart.dart';
import 'package:badges/badges.dart' as badges;

class Termsandconditions extends StatelessWidget {
  const Termsandconditions({super.key});

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
                style: const TextStyle(color: Colors.black),
              ),
              child: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const ShoppingCart(
                        customerId: '',
                      ),
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
              "الشروط والاحكام",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: Text(
              "Acceptance of Terms : By downloading, accessing, or using this mobile app the App, you agree to be bound by the following terms and conditions. If you do not agree to these terms, please refrain from using the App"
              "User Behavior and Access: You agree to use the App in compliance with applicable laws and regulations. You shall not engage in any activities that may disrupt or interfere with the functioning of the App or infringe upon the rights of others"
              "Copyright and Intellectual Property : The App and its associated content, including but not limited to text, graphics, images, logos, and software, are the intellectual property of [Your Company Name] and are protected by copyright and other intellectual property laws. All rights not expressly granted herein are reserved"
              "Certain components or libraries used in the App may be subject to open source licenses. Any applicable open source licenses are provided in accordance with their respective terms and conditions. To the extent any open source license terms conflict with these terms and conditions, the open source license terms shall prevail with respect to those components"),
        ),
      ),
    );
  }
}
