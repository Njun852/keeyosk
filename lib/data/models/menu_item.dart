import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/data/models/option.dart';

class MenuItem {
  final String name;
  final String id;
  final String description;
  final Category category;
  //TODO: make this a list of binary files
  final String imageUrl;
  final List<Option> options;
  final bool isAvailable;
  final double price;
  double? discount;

  MenuItem({
    required this.name,
    required this.id,
    this.description = 'No Description',
    this.discount,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.isAvailable,
    this.options = const [],
  });
}
