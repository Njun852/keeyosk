import 'dart:io';

import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/data/models/option.dart';

class MenuItem {
  final String name;
  final String id;
  final String description;
  final Category category;
  final List<File> images;
  // final String imageUrl;
  final List<Option> options;
  final bool isAvailable;
  final double price;
  double? discount;

  MenuItem({
    required this.name,
    required this.id,
    required this.description,
    this.discount,
    required this.images,
    required this.price,
    required this.category,
    required this.isAvailable,
    this.options = const [],
  });
}
