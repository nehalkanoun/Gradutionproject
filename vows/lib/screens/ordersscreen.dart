import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/helpers/consts.dart';
import 'package:vows/screens/order.dart';
import 'package:vows/screens/sellerhome.dart';
import 'package:vows/widgets/orderscard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Ordersscreen extends StatefulWidget {
  final String sellerName;

  const Ordersscreen({super.key, required this.sellerName});

  @override
  // ignore: library_private_types_in_public_api
  _OrdersscreenState createState() => _OrdersscreenState();
}

class _OrdersscreenState extends State<Ordersscreen> {
  List<Order> orders = [];

  @override
  void initState() {
    super.initState();
    _fetchOrders();
  }

  Future<void> _fetchOrders() async {
    final response =
        await http.get(Uri.parse('$backendURL/api/getsellerorders/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      setState(() {
        orders = data.map((order) => Order.fromJson(order)).toList();
      });
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to fetch orders')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 101, 143, 193),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const Sellerhome(),
              ),
            );
          },
        ),
        title: const Center(
          child: Text(
            "الطلبات",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: orders.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];

                return Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 12.0, right: 12.0),
                  child: Orderscard(
                    id: order.id.toString(),
                    name: 'Customer ${order.customerId}',
                    number: 'N/A',
                    amount: order.totalPrice.toString(),
                    description: 'N/A',
                    price: order.totalPrice.toString(),
                    imageUrl: 'assets/default.jpg',
                  ),
                );
              },
            ),
    );
  }
}
