import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/login.dart';
import 'package:vows/screens/splashscreen.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool isPasswordVisible = false;
  bool checkbox1 = false;
  bool checkbox2 = false;

  @override
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
              Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(builder: (context) => const SplashScreen()),
                  (route) => false);
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 4),
                  ),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black, 
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: Text(
                  "البريد الالكتروني:",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 4),
                  ),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 4),
                  ),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
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
                    Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(builder: (context) => const Login()),
                        (route) => false);
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

  const MyPasswordField({
    Key? key,
    required this.isPasswordVisible,
    required this.onTap,
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
            textAlign: TextAlign.left,
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
            textAlign: TextAlign.left,
            cursorColor: Colors.black, 
          ),
        ),
      ],
    );
  }
}
