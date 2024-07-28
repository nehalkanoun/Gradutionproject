import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/screens/home.dart';
import 'package:vows/screens/settings.dart';
import 'package:vows/screens/vendorsscreen.dart';

class Bottomnavigationbar extends StatefulWidget {
  final int selectedIndex;
  final Widget child; 

  const Bottomnavigationbar(
      {required this.selectedIndex, required this.child, Key? key})
      : super(key: key);

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) {
      return; 
    }
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => const Home()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => const Vendorsscreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => const Settings()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child, 
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 101, 143, 193),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/homeicon.png"),
              color: Colors.black,
            ),
            label: ('الصفحه الرئيسيه'),
            backgroundColor: Color.fromARGB(255, 101, 143, 193),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/vendors.png"),
              color: Colors.black,
            ),
            label: ('الموردين'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/settingsicon.png"),
              color: Colors.black,
            ),
            label: ('الاعدادات'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 30,
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }
}
