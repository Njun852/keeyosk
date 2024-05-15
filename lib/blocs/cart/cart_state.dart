import 'package:keeyosk/data/models/cart.dart';
import 'package:keeyosk/data/models/order.dart';

enum OrderMode { takeOut, dineIn }

class CartState {
  final List<Cart> items;
  final double subtotal;
  final List<Cart> selectedItems;
  final String mode;

  CartState({
    required this.items,
    required this.mode,
    required this.selectedItems,
    required this.subtotal,
  });
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
