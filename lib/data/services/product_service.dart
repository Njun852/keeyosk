import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/repositories/category_repo.dart';
import 'package:keeyosk/data/repositories/menu_item_repo.dart';

class ProductService {
  final MenuItemRepo menuItemRepo = MenuItemRepo();
  final CategoryRepo categoryRepo = CategoryRepo();

  List<Category> getAllCategories() {
    return categoryRepo.getAllFinal();
  }

  List<MenuItem> getAllMenuItem() {
    return menuItemRepo.getAllFinal();
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
    final List<MenuItem> menuItems = getAllMenuItem();
    int index = menuItems.indexWhere((element) => element.id == id);
    menuItemRepo.delete(index);
  }
}
