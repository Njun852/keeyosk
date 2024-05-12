import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/repositories/repo.dart';

class MenuItemRepo implements Repo<MenuItem> {
  static final MenuItemRepo _repo = MenuItemRepo._sharedInstance();
  factory MenuItemRepo() => _repo;
  MenuItemRepo._sharedInstance();
  final List<MenuItem> _items = [];
  final List<MenuItem> _final = [];

  @override
  void add(MenuItem data) {
    _items.add(data);
  }

  @override
  void apply() {
    _final.clear();
    _final.addAll(_items);
  }

  @override
  void deleteAll() {
    _items.clear();
  }

  @override
  void deleteAllFinal() {
    _final.clear();
    _items.clear();
  }

  @override
  List<MenuItem> getAll() {
    return _items;
  }

  @override
  List<MenuItem> getAllFinal() {
    return _final;
  }

  @override
  void init() {
    _items.clear();
    _items.addAll(_final);
  }

  @override
  void replaceAll(List<MenuItem> data) {
    _items.clear();
    _items.addAll(data);
  }

  @override
  void update(int index, MenuItem data) {
    _items[index] = data;
  }

  @override
  void delete(int index) {
    _items.remove(_items[index]);
  }
}
