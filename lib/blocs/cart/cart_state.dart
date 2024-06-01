import 'package:keeyosk/data/models/cart.dart';
import 'package:keeyosk/data/models/order.dart';

enum OrderMode { takeOut, dineIn }

class CartState {
  final List<Cart> items;
  final double subtotal;
  final List<Cart> selectedItems;
  final OrderMode mode;

  CartState({
    required this.items,
    required this.mode,
    required this.selectedItems,
    required this.subtotal,
  });
}
class Initial extends CartState {
  Initial(
      {required super.items,
      required super.mode,
      required super.selectedItems,
      required super.subtotal});
}

class HasCheckout extends CartState {
  final Order order;
  HasCheckout({
    required this.order,
    required super.items,
    required super.mode,
    required super.selectedItems,
    required super.subtotal,
  });
}
