import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Maincards extends StatelessWidget {
  final String title;
  final String location;
  final String cardText;
  final String imageUrl;
  final VoidCallback onPressed;

  Maincards({
    required this.title,
    required this.location,
    required this.cardText,
    required this.onPressed,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 12.0, right: 12.0),
            child: Container(
              constraints: const BoxConstraints(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),

                 
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                     
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  location,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.location_pin,
                                    color: Color.fromARGB(255, 101, 143, 193),
                                  ),
                                )
                              ],
                            ),
                          ),
                    
                          Container(
                            height: 25,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 101, 143, 193),
                                ),
                              ),
                              onPressed: onPressed,
                              child: const Text(
                                '...المزيد',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
      ]),
    );
  }
}
