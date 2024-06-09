import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/login.dart';

class newpassword extends StatelessWidget {
  const newpassword({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New password",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(builder: (context) => Login()),
              (route) => false,
            );
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  height: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter New password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 4),
                  ),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                ),
                SizedBox(height: 10),
                Text(
                  "Confirm Password",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
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
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
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
                          CupertinoPageRoute(builder: (context) => Login()),
                          (route) => false,
                        );
                      },
                      child: const Text(
                        "Send",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
