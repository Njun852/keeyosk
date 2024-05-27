import 'dart:io';
import 'dart:ui';

import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/models/option.dart';

class CreateProductState {
  final List<MenuItemImage> images;
  final double? discountedPrice;
  final double price;
  final List<Option> options;
  final String productName;
  final String? description;
  final String categoryId;
  CreateProductState({
    required this.options,
    required this.discountedPrice,
    required this.price,
    required this.productName,
    this.description,
    required this.categoryId,
    required this.images,
  });
}

class Initial extends CreateProductState {
  Initial({
    required super.images,
    super.discountedPrice,
    required super.price,
    required super.options,
    required super.productName,
    super.description,
    required super.categoryId,
  });
}

class AddedImagesState extends CreateProductState {
  AddedImagesState({
    super.discountedPrice,
    required super.price,
    required super.images,
    required super.options,
    required super.productName,
    super.description,
    required super.categoryId,
  });
}

class RemovedImageState extends CreateProductState {
  RemovedImageState({
    required super.options,
    super.discountedPrice,
    required super.price,
    required super.images,
    required super.productName,
    super.description,
    required super.categoryId,
  });
}
