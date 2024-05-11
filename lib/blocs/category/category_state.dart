import 'package:keeyosk/data/models/category.dart';

class CategoryState {
  final List<Category> categories;

  CategoryState({required this.categories});
}

class Empty extends CategoryState {
  Empty({required super.categories});
}
