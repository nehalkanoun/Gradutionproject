class CartItem {
  final String title;
  final String subtitle;
  final double price;
  final String imageUrl;
  final int quantity;

  CartItem({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });
}

List<CartItem> cartItems = [];
