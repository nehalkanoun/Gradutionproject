import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/sellerhome.dart';
import 'package:vows/widgets/orderscard.dart';

class Ordersscreen extends StatelessWidget {
  const Ordersscreen({super.key});

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
                  builder: (context) => const Sellerhome(),
                ),
              );
            },
          ),
          title: const Center(
            child: Text(
              "الطلبات",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Expanded(
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              String id;
              String name;
              String number;
              String price;
              String description;
              String amount;
              String imageUrl;

              switch (index) {
                case 0:
                  id = ' 1';
                  description = 'طبق رئيسي';
                  name = 'نهال كانون ';
                  number = '0922401013 ';
                  price = '600د.ل';
                  amount = 'قطعه 30 ';
                  imageUrl = 'assets/jumaira(appe).jpg';
                  break;
                case 1:
                  id = ' 2';
                  description = 'طبق رئيسي';
                  name = 'علي محمد ';
                  number = '0922401111 ';
                  amount = '10 قطعه ';
                  price = '400د.ل';

                  imageUrl = 'assets/jumaira(maindish).jpg';

                  break;

                default:
                  id = 'الفخامه الملكيه';
                  description = 'طبق رئيسي';
                  name = 'كرت';
                  number = 'كرت';
                  price = '6د.ل';
                  amount = '6د.ل';
                  imageUrl = 'https://example.com/default.jpg';
              }

              return Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 12.0, right: 12.0),
                child: Orderscard(
                  id: id,
                  name: name,
                  number: number,
                  amount: amount,
                  description: description,
                  price: price,
                  imageUrl: imageUrl,
                ),
              );
            },
          ),
        ));
  }
}
