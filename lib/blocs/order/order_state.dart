import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/models/order.dart';

abstract class OrderState {
  final List<Order> orders;

  const OrderState({required this.orders});
}

class Initial extends OrderState {
  Initial({required super.orders});
}
