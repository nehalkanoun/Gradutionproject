import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vows/screens/aboutus.dart';
import 'package:vows/screens/changepassword.dart';
import 'package:vows/screens/editaccount.dart';
import 'package:vows/screens/home.dart';
import 'package:vows/screens/login.dart';
import 'package:vows/screens/termsandconditions.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              "الاعدادات",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "نهال كانون",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(15),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 101, 143, 193),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const Editaccount()),
                        (route) => false,
                      );
                    },
                    child: const Text(
                      " تعديل الحساب",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 42, right: 42),
                    child: Divider(
                      color: Color.fromARGB(0, 0, 0, 0).withOpacity(0.9),
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 38),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const Changepassword()),
                                    (route) => false);
                              },
                              icon: Icon(Icons.keyboard_arrow_left_sharp)),
                        ),
                        Spacer(),
                        Text(
                          "تغيير كلمة المرور",
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const Changepassword()),
                                      (route) => false);
                                },
                                icon: Icon(Icons.lock_reset_outlined)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 38),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    const Termsandconditions()),
                            (route) => false);
                      },
                      icon: Icon(Icons.keyboard_arrow_left_sharp)),
                ),
                Spacer(),
                Text("الشروط والاحكام "),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      const Termsandconditions()),
                              (route) => false);
                        },
                        icon: Icon(Icons.menu_book_sharp)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 38),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const Aboutus()),
                            (route) => false);
                      },
                      icon: Icon(Icons.keyboard_arrow_left_sharp)),
                ),
                Spacer(),
                Text("معلومات عنا "),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const Aboutus()),
                              (route) => false);
                        },
                        icon: Icon(Icons.error_outline_outlined)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("0926759275 :اسألني"),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 42, right: 42),
            child: Divider(
              color: Color.fromARGB(0, 0, 0, 0).withOpacity(0.9),
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 38),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(builder: (context) => Login()),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    foregroundColor: const Color.fromARGB(255, 123, 123,
                        123), // Set the text color to the desired color
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "تسجيل خروج",
                        style:
                            TextStyle(color: Color.fromARGB(255, 47, 46, 46)),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.logout_outlined),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
