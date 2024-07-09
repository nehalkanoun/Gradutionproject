import 'package:flutter/material.dart';
import 'package:vows/screens/home.dart';
import 'package:vows/screens/settings.dart';
import 'package:vows/screens/vendorsscreen.dart';

class Buttombarcus extends StatelessWidget {
  const Buttombarcus({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottomnavigationbar(),
    );
  }
}

class Bottomnavigationbar extends StatefulWidget {
  const Bottomnavigationbar({super.key});

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Center(
      child: Home(),
    ),
    const Center(
      child: Vendorsscreen(),
    ),
    const Center(
      child: Settings(),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
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
          elevation: 5),
    );
  }
}
