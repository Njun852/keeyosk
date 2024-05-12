import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/data/models/option.dart';

class MenuItem {
  final String name;
  final String id = 'test';
  final String description;
  final Category category;
  //TODO: make this a list of binary files
  final String imageUrl;
  final List<Option> options;
  final double price;
  double? discount;

  MenuItem({
    required this.name,
    this.description = 'No Description',
    this.discount,
    required this.imageUrl,
    required this.price,
    required this.category,
    this.options = const []
  });
}
