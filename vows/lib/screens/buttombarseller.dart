import 'package:flutter/material.dart';
import 'package:vows/screens/home.dart';
import 'package:vows/screens/ordersscreen.dart';
import 'package:vows/screens/settings.dart';

class Bottomnavigationbarseller extends StatefulWidget {
  final Widget child;
  const Bottomnavigationbarseller({required this.child, super.key});

  @override
  State<Bottomnavigationbarseller> createState() =>
      _BottomnavigationbarsellerState();
}

class _BottomnavigationbarsellerState extends State<Bottomnavigationbarseller> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    Home(),
    Ordersscreen(
      sellerName: '',
    ),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
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
              AssetImage("assets/orderimagee.png"),
              color: Colors.black,
            ),
            label: ('الطلبات'),
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
