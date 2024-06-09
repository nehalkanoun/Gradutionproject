import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Buttombar extends StatelessWidget {
  final String title1;
  final String title2;
  final String title3;
  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;
  

  Buttombar({
    required this.title1,
    required this.title2,
    required this.title3,
    required this.imageUrl1,
    required this.imageUrl2,
    required this.imageUrl3,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 55,
              width: double.infinity,
              color: Color.fromARGB(255, 101, 143, 193),
              child: IconTheme(
                data: IconThemeData(
                  color: Colors.black87,
                  size: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("settingsicon.png"),
                        SizedBox(height: 4.0),
                        Text(
                          title1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 4.0,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("vendors.png"),
                        SizedBox(height: 4.0),
                        Text(
                          title2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 4.0,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("homeicon.png"),
                        SizedBox(height: 4.0),
                        Text(
                          title3,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 4.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
