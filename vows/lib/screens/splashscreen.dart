import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:vows/screens/login.dart';
import 'package:vows/screens/signup.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 101, 143, 193),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset('assets/logo.png'),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 101, 143, 193))),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => Signup()),
                  );
                },
                child: const Text(
                  "انشاء حساب",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 101, 143, 193))),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => const Login()),
                  );
                },
                child: const Text(
                  "تسجيل دخول",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
