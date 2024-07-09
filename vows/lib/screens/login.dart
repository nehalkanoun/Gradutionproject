import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/forgetpassword.dart';
import 'package:vows/screens/home.dart';
import 'package:vows/screens/splashscreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPasswordVisible = false;
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  Future<void> _loginUser(
      BuildContext context, String username, String password) async {
    final url = Uri.parse('http://127.0.0.1:8000/api/auth/logincustomer/');
    try {
      final body = {
        "username": usernamecontroller.text,
        "password": passwordcontroller.text,
      };

      final response = await http.post(url,
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      } else {
        print('Login failed. Status code: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void dispose() {
    usernamecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 101, 143, 193),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const SplashScreen()),
                  (route) => false);
            },
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text(
                  "تسجيل الدخول",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: Text(
                  " اسم المستخدم:",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: TextField(
                  controller: usernamecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.black,
                ),
              ),
              MyPasswordField(
                  isPasswordVisible: isPasswordVisible,
                  onTap: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  passwordcontroller: passwordcontroller),
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
                    _loginUser(context, usernamecontroller.text,
                        passwordcontroller.text);
                  },
                  child: const Text(
                    " تسجيل دخول",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const forgetpassword()),
                        (route) => false);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "هل نسيت كلمة المرور؟",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
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

  const MyPasswordField({
    Key? key,
    required this.isPasswordVisible,
    required this.onTap,
    required this.passwordcontroller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
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
              suffixIcon: IconButton(
                onPressed: () {
                  onTap();
                },
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
            textAlign: TextAlign.left,
            cursorColor: Colors.black,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
