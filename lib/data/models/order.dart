import 'package:keeyosk/data/models/cart.dart';
import 'package:keeyosk/data/models/user.dart';
import 'package:keeyosk/data/models/voucher.dart';

enum OrderStatus { completed, cancelled, pending }

class OrderId {
  static String id = '000001';
}

class Order {
  final String orderId;
  final List<Cart> carts;
  final List<Voucher> vouchersApplied;
  final OrderStatus status;
  final User customer;
  final DateTime time;

  Order({
    required this.time,
    required this.customer,
    required this.orderId,
    required this.carts,
    required this.vouchersApplied,
    required this.status,
  });
}
