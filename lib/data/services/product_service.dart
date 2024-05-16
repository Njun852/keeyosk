import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/repositories/category_repo.dart';
import 'package:keeyosk/data/repositories/menu_item_repo.dart';

class ProductService {
  final MenuItemRepo menuItemRepo = MenuItemRepo();
  final CategoryRepo categoryRepo = CategoryRepo();

  List<Category> getAllCategories() {
    return categoryRepo.getAll();
  }

  List<MenuItem> getAllMenuItem() {
    return menuItemRepo.getAll();
  }

  Map<String, MenuItem> groupItems() {
    final List<MenuItem> menuItems = getAllMenuItem();
    final Map<String, MenuItem> groupedItems = {};
    for (MenuItem item in menuItems) {
      groupedItems[item.category.label] = item;
    }
    return groupedItems;
  }

  void addMenuItem(MenuItem item) {
    menuItemRepo.add(item);
  }

  void removeMenuItem(String id) {
    menuItemRepo.delete(id);
  }
}
