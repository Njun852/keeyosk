import 'dart:async';

import 'package:keeyosk/data/models/order.dart';
import 'package:keeyosk/data/repositories/repo.dart';

class OrderRepo implements Repo<Order> {
  final List<Order> _orders = [];
  static final _repo = OrderRepo._sharedInstance();
  factory OrderRepo() => _repo;
  OrderRepo._sharedInstance();
  @override
  void add(data) {
    _orders.add(data);
  }

  @override
  void delete(String id) {
    _orders.removeWhere((element) => element.id == id);
  }

  @override
  void deleteAll() {
    _orders.clear();
  }

  @override
  List<Order> getAll() {
    return _orders;
  }

  @override
  Future<List<Order>> init() async {
    return _orders;
  }

  @override
  void replaceAll(List<Order> data) {
    _orders.clear();
    _orders.addAll(data);
  }

  @override
  void update(String id, Order data) {
    final index = _orders.indexWhere((e) => e.id == id);
    _orders[index] = data;
  }

  @override
  Order get(String id) {
    return _orders[_orders.indexWhere((element) => element.id == id)];
  }
}

class OrderStream {
  static final _stream = OrderStream._sharedStream();
  OrderStream._sharedStream();

  factory OrderStream() => _stream;
  final StreamController<List<Order>> controller = StreamController.broadcast();
  void add(List<Order> orders) {
    controller.add(orders);
  }

  Stream<List<Order>> stream() => controller.stream;
}
