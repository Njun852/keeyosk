import 'dart:async';

import 'package:keeyosk/data/models/order.dart';
import 'package:keeyosk/data/repositories/repo.dart';
import 'package:keeyosk/data/services/http_service.dart';

class OrderRepo implements Repo<Order> {
  final List<Order> _orders = [];
  final HttpService service = HttpService();
  static final _repo = OrderRepo._sharedInstance();
  factory OrderRepo() => _repo;
  OrderRepo._sharedInstance();
  @override
  void add(data) {
    _orders.add(data);
    // service.write(route: '/order', data: data.toJSON());
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
    final response = await service.read(route: '/order/all');
    final List data = response["data"];
    // final List<Order> orders = data.map((e) => Order.fromJSON(e)).toList();
    // print(orders);
    // _orders.clear();
    // _orders.addAll(orders);
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
