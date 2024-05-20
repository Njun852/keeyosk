import 'dart:io';

class CreateProductEvent {
  
}

class AddedImages extends CreateProductEvent{
  final List<File> images;

  AddedImages({required this.images});
}
