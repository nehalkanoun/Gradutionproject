import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vows/helpers/consts.dart';
import 'package:vows/screens/adminhome.dart';

class Customersscreen extends StatefulWidget {
  @override
  _CustomersscreenState createState() => _CustomersscreenState();
}

class _CustomersscreenState extends State<Customersscreen> {
  late Future<List<Map<String, dynamic>>> _ordersFuture;

  @override
  void initState() {
    super.initState();
    _ordersFuture = fetchOrders();
  }

  Future<List<Map<String, dynamic>>> fetchOrders() async {
    final response = await http.get(Uri.parse('$backendURL/api/getallorders'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data
          .map((order) => {
                'orderid': order['orderid'],
                'productname': order['productname'],
                'productprice': order['productprice'],
                'sellerusername': order['sellerusername'],
                'customername': order['customername'],
                'customerphone': order['customerphone'],
                'amount': order['amount'],
                'total_product_price': order['total_product_price'],
                'imageUrl':
                    "assets/${order['productname']}-${order['sellerusername']}.jpg", // Update this if you have real images
              })
          .toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }

  Future<void> deleteOrder(int orderId) async {
    final response =
        await http.delete(Uri.parse('$backendURL/api/orders/$orderId'));

    if (response.statusCode == 200) {
      setState(() {
        _ordersFuture = fetchOrders();
      });
    } else {
      throw Exception('Failed to delete order');
    }
  }

  Future<void> editOrder(int orderId, int quantity) async {
    final response = await http.put(
      Uri.parse('$backendURL/api/adminupdateorder/$orderId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'amount': quantity,
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        _ordersFuture = fetchOrders();
      });
    } else {
      throw Exception('Failed to edit order');
    }
  }

  void _showEditDialog(Map<String, dynamic> order) {
    final TextEditingController quantityController =
        TextEditingController(text: order['amount'].toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Order'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final int orderId = order['orderid'];
                final int quantity = int.parse(quantityController.text);

                editOrder(orderId, quantity);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
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
                (route) => false);
          },
        ),
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 40),
            child: Text(
              "الطلبات",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _ordersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No orders found'));
          } else {
            final orders = snapshot.data!;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(order['imageUrl'],
                                  width: 100, height: 100, fit: BoxFit.fill),
                            ),
                            title: Align(
                              alignment: Alignment.centerRight,
                              child: Text(order['productname'],
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.right),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'الكمية: ${order['amount']} - الاجمالي: ${order['total_product_price']}',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.right,
                                ),
                                Text(
                                  'اسم الزبون: ${order['customername']}',
                                  style: TextStyle(fontSize: 12),
                                  textAlign: TextAlign.right,
                                ),
                                Text(
                                  'رقم الهاتف: ${order['customerphone']}',
                                  style: TextStyle(fontSize: 12),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit, size: 20),
                                onPressed: () => _showEditDialog(order),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, size: 20),
                                onPressed: () => deleteOrder(order['orderid']),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
