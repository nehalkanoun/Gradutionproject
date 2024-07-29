class Order {
  final int id;
  final int amount;
  final String productName;
  final double totalProductPrice;
  final String customerName;
  final String phoneNumber;

  Order({
    required this.id,
    required this.amount,
    required this.productName,
    required this.totalProductPrice,
    required this.customerName,
    required this.phoneNumber,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      amount: json['amount'],
      productName: json['productname'],
      totalProductPrice: json['total_product_price'].toDouble(),
      customerName: json['customername'],
      phoneNumber: json['phonenumber'],
    );
  }
}
