import 'dart:io';
import 'dart:ui';

import 'package:keeyosk/data/models/option.dart';

class CreateProductState {
  final List<File> images;
  final double discountedPrice;
  final double price;
  final List<Option> options;
  CreateProductState({
    required this.options,
    required this.discountedPrice,
    required this.price,
    required this.images,
  });
}

class Initial extends CreateProductState {
  Initial({
    required super.images,
    required super.discountedPrice,
    required super.price,
    required super.options,
  });
}

class AddedImages extends CreateProductState {
  AddedImages({
    required super.discountedPrice,
    required super.price,
    required super.images,
    required super.options,
  });
}
