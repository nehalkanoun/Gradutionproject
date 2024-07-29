import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vows/helpers/consts.dart';
import 'package:vows/screens/order.dart';
import 'package:vows/screens/sellerhome.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Ordersscreen extends StatefulWidget {
  final String sellerName;
  final int sellerId;

  const Ordersscreen(
      {super.key, required this.sellerName, required this.sellerId});

  @override
  _OrdersscreenState createState() => _OrdersscreenState();
}

class _OrdersscreenState extends State<Ordersscreen> {
  late Future<List<Order>> _ordersFuture;

  @override
  void initState() {
    super.initState();
    _ordersFuture = _fetchOrders(widget.sellerId);
  }

  Future<List<Order>> _fetchOrders(int sellerId) async {
    final response =
        await http.get(Uri.parse('$backendURL/api/getsellerorders/$sellerId'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['sellerproducts'] != null) {
        final List<dynamic> data = responseData['sellerproducts'];
        return data.map((order) => Order.fromJson(order)).toList();
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to fetch orders');
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
                builder: (context) => Sellerhome(
                  sellerName: widget.sellerName,
                  sellerId: widget.sellerId,
                ),
              ),
            );
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 60),
          child: const Center(
            child: Text(
              "الطلبات",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Order>>(
        future: _ordersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No orders found'));
          } else {
            final orders = snapshot.data!;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];

                return Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 12.0, right: 12.0),
                  child: Orderscard(
                    id: order.id.toString(),
                    name: order.customerName,
                    number: order.phoneNumber,
                    amount: order.amount.toString(),
                    description: order.productName,
                    price: order.totalProductPrice.toString(),
                    imageUrl: 'assets/كوروكيت البطاطا-Arabian kitchen.jpg',
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

class Orderscard extends StatelessWidget {
  final String id;
  final String name;
  final String number;
  final String amount;
  final String description;
  final String price;
  final String imageUrl;

  const Orderscard({
    Key? key,
    required this.id,
    required this.name,
    required this.number,
    required this.amount,
    required this.description,
    required this.price,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(imageUrl),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description, style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Amount: $amount'),
            Text('Customer: $name'),
            Text('Phone: $number'),
            Text('Price: $price'), // Added to display the price
          ],
        ),
      ),
    );
  }
}
