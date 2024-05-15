import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/cart/cart_event.dart';
import 'package:keeyosk/blocs/cart/cart_state.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/data/models/cart.dart';
import 'package:keeyosk/data/models/option_item.dart';
import 'package:keeyosk/data/models/order.dart';
import 'package:keeyosk/data/models/user.dart';
import 'package:keeyosk/data/repositories/cart_repo.dart';
import 'package:keeyosk/data/repositories/order_repo.dart';
import 'package:keeyosk/data/services/socket_service.dart';
import 'package:keeyosk/utils/get_total_price.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:uuid/uuid.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo cartRepo;
  final List<Cart> selectedItems;
  final OrderRepo orderRepo;
  final String orderMode;

  CartBloc({
    required this.cartRepo,
    required this.selectedItems,
    required this.orderMode,
    required this.orderRepo,
  }) : super(
          CartState(
            items: cartRepo.getAll(),
            mode: orderMode,
            subtotal: 0,
            selectedItems: selectedItems,
          ),
        ) {
    on<ToggledCartItem>(
      (event, emit) {
        if (event.isAdded) {
          selectedItems.add(event.item);
        } else {
          selectedItems.removeWhere(
            (element) => element.id == event.item.id,
          );
        }
        emit(
          CartState(
            items: cartRepo.getAll(),
            mode: orderMode,
            selectedItems: selectedItems,
            subtotal: getSubTotal(selectedItems),
          ),
        );
      },
    );
    on<SwitchedMode>((event, emit) {
      emit(
        CartState(
          items: cartRepo.getAll(),
          mode: event.mode,
          selectedItems: selectedItems,
          subtotal: getSubTotal(selectedItems),
        ),
      );
    });
    on<ChangedQuantity>(((event, emit) {
      for (Cart item in cartRepo.getAll()) {
        if (item.id == event.id) {
          item.quantity = event.quantity;
          cartRepo.update(
            event.id,
            Cart(
                ownerId: item.ownerId,
                id: event.id,
                item: item.item,
                selectedOptions: item.selectedOptions,
                quantity: event.quantity),
          );
        }
      }
      emit(
        CartState(
          items: cartRepo.getAll(),
          mode: orderMode,
          selectedItems: selectedItems,
          subtotal: getSubTotal(selectedItems),
        ),
      );
    }));
    on<RemovedItem>((event, emit) {
      cartRepo.getAll().removeWhere((element) => element.id == event.id);
      selectedItems.removeWhere((element) => element.id == event.id);
      emit(
        CartState(
          items: cartRepo.getAll(),
          mode: orderMode,
          selectedItems: selectedItems,
          subtotal: getSubTotal(selectedItems),
        ),
      );
    });

    on<Checkout>(
      (event, emit) {
        final DateTime t = DateTime.now();
        int day = t.day;
        int month = t.month;
        int year = t.year;
        int hour = t.hour;
        int minute = t.minute;
        String suffix = 'AM';

        if (12 % hour == 12) {
          suffix = 'PM';
          hour = hour % 12;
        }
        String prefix = '';
        if (minute < 10) {
          prefix = '0';
        }
        String date = '$month/$day/$year';
        String time = '$hour:$prefix$minute$suffix';
        final Order order = Order(
          orderMode: orderMode,
          date: date,
          hour: time,
          customer: currentUser,
          carts: selectedItems,
          vouchersApplied: [],
          status: OrderStatus.pending,
        );
        emit(
          HasCheckout(
            order: order,
            items: cartRepo.getAll(),
            mode: orderMode,
            selectedItems: selectedItems,
            subtotal: getSubTotal(selectedItems),
          ),
        );
      },
    );
  }
}
