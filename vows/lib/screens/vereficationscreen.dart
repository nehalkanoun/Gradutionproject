import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:vows/screens/login.dart';
import 'package:vows/screens/newpassword.dart';

class Vereficationscreen extends StatelessWidget {
  const Vereficationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Verification ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const Login()),
              );
            },
          ),
        ),
        body: Container(
            padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
            color: Colors.white,
            child: ListView(children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          width: 100,
                          height: 20,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Enter verification  code",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleInputField(),
                              CircleInputField(),
                              CircleInputField(),
                              CircleInputField(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "If you didn’t receive a code,",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Add your logic for resend action here
                              },
                              child: const Text(
                                "Resend",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 101, 143, 193),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 200,
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
                                    builder: (context) => const Newpassword()),
                                (route) => false,
                              );
                            },
                            child: const Text(
                              "Send",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    ),
                  ]),
            ])));
  }
}

class CircleInputField extends StatelessWidget {
  const CircleInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.0,
      height: 45.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 41, 41, 41),
          width: 2.0,
        ),
      ),
      child: Center(
        child: TextFormField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(10.0),
          ),
          textAlign: TextAlign.center,
          cursorColor:
              const Color.fromARGB(255, 41, 41, 41), // Set the cursor color
        ),
      ),
    );
  }
}
