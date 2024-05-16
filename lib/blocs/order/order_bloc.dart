import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/order/order_event.dart';
import 'package:keeyosk/blocs/order/order_state.dart';
import 'package:keeyosk/data/models/order.dart';
import 'package:keeyosk/data/repositories/order_repo.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderRepo orderRepo;
  OrderBloc({required this.orderRepo, required List<Order> orders})
      : super(Initial(orders: orders)) {
    on<AcceptedOrder>(
      (event, emit) {
        orderRepo.delete(event.orderId);
      },
    );
    on<RejectedOrder>(
      (event, emit) {
        orderRepo.delete(event.orderId);
      },
    );
  }
}
