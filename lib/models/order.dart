import 'package:keeyosk/models/cart.dart';
import 'package:keeyosk/models/voucher.dart';

enum OrderStatus { completed, cancelled, pending }

class Order {
  final String orderId;
  final List<Cart> carts;
  final List<Voucher> vouchersApplied;
  final OrderStatus status;

  Order({
    required this.orderId,
    required this.carts,
    required this.vouchersApplied,
    required this.status,
  });
}
