class MenuItem {
  final String name;
  final String? description;
  final String imageUrl;
  final double price;
  double? discount;

  MenuItem({
    required this.name,
    this.description,
    this.discount,
    required this.imageUrl,
    required this.price,
  });
}
