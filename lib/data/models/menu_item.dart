import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/data/models/option.dart';
import 'package:keeyosk/data/models/option_item.dart';
import 'package:keeyosk/data/repositories/category_repo.dart';
import 'package:keeyosk/main.dart';
import 'package:path_provider/path_provider.dart';

class MenuItemImage {
  final String id;
  final Uint8List file;

  MenuItemImage({
    required this.id,
    required this.file,
  });

  static MenuItemImage fromJSON(Map<String, dynamic> data) {
    return MenuItemImage(
      id: data["image_id"],
      file: Uint8List.fromList(List<int>.from(data["file"])),
    );
  }

  Map<String, dynamic> toJSON(String productId) {
    return {
      "image_id": id,
      "file": file,
      "product_id": productId,
    };
  }
}

class MenuItem {
  final String name;
  final String id;
  final String description;
  final Category category;
  final List<MenuItemImage> images;
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

  Map<String, dynamic> toJSON() {
    return {
      "product_id": id,
      "product_name": name,
      "category": category.toJSON(),
      "price": price,
      "options": options.map((option) => option.toJSON()).toList(),
      "images": images.map((image) => image.toJSON(id)).toList(),
      "discount": discount,
      "description": description,
      "is_available": isAvailable
    };
  }

  static MenuItem fromJSON(Map<String, dynamic> data) {
    final String productId = data["product_id"];
    final double price = double.parse(data["price"].toString());

    final double? discount = double.tryParse(data["discount"].toString());
    final bool isAvailable = data["is_available"] as int == 1;
    final String description = data["description"];

    final String productName = data["product_name"];

    final rawImages = data["images"] as List;
    final rawOptions = data["options"] as List;
    final rawCategory = data["category"];
    final List<MenuItemImage> images =
        rawImages.map((image) => MenuItemImage.fromJSON(image)).toList();
    final List<Option> options =
        rawOptions.map((option) => Option.fromJSON(option)).toList();

    return MenuItem(
      name: productName,
      id: productId,
      description: description,
      images: images,
      price: price,
      options: options,
      discount: discount,
      category: Category.fromJSON(rawCategory),
      isAvailable: isAvailable,
    );
  }
}
