import 'package:keeyosk/data/models/order.dart';
import 'package:keeyosk/data/repositories/repo.dart';

class OrderRepo implements Repo<Order> {
  final List<Order> _orders = [];
  static final _repo = OrderRepo._sharedInstance();
  factory OrderRepo() => _repo;
  OrderRepo._sharedInstance();
  @override
  void add(data) {
    print(data.carts.first.item.price);
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
  void init() {
    // TODO: implement init
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
