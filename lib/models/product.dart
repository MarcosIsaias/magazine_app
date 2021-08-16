class Product {
  final String name;
  final String photo;
  final String description;
  final String price;
  final String offerDay;
  bool isFavorite;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.offerDay,
    required this.photo,
    this.isFavorite = false,
  });
}
