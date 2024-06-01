import 'package:keeyosk/blocs/cart/cart_state.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/data/models/cart.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/models/option.dart';
import 'package:keeyosk/data/models/option_item.dart';
import 'package:keeyosk/data/models/user.dart';
import 'package:keeyosk/data/models/voucher.dart';

enum OrderStatus { completed, cancelled, pending }

class Order {
  final String id;
  String? tableId;
  final List<Cart> carts;
  final List<Voucher> vouchersApplied;
  final OrderStatus status;
  final User customer;
  final String orderMode;
  final String hour;
  final String date;

  Order({
    required this.id,
    required this.orderMode,
    required this.hour,
    required this.date,
    required this.customer,
    this.tableId,
    required this.carts,
    required this.vouchersApplied,
    required this.status,
  });

  Map<String, dynamic> toJSON() {
    return {
      "order_id": id,
      "table_number": tableId,
      "order_hour": hour,
      "order_date": date,
      "user_id": customer.userId,
      "status": status.name,
      "order_mode": orderMode,
      "carts": carts.map((cart) => cart.toJSON()).toList(),
    };
  }

  static Order fromJSON(Map data) {
    final int index = users.indexWhere((e) => e.userId == data["user_id"]);
    final User user = users[index];
    final rawCarts = data["carts"] as List;
    final List<Cart> carts =
        rawCarts.map((cart) => Cart.fromJSON(cart)).toList();

    Map<String, OrderStatus> statuses = {
      "completed": OrderStatus.completed,
      "pending": OrderStatus.pending,
      "cancelled": OrderStatus.cancelled
    };
    Map<String, String> orderModes = {
      "dineIn": 'Dine In',
      "takeOut": 'Take Out'
    };
    return Order(
      id: data["order_id"],
      orderMode: orderModes[data["order_mode"]]!,
      hour: data["order_hour"],
      date: data["order_date"],
      customer: user,
      tableId: data["table_number"],
      carts: carts,
      vouchersApplied: [],
      status: statuses[data["status"]]!,
    );
  }
}
