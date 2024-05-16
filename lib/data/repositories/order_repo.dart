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
    _orders.map((e) {
      if (e.id == id) {
        return Order(
          id: id,
          orderMode: data.orderMode,
          hour: data.hour,
          date: data.date,
          customer: data.customer,
          carts: data.carts,
          vouchersApplied: data.vouchersApplied,
          status: data.status,
        );
      }
    });
  }
}
