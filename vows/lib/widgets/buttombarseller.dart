import 'package:flutter/material.dart';
import 'package:vows/screens/sellerhome.dart';

class Buttombarseller extends StatefulWidget {
  const Buttombarseller({super.key});

  @override
  State<Buttombarseller> createState() => _ButtombarsellerState();
}

class _ButtombarsellerState extends State<Buttombarseller> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[Sellerhome()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
  child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 101, 143, 193),
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
          elevation: 5),
    );
  }
}
