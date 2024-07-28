import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vows/screens/aboutus.dart';
import 'package:vows/screens/cart.dart';
import 'package:vows/screens/changepassword.dart';
import 'package:vows/screens/editaccount.dart';

import 'package:vows/screens/login.dart';
import 'package:badges/badges.dart' as badges;
import 'package:vows/screens/shoppingcart.dart';
import 'package:vows/screens/termsandconditions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vows/widgets/buttombarcus.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final usernamecontroller = TextEditingController();
  String? username;

  @override
  void initState() {
    super.initState();
    getusername();
  }

  void getusername() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      username = prefs.getString('username');
      print(username);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Bottomnavigationbar(
      selectedIndex: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 101, 143, 193),
          title: const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "الاعدادات",
                style: TextStyle(color: Colors.white),
              ),
            ),
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
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      username ?? 'hyyhh',
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    const SizedBox(
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
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 42, right: 42),
                      child: Divider(
                        color:
                            const Color.fromARGB(0, 0, 0, 0).withOpacity(0.9),
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
                                icon: const Icon(
                                    Icons.keyboard_arrow_left_sharp)),
                          ),
                          const Spacer(),
                          const Text(
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
                                  icon: const Icon(Icons.lock_reset_outlined)),
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
                        icon: const Icon(Icons.keyboard_arrow_left_sharp)),
                  ),
                  const Spacer(),
                  const Text("الشروط والاحكام "),
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
                          icon: const Icon(Icons.menu_book_sharp)),
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
                        icon: const Icon(Icons.keyboard_arrow_left_sharp)),
                  ),
                  const Spacer(),
                  const Text("معلومات عنا "),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const Aboutus()),
                            );
                          },
                          icon: const Icon(Icons.error_outline_outlined)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("0926759275 :اسألني"),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 42, right: 42),
              child: Divider(
                color: const Color.fromARGB(0, 0, 0, 0).withOpacity(0.9),
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 38),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        final body = {
                          "token":
                              "91|bfEkOzQe51SOCYFqx8pq8hRz9nIe2jnSIMvH9r0vc3fc8ec6",
                        };

                        final response = await http.post(
                          Uri.parse(
                              'http://127.0.0.1:8000/api/auth/logoutcustomer/'),
                          body: jsonEncode(body),
                          headers: {
                            'Content-Type': 'application/json',
                          },
                        );

                        if (response.statusCode == 200) {
                          final responseData = jsonDecode(response.body);
                          if (responseData['success']) {
                            print(
                                'Logout successful: ${responseData['message']}');
                            Navigator.pushReplacement(
                              // ignore: use_build_context_synchronously
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const Login()),
                            );
                          } else {
                            print('Logout failed: ${responseData['message']}');
                          }
                        } else {
                          print(
                              'Logout failed: ${response.statusCode} - ${response.body}');
                        }
                      } catch (e) {
                        print('Error: $e');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      foregroundColor: const Color.fromARGB(255, 123, 123, 123),
                    ),
                    child: const Row(
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
      ),
    );
  }
}
