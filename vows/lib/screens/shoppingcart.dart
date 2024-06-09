import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/home.dart';
import 'package:vows/widgets/shoppingcart_card.dart';

class shoppingcart extends StatelessWidget {
  const shoppingcart({super.key});

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
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.only(right: 33, top: 70),
          child: Text(
            "الطلب من",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              String title;
              String subtitle;
              String price;
              String imageUrl;

              switch (index) {
                case 0:
                  title = ' جميره للتموين';
                  subtitle = 'مقبلات ';
                  price = '6د.ل';
                  imageUrl = 'assets/jumaira(appe).jpg';
                  break;

                default:
                  title = 'الفخامه الملكيه';
                  subtitle = 'كرت';
                  price = '6د.ل';
                  imageUrl = 'https://example.com/default.jpg';
              }

              return Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 12.0, right: 12.0),
                child: Shoppingcartcard(
                  title: title,
                  subtitle: subtitle,
                  price: price,
                  imageUrl: imageUrl,
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 1,
        ),
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(232, 232, 232, 232),
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          height: 234,
          width: 600,
          color: Color.fromARGB(232, 201, 200, 200),
          child: Padding(
            padding: const EdgeInsets.only(right: 10, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  ':التفاصيل',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  'سعر القطعه : 20 د.ل',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  'الاجمالي : 600 د.ل',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(20),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 101, 143, 193),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const Home()),
                          (route) => false);
                    },
                    child: const Text(
                      " تأكيدالطلب",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
