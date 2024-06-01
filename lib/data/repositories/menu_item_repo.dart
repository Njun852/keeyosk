import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/repositories/repo.dart';
import 'package:keeyosk/data/services/http_service.dart';
import 'package:path_provider/path_provider.dart';

class MenuItemRepo implements Repo<MenuItem> {
  static final MenuItemRepo _repo = MenuItemRepo._sharedInstance();
  factory MenuItemRepo() => _repo;
  final HttpService service = HttpService();
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
  Future<List<MenuItem>> init() async {
    final response = await service.read(route: '/product/all');
    final List<Map<String, dynamic>> data =
        List<Map<String, dynamic>>.from(response);
    _items.clear();
    try {
      final List<MenuItem> items =
          data.map((item) => MenuItem.fromJSON(item)).toList();
      print(items);
      _items.addAll(items);
    } catch (e) {
      print(e);
    }

    return _items;
  }

  @override
  void replaceAll(List<MenuItem> data) {
    _items.clear();
    _items.addAll(data);
  }

  @override
  void update(String id, MenuItem data) {
    final index = _items.indexWhere((e) => e.id == id);
    _items[index] = data;
    service.update(route: '/product', id: id, data: data.toJSON());
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
