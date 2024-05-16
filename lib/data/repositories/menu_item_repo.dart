import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/repositories/repo.dart';

class MenuItemRepo implements Repo<MenuItem> {
  static final MenuItemRepo _repo = MenuItemRepo._sharedInstance();
  factory MenuItemRepo() => _repo;
  MenuItemRepo._sharedInstance();
  final List<MenuItem> _items = [];

  @override
  void add(MenuItem data) {
    _items.add(data);
  }

  @override
  void deleteAll() {
    _items.clear();
  }

  @override
  List<MenuItem> getAll() {
    return _items;
  }

  @override
  void init() {}

  @override
  void replaceAll(List<MenuItem> data) {
    _items.clear();
    _items.addAll(data);
  }

  @override
  void update(String id, MenuItem data) {
    _items.map((e) {
      if (e.id == id) {
        return MenuItem(
          name: data.name,
          id: id,
          imageUrl: data.imageUrl,
          price: data.price,
          category: data.category,
        );
      }
    });
  }

  @override
  void delete(String id) {
    _items.removeWhere((element) => element.id == id);
  }
}
