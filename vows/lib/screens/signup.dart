import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/helpers/consts.dart';
import 'package:vows/screens/login.dart';
import 'package:vows/screens/splashscreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool isPasswordVisible = false;
  bool checkbox1 = false;
  bool checkbox2 = false;
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final verpasscontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  Future<void> _registerUser(BuildContext context, String username,
      String password, String phonenumber) async {
    final url = Uri.parse('$backendURL/api/auth/registercustomer/');
    try {
      final body = {
        "username": usernamecontroller.text,
        "password": passwordcontroller.text,
        'phonenumber': phonenumbercontroller.text,
      };

      final response = await http.post(url,
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );
      } else {
        print('registration failed. Status code: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void dispose() {
    passwordcontroller.dispose();
    usernamecontroller.dispose();
    phonenumbercontroller.dispose();
    verpasscontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 101, 143, 193),
          title: const Text(
            "انشاء حساب",
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const SplashScreen()),
              );
            },
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: Text(
                  "الاسم:",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: TextField(
                  controller: usernamecontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 4),
                  ),
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MyPasswordField(
                isPasswordVisible: isPasswordVisible,
                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                passwordcontroller: passwordcontroller,
                verpasscontroller: verpasscontroller,
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: Text(
                  "الهاتف:",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: TextField(
                  controller: phonenumbercontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 4),
                  ),
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: checkbox1,
                    onChanged: (value) {
                      setState(() {
                        checkbox1 = value!;
                        checkbox2 = false;
                      });
                    },
                    shape: const CircleBorder(),
                    activeColor: const Color.fromARGB(255, 101, 143, 193),
                  ),
                  const Text('زبون'),
                  const SizedBox(width: 90),
                  Checkbox(
                    value: checkbox2,
                    onChanged: (value) {
                      setState(() {
                        checkbox2 = value!;
                        checkbox1 = false;
                      });
                    },
                    shape: const CircleBorder(),
                    activeColor: const Color.fromARGB(255, 101, 143, 193),
                  ),
                  const Text('عميل'),
                ],
              ),
              const SizedBox(
                height: 15,
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
                    if (passwordcontroller.text == verpasscontroller.text) {
                      if (usernamecontroller.text.isEmpty ||
                          phonenumbercontroller.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: const Text('الرجاء إدخال البيانات'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('موافق'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        _registerUser(
                            context,
                            usernamecontroller.text,
                            passwordcontroller.text,
                            phonenumbercontroller.text);
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: const Text('كلمة المرور غير متطابقة'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('موافق'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text(
                    " انشاء حساب",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPasswordField extends StatelessWidget {
  final bool isPasswordVisible;
  final Function onTap;
  final TextEditingController passwordcontroller;
  final TextEditingController verpasscontroller;

  const MyPasswordField(
      {Key? key,
      required this.isPasswordVisible,
      required this.onTap,
      required this.passwordcontroller,
      required this.verpasscontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 90),
          child: Text(
            "كلمة المرور:",
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: TextField(
            controller: passwordcontroller,
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(vertical: 4),
              suffixIcon: IconButton(
                onPressed: () {
                  onTap();
                },
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
            textAlign: TextAlign.right,
            cursorColor: Colors.black,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: Text(
            "تأكيد كلمة المرور:",
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: TextField(
            controller: verpasscontroller,
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(vertical: 4),
              suffixIcon: IconButton(
                onPressed: () {
                  onTap();
                },
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
            textAlign: TextAlign.right,
            cursorColor: Colors.black,
          ),
        ),
      ],
    );
  }
}
