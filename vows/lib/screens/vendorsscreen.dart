import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/home.dart';
import 'package:vows/screens/shoppingcart.dart';

class Vendorsscreen extends StatelessWidget {
  const Vendorsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 101, 143, 193),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => const Home()),
                (route) => false);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            color: Colors.black,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const shoppingcart()),
                  (route) => false);
            },
          ),
        ],
        title: const Center(
          child: Text(
            "الصفحة الرئيسية",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          String title, details, phoneNumber, place;
          List<Widget> stars;

          switch (index) {
            case 0:
              title = 'Jumeria Catering';
              details = 'شركة تموين وتوريدات (شركات-مؤسسات-طرق-مواقع)';
              phoneNumber = '0913092828';
              place = "الهواري";
              stars = [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
              ];
              break;
            case 1:
              title = 'المطبخ العربي';
              details = "شركه متخصصه بتوفير انواع من الوجبات والحلو";
              place = "الفويهات الرحبه";
              phoneNumber = '0918884545';
              stars = [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
                const Icon(
                  Icons.star_half,
                  color: Colors.amber,
                  size: 20.0,
                ),
                const Icon(
                  Icons.star_border,
                  color: Colors.amber,
                  size: 20.0,
                ),
              ];
              break;
            case 2:
              title = 'الفخامه الملكيه ';
              details = ' شركة مختصة بتوفير كروت دعوه للافراح';
              place = " بلعون";
              phoneNumber = '0918884545';
              stars = [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
                const Icon(
                  Icons.star_border,
                  color: Colors.amber,
                  size: 20.0,
                ),
              ];
              break;
            case 3:
              title = 'كافي فيقو ';
              details = 'كافي يوفر المشروبات والحلو';
              place = "شارع الوكالات";
              phoneNumber = '0916683593';
              stars = [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.0,
                ),
                const Icon(
                  Icons.star_border,
                  color: Colors.amber,
                  size: 20.0,
                ),
                const Icon(
                  Icons.star_border,
                  color: Colors.amber,
                  size: 20.0,
                ),
              ];
              break;
            default:
              title = '';
              details = '';
              place = '';
              phoneNumber = '';
              stars = [];
          }

          return VendorContainer(
            title: title,
            details: details,
            place: place,
            phoneNumber: phoneNumber,
            stars: stars,
          );
        },
      ),
    );
  }
}

class VendorContainer extends StatelessWidget {
  final String title;
  final String details;
  final String place;
  final String phoneNumber;
  final List<Widget> stars;

  const VendorContainer({
    super.key,
    required this.title,
    required this.details,
    required this.phoneNumber,
    required this.stars,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 60, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text('التفاصيل'),
              const SizedBox(height: 10),
              Text(details),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.grey,
                thickness: 1.0,
                indent: 0,
                endIndent: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('المكان: $place'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('الهاتف:$phoneNumber'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: stars,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
