import 'dart:io';

import 'package:keeyosk/blocs/create_product/create_product_bloc.dart';

class CreateProductEvent {}

class PickedImages extends CreateProductEvent {
  final List<File> images;
  PickedImages({required this.images});
}

class ChangedPrice extends CreateProductEvent {
  final double price;

  ChangedPrice({required this.price});
}

class ChangedDiscountPrice extends CreateProductEvent {
  final double discount;
  ChangedDiscountPrice({required this.discount});
}

class AddOption extends CreateProductEvent {}

class AddOptionItem extends CreateProductEvent {
  final String optionId;

  AddOptionItem({required this.optionId});
}

class RemovedItem extends CreateProductEvent {
  final String id;

  RemovedItem({required this.id});
}

class RemovedOption extends CreateProductEvent {
  final String id;

  RemovedOption({required this.id});
}

class ToggledCheckbox extends CreateProductEvent {
  final bool isMultiSelect;
  final bool isRequired;
  final String id;
  ToggledCheckbox(
    this.id, {
    required this.isMultiSelect,
    required this.isRequired,
  });
}

class RemovedImage extends CreateProductEvent {
  final File image;
  RemovedImage({required this.image});
}
