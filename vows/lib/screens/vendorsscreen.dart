import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vows/helpers/consts.dart';
import 'package:vows/screens/cart.dart';
import 'package:vows/screens/home.dart';
import 'package:vows/screens/shoppingcart.dart';
import 'package:badges/badges.dart' as badges;
import 'dart:convert';
import 'package:http/http.dart' as http;

class Vendorsscreen extends StatefulWidget {
  const Vendorsscreen({super.key});

  @override
  State<Vendorsscreen> createState() => _VendorsscreenState();
}

class VendorInfo {
  static Future<List<Vendor>> fetchVendorInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final headers = {
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(
      Uri.parse('$backendURL/api/sellers/'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'] as List<dynamic>;
      return jsonData.map((seller) => Vendor.fromJson(seller)).toList();
    } else {
      throw Exception('Failed to fetch vendor information');
    }
  }
}

class Vendor {
  final String username;
  final String phonenumber;
  final String location;
  final String details;

  Vendor({
    required this.username,
    required this.phonenumber,
    required this.location,
    required this.details,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      username: json['username'],
      phonenumber: json['phonenumber'],
      location: json['location'],
      details: json['details'],
    );
  }
}

class _VendorsscreenState extends State<Vendorsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 101, 143, 193),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(builder: (context) => const Home()),
              (route) => false,
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: badges.Badge(
              badgeContent: Text(
                cartItems.length.toString(),
                style: const TextStyle(color: Colors.black),
              ),
              child: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const ShoppingCart(
                        customerId: '',
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Vendor>>(
        future: VendorInfo.fetchVendorInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final sellers = snapshot.data!;
            return ListView.builder(
              itemCount: sellers.length,
              itemBuilder: (context, index) {
                final seller = sellers[index];
                return Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 12.0, right: 12.0),
                  child: VendorContainer(
                    username: seller.username,
                    details: seller.details,
                    phonenumber: seller.phonenumber,
                    location: seller.location,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class VendorContainer extends StatelessWidget {
  final String username;
  final String details;
  final String location;
  final String phonenumber;

  const VendorContainer({
    super.key,
    required this.username,
    required this.details,
    required this.location,
    required this.phonenumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 60, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                username,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text('التفاصيل'),
              const SizedBox(height: 10),
              Text(details),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.grey,
                thickness: 1.0,
                indent: 0,
                endIndent: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('المكان: $location'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('الهاتف: $phonenumber'),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
