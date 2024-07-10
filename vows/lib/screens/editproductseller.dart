import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/sellerhome.dart';
import 'package:vows/widgets/editproductcard.dart';

class Editproduct extends StatefulWidget {
  const Editproduct({super.key});

  @override
  State<Editproduct> createState() => _EditproductState();
}

class _EditproductState extends State<Editproduct> {
  bool _isEditing = false;

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
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                "  تعديل منتج",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            String title;
            String subtitle;
            String price;
            String imageUrl;

            switch (index) {
              case 0:
                title = 'كافي فيقو';
                subtitle = 'وايت موكا';
                price = '8';
                imageUrl = 'assets/whitemoka.jpg';
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
              child: Editproductcard(
                title: title,
                subtitle: subtitle,
                price: price,
                imageUrl: imageUrl,
                isEditing: _isEditing,
                onEditPressed: (newTitle, newSubtitle, newPrice) {
                  setState(() {
                    _isEditing = !_isEditing;

                    title = newTitle;
                    subtitle = newSubtitle;
                    price = newPrice;
                  });
                },
              ),
            );
          },
        ));
  }
}
