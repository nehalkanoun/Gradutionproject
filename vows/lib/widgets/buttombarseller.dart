import 'package:flutter/material.dart';
import 'package:vows/screens/ordersscreen.dart';
import 'package:vows/screens/sellerhome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vows/screens/settings.dart';

class Bottomnavigationbarseller extends StatefulWidget {
  final Widget child;
  final int selectedIndex;

  const Bottomnavigationbarseller(
      {super.key, required this.child, required this.selectedIndex});

  @override
  _BottomnavigationbarsellerState createState() =>
      _BottomnavigationbarsellerState();
}

class _BottomnavigationbarsellerState extends State<Bottomnavigationbarseller> {
  late int _selectedIndex;
  late String sellerName;
  late int sellerId;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
    _loadSellerInfo();
  }

  Future<void> _loadSellerInfo() async {
    final prefs = await SharedPreferences.getInstance();
    sellerName = prefs.getString('name') ?? 'Unknown';
    sellerId = prefs.getInt('id') ?? 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Sellerhome(
              sellerName: sellerName,
              sellerId: sellerId,
            ),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Ordersscreen(
              sellerName: sellerName,
              sellerId: sellerId,
            ),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Settings(),
          ),
        );
        break;
      default:
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
              AssetImage("assets/orderimagee.png"),
              color: Colors.black,
            ),
            label: (' الطلبات'),
            backgroundColor: Color.fromARGB(255, 101, 143, 193),
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
        onTap: _onItemTapped,
      ),
    );
  }
}
