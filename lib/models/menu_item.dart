
class MenuItem {
  final String name;
  final String? description;
  final String imageUrl;
  final double price;

  const MenuItem({
    required this.name,
    this.description,
    required this.imageUrl,
    required this.price,
  });
}
