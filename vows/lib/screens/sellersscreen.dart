import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vows/helpers/consts.dart';
import 'package:vows/screens/adminhome.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Sellersscreen extends StatefulWidget {
  const Sellersscreen({super.key});

  @override
  State<Sellersscreen> createState() => _SellersscreenState();
}

class VendorInfo {
  static Future<List<Vendor>> fetchVendor() async {
    // await Future.delayed(Duration(seconds: 2)); // Add a delay of 2 seconds

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
      // print(response.body);
      throw Exception(response.body);
    }
  }
}

class Vendor {
  final int id;
  final String username;
  final String phonenumber;
  final String location;
  final String details;

  Vendor({
    required this.id,
    required this.username,
    required this.phonenumber,
    required this.location,
    required this.details,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    {
      return Vendor(
        id: json['id'],
        username: json['username'],
        phonenumber: json['phonenumber'],
        location: json['location'],
        details: json['details'],
      );
    }
  }
}

class _SellersscreenState extends State<Sellersscreen> {
  Future<void> deleteSeller(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final headers = {
      'Authorization': 'Bearer $token',
    };
    final response = await http.delete(
      Uri.parse('$backendURL/api/sellers/$id'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      setState(() {});
    } else {
      throw Exception('Failed to delete seller');
    }
  }

  void editSeller(Vendor seller) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => EditSellerScreen(seller: seller),
      ),
    ).then((_) {
      setState(() {});
    });
  }

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
              CupertinoPageRoute(builder: (context) => const Adminhome()),
              (route) => false,
            );
          },
        ),
      ),
      body: FutureBuilder<List<Vendor>>(
        future: VendorInfo.fetchVendor(),
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
                    onEdit: () => editSeller(seller),
                    onDelete: () async {
                      await deleteSeller(seller.id);
                    },
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
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const VendorContainer({
    super.key,
    required this.username,
    required this.details,
    required this.location,
    required this.phonenumber,
    required this.onEdit,
    required this.onDelete,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: onDelete,
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: onEdit,
                  ),
                ],
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}

class EditSellerScreen extends StatefulWidget {
  final Vendor seller;

  const EditSellerScreen({super.key, required this.seller});

  @override
  _EditSellerScreenState createState() => _EditSellerScreenState();
}

class _EditSellerScreenState extends State<EditSellerScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _phonenumber;
  late String _location;
  late String _details;

  @override
  void initState() {
    super.initState();
    _username = widget.seller.username;
    _phonenumber = widget.seller.phonenumber;
    _location = widget.seller.location;
    _details = widget.seller.details;
  }

  Future<void> updateSeller() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    final body = {
      'username': _username,
      'phonenumber': _phonenumber,
      'location': _location,
      'details': _details,
    };

    final response = await http.put(
      Uri.parse('$backendURL/api/sellers/${widget.seller.id}'),
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      Navigator.pop(context);
    } else {
      throw Exception('Failed to update seller');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Seller'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _username,
                decoration: const InputDecoration(labelText: 'Username'),
                onChanged: (value) => _username = value,
              ),
              TextFormField(
                initialValue: _phonenumber,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                onChanged: (value) => _phonenumber = value,
              ),
              TextFormField(
                initialValue: _location,
                decoration: const InputDecoration(labelText: 'Location'),
                onChanged: (value) => _location = value,
              ),
              TextFormField(
                initialValue: _details,
                decoration: const InputDecoration(labelText: 'Details'),
                onChanged: (value) => _details = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: updateSeller,
                child: const Text('تعديل'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
