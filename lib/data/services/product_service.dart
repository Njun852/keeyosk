import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/repositories/cart_repo.dart';
import 'package:keeyosk/data/repositories/category_repo.dart';
import 'package:keeyosk/data/repositories/menu_item_repo.dart';

class ProductService {
  final MenuItemRepo menuItemRepo = MenuItemRepo();
  final CartRepo cartRepo = CartRepo();
  final CategoryRepo categoryRepo = CategoryRepo();

  Future<Map<String, dynamic>> init() async {
    final categories = await categoryRepo.init();
    final items = await menuItemRepo.init();
    await cartRepo.init();
    return {"products": items, "categories": categories};
  }

  List<Category> getAllCategories() {
    return categoryRepo.getAll();
  }

  List<MenuItem> getAllMenuItem() {
    return menuItemRepo.getAll();
  }

  Future<Map<String, MenuItem>> groupItems() async {
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
