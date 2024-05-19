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
    final index = _items.indexWhere((e) => e.id == id);
    _items[index] = data;
  }

  @override
  void delete(String id) {
    _items.removeWhere((element) => element.id == id);
  }

  @override
  MenuItem get(String id) {
    return _items[_items.indexWhere((element) => element.id == id)];
  }
}
