import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/helpers/consts.dart';
import 'package:vows/screens/adminhome.dart';
import 'package:vows/screens/forgetpassword.dart';
import 'package:vows/screens/home.dart';
import 'package:vows/screens/sellerhome.dart';
import 'package:vows/screens/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  @override
  void initState() {
    super.initState();
  }

  Future<void> _logincustomer(
      BuildContext context, String username, String password) async {
    final url = Uri.parse('$backendURL/api/auth/logincustomer/');
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
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', usernamecontroller.text);

        await prefs.setInt('cartID', responseData['cart_id']);
        await prefs.setString('token', responseData['token']);
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      } else {
        print('Login  customer failed. Status code: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _loginseller(
      BuildContext context, String username, String password) async {
    final url = Uri.parse('$backendURL/api/auth/loginseller/');
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
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', usernamecontroller.text);
        await prefs.setString('token', responseData['token']);
        await prefs.setInt('id', responseData['id']);

        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const Sellerhome()),
        );
      } else {
        print('Login seller failed. Status code: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _loginadmin(
      BuildContext context, String username, String password) async {
    final url = Uri.parse('$backendURL/api/auth/loginadmin/');
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
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setString('username', usernamecontroller.text);
        // await prefs.setString('token', responseData['token']);
        // await prefs.setInt('id', responseData['id']);

        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const Adminhome()),
        );
      } else {
        print('Login admin failed. Status code: ${response.body}');
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

  @override
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
        body: SingleChildScrollView(
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
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: TextField(
                  controller: usernamecontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  textAlign: TextAlign.right,
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
                    if (usernamecontroller.text.isEmpty ||
                        passwordcontroller.text.isEmpty) {
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
                      _loginadmin(context, usernamecontroller.text,
                          passwordcontroller.text);
                      _logincustomer(context, usernamecontroller.text,
                          passwordcontroller.text);
                      _loginseller(context, usernamecontroller.text,
                          passwordcontroller.text);
                    }
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
    super.key,
    required this.isPasswordVisible,
    required this.onTap,
    required this.passwordcontroller,
  });

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
      ],
    );
  }
}
