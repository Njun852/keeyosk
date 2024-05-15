class OrderEvent {}

class AcceptedOrder extends OrderEvent {
  final String orderId;

  AcceptedOrder({required this.orderId});
}

class RejectedOrder extends OrderEvent {
  final String orderId;

  RejectedOrder({required this.orderId});
}
