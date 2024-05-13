import 'package:keeyosk/data/models/order.dart';
import 'package:keeyosk/data/repositories/repo.dart';

class OrderRepo implements Repo<Order> {
  final List<Order> _orders = [];
  @override
  void add(Order data) {
    _orders.add(data);
  }

  @override
  void apply() {}

  @override
  void delete(int index) {
    _orders.removeAt(index);
  }

  @override
  void deleteAll() {
    _orders.clear();
  }

  @override
  void deleteAllFinal() {
    _orders.clear();
  }

  @override
  List<Order> getAll() {
    return _orders;
  }

  @override
  List<Order> getAllFinal() {
    return _orders;
  }

  @override
  void init() {
    // TODO: implement init
  }

  @override
  void replaceAll(List<Order> data) {
    _orders.clear();
    _orders.addAll(data);
  }

  @override
  void update(int index, Order data) {
    _orders[index] = data;
  }
}
