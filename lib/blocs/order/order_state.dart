import 'package:keeyosk/models/menu_item.dart';

abstract class OrderState {
  final MenuItem value;

  const OrderState({required this.value});
}

class OpenedOptions extends OrderState {
  const OpenedOptions({required super.value});
}


