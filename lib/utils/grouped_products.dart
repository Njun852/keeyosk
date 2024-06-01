import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/repositories/category_repo.dart';
import 'package:keeyosk/data/repositories/menu_item_repo.dart';

List<List<MenuItem>> groupedProducts() {
  return CategoryRepo().getAll().map((category) {
    final products = MenuItemRepo().getAll();
    return products.where((item) => item.category.id == category.id).toList();
  }).toList();
}
