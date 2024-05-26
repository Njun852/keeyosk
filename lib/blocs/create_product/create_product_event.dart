import 'dart:io';

import 'package:keeyosk/blocs/create_product/create_product_bloc.dart';
import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/data/models/menu_item.dart';

class CreateProductEvent {}

class AddedImages extends CreateProductEvent {
  final List<File> images;
  AddedImages({required this.images});
}

class RemovedImage extends CreateProductEvent {
  final File image;
  RemovedImage({required this.image});
}

class AddedOption extends CreateProductEvent {}

class UpdatedOption extends CreateProductEvent {
  final String optionName;
  final bool isMultiSelect;
  final String optionId;
  final bool isRequired;

  UpdatedOption({
    required this.optionId,
    required this.optionName,
    required this.isMultiSelect,
    required this.isRequired,
  });
}

class RemovedOption extends CreateProductEvent {
  final String id;

  RemovedOption({required this.id});
}

class AddedOptionItem extends CreateProductEvent {
  final String optionId;

  AddedOptionItem({required this.optionId});
}

class UpdatedOptionItem extends CreateProductEvent {
  final String optionItemId;
  final String itemName;
  final double extraCharge;

  UpdatedOptionItem({
    required this.optionItemId,
    required this.itemName,
    required this.extraCharge,
  });
}

class RemovedOptionItem extends CreateProductEvent {
  final String id;

  RemovedOptionItem({required this.id});
}

class UpdatedProduct extends CreateProductEvent {
  final String name;
  final double price;
  final double? discount;
  final String? description;
  final String categoryId;

  UpdatedProduct({
    required this.name,
    required this.price,
    required this.categoryId,
    this.discount,
    this.description,
  });
}

class AddProduct extends CreateProductEvent {}
