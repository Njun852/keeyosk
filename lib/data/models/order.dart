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
      "id": id,
      "tableId": tableId,
      "hour": hour,
      "date": date,
      "customerId": customer.userId,
      "status": status.name,
      "orderMode": orderMode,
      "cart": carts.map((cart) => cart.toJSON()).toList(),
    };
  }

  static Order fromJSON(Map data) {
    final int customerIndex = users.indexWhere(
      (element) => element.userId == data["customerId"],
    );
    final User customer = users[customerIndex];
    final List<Cart> carts = [];

    for (Map cartItem in data["cart"]) {
      carts.add(Cart.fromJSON(cartItem));
    }
    return Order(
      id: data["id"],
      orderMode: data["orderMode"],
      hour: data["hour"],
      date: data["date"],
      customer: customer,
      tableId: data["tableId"],
      carts: carts,
      vouchersApplied: [],
      status: OrderStatus.pending,
    );
  }
}
