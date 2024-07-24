class Order {
  final int id;
  final String customerId;
  final double totalPrice;
  final String status;
  final String createdAt;
  final String updatedAt;

  Order({
    required this.id,
    required this.customerId,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      customerId: json['customer_ID'],
      totalPrice: json['total_price'].toDouble(),
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
