import 'package:keeyosk/data/models/cart.dart';

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
