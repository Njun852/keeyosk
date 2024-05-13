import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/option/option_event.dart';
import 'package:keeyosk/blocs/option/option_state.dart';
import 'package:keeyosk/data/models/cart.dart';
import 'package:keeyosk/data/models/option_item.dart';
import 'package:keeyosk/data/repositories/cart_repo.dart';

class OptionBloc extends Bloc<OptionEvent, OptionState> {
  final CartRepo repo = CartRepo();
  final List<OptionItem> selectedOptions = [];
  int quantity = 1;

  OptionBloc() : super(InitialOptions()) {
    on<ChangedQuantity>((event, emit) {
      quantity += event.updatedQuantity;
      emit(OptionModified(
        quantity: quantity,
        additionalPrice: getAdditionalPrice(),
        options: selectedOptions,
      ));
    });
    on<SelectedOption>(
      (event, emit) {
        final int index = selectedOptions.indexWhere(
          (element) => element.name == event.item.name,
        );
        if (index != -1 &&
            event.item.name == selectedOptions[index].name) {
          selectedOptions.removeAt(index);
        } else {
          selectedOptions.add(event.item);
        }

        if (!event.isMultiSelect) {
          for (OptionItem item in event.others) {
            selectedOptions.removeWhere((element) => element.name == item.name);
          }
        }

        emit(OptionModified(
          quantity: quantity,
          additionalPrice: getAdditionalPrice(),
          options: selectedOptions,
        ));
      },
    );

    on<Apply>((event, emit) {
      repo.apply(
        Cart(
          id: 1,
          item: event.item,
          selectedOptions: selectedOptions,
          quantity: quantity,
        ),
      );
    });
  }

  double getAdditionalPrice() {
    if (selectedOptions.isEmpty) return 0;
    return selectedOptions.map((e) => e.additionalPrice).toList().reduce(
          (value, element) => value + element,
        );
  }
}
