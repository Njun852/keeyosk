import 'package:keeyosk/blocs/cart/cart_state.dart';
import 'package:keeyosk/data/models/cart.dart';

class CartEvent {}

class ToggledCartItem extends CartEvent {
  final Cart item;
  final bool isAdded;
  ToggledCartItem({
    required this.item,
    required this.isAdded,
  });
}

class SwitchedMode extends CartEvent {
  final OrderMode mode;

  SwitchedMode({required this.mode});
}

class ChangedQuantity extends CartEvent {
  final String id;
  final int quantity;

  ChangedQuantity({required this.id, required this.quantity});
}

class RemovedItem extends CartEvent {
  final String id;
  RemovedItem({required this.id});
}

class Checkout extends CartEvent {}
