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

  MenuItemImage({required this.id, required this.file});
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

  static MenuItem fromJSON(Map<String, dynamic> data) {
    final rawImages = data["images"];
    final rawOptions = data["options"];
    final String productId = data["product_id"];
    final double price = double.parse(data["price"].toString());
    final double? discount = double.tryParse(data["discount"].toString());
    final bool isAvailable = data["is_available"] is int
        ? data["is_available"] == 1
        : data["is_available"];
    final String description = data["description"];
    final String productName = data["product_name"];
    final Category category = CategoryRepo().get(data["category_id"]);

    final List<MenuItemImage> images =
        List<MenuItemImage>.from(rawImages.map((image) {
      final String id = image["image_id"];

      //we do this because the structure is different in the backend
      if (image["file"] == null) {
        final List<int> byteArray = List<int>.from(image["image"]["data"]);
        return MenuItemImage(id: id, file: Uint8List.fromList(byteArray));
      }
      return MenuItemImage(id: id, file: image["file"]);
    }).toList());
    final List<Option> options = List<Option>.from(rawOptions.map((option) {
      final bool isRequired = option["is_required"] == 1;
      final bool isMultiSelect = option["is_multiselect"] == 1;
      final String optionName = option["option_name"];
      final String optionId = option["option_id"];
      final rawItems = option["option_items"];
      final List<OptionItem> items = List<OptionItem>.from(rawItems.map((item) {
        final String itemId = item["item_id"];
        final String itemName = item["item_name"];
        final int additionalPrice = item["additional_price"];
        return OptionItem(
            id: itemId,
            name: itemName,
            additionalPrice: additionalPrice.toDouble());
      }).toList());
      return Option(
        menuItemId: productId,
        isRequired: isRequired,
        isMultiSelect: isMultiSelect,
        name: optionName,
        id: optionId,
        items: items,
      );
    }).toList());

    return MenuItem(
        name: productName,
        id: productId,
        description: description,
        images: images,
        options: options,
        price: price.toDouble(),
        category: category,
        isAvailable: isAvailable,
        discount: discount);
  }
}
