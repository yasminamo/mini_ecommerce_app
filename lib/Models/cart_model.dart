class CartModel {
  final int id;
  final String title;
  final double price;
  final String image;
  int quantity;
  final String? category;

  CartModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.image,
      this.category,
      this.quantity = 1});
}
