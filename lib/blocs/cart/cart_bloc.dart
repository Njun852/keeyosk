import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/cart/cart_event.dart';
import 'package:keeyosk/blocs/cart/cart_state.dart';
import 'package:keeyosk/data/models/cart.dart';
import 'package:keeyosk/data/repositories/cart_repo.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo cartRepo;
  final List<Cart> selectedItems;
  OrderMode mode;

  CartBloc({
    required this.cartRepo,
    required this.selectedItems,
    required this.mode,
  }) : super(
          CartState(
            items: cartRepo.getAll(),
            mode: mode,
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
            mode: mode,
            selectedItems: selectedItems,
            subtotal: getSubTotal(),
          ),
        );
      },
    );
    on<SwitchedMode>((event, emit) {
      mode = event.mode;
      emit(
        CartState(
          items: cartRepo.getAll(),
          mode: mode,
          selectedItems: selectedItems,
          subtotal: getSubTotal(),
        ),
      );
    });
    on<ChangedQuantity>(((event, emit) {
      for (Cart item in cartRepo.getAll()) {
        if (item.id == event.id) {
          item.quantity = event.quantity;
        }
      }
      emit(
        CartState(
          items: cartRepo.getAll(),
          mode: mode,
          selectedItems: selectedItems,
          subtotal: getSubTotal(),
        ),
      );
    }));
    on<RemovedItem>((event, emit) {
      cartRepo.getAll().removeWhere((element) => element.id == event.id);
      selectedItems.removeWhere((element) => element.id == event.id);
      emit(
        CartState(
          items: cartRepo.getAll(),
          mode: mode,
          selectedItems: selectedItems,
          subtotal: getSubTotal(),
        ),
      );
    });
  }

  double getSubTotal() {
    double sum = 0;
    for (Cart cart in selectedItems) {
      sum += cart.item.discount ?? cart.item.price;
    }
    return sum;
  }
}
