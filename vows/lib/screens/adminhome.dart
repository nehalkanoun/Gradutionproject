import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/helpers/consts.dart';
import 'package:vows/screens/customersscreen.dart';
import 'package:vows/screens/login.dart';
import 'package:vows/screens/sellersscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Adminhome extends StatelessWidget {
  const Adminhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 101, 143, 193),
        ),
        body: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 150, right: 30, left: 30),
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 101, 143, 193),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(builder: (context) => Customersscreen()),
                    (route) => false,
                  );
                },
                child: const Padding(
                  padding:
                      EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 10),
                  child: Text(
                    " الطلبات",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30.0),
            Padding(
              padding: const EdgeInsets.only(top: 60, right: 30, left: 30),
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 101, 143, 193),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const Sellersscreen()),
                    (route) => false,
                  );
                },
                child: const Padding(
                  padding:
                      EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
                  child: Text(
                    "الموردين",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150, right: 30),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                ElevatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    final token = prefs.getString('token');
                    try {
                      final body = {
                        "token": '$token',
                      };

                      final response = await http.post(
                        Uri.parse('$backendURL/api/auth/logoutadmin/'),
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
              ]),
            )
          ]),
        ));
  }
}
