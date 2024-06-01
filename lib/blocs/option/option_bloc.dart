import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/option/option_event.dart';
import 'package:keeyosk/blocs/option/option_state.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/data/models/cart.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/models/option.dart';
import 'package:keeyosk/data/models/option_item.dart';
import 'package:keeyosk/data/repositories/cart_repo.dart';
import 'package:keeyosk/data/services/http_service.dart';
import 'package:uuid/uuid.dart';

class OptionBloc extends Bloc<OptionEvent, OptionState> {
  final CartRepo repo = CartRepo();
  final List<OptionItem> selectedOptions = [];
  final MenuItem item;
  int quantity = 1;

  OptionBloc({required this.item})
      : super(InitialOptions(
          quantity: 1,
          additionalPrice: 0,
          allRequiredFilled: item.options.isEmpty,
        )) {
    on<Setup>((event, emit) {
      emit(OptionModified(
        quantity: quantity,
        allRequiredFilled: filledRequiredOptions(),
        additionalPrice: getAdditionalPrice(),
        options: selectedOptions,
      ));
    });
    on<ChangedQuantity>((event, emit) {
      quantity += event.updatedQuantity;
      emit(OptionModified(
        quantity: quantity,
        allRequiredFilled: filledRequiredOptions(),
        additionalPrice: getAdditionalPrice(),
        options: selectedOptions,
      ));
    });
    on<SelectedOption>(
      (event, emit) {
        final option = item.options[
            item.options.indexWhere((element) => element.id == event.optionId)];
        final optionItem = option.items[
            option.items.indexWhere((element) => element.id == event.itemId)];

        final indexWhereItExist = selectedOptions
            .indexWhere((element) => element.id == optionItem.id);
        if (!option.isMultiSelect) {
          for (var i = 0; i < option.items.length; i++) {
            for (var j = 0; j < selectedOptions.length; j++) {
              if (option.items[i].id == selectedOptions[j].id) {
                selectedOptions.removeAt(j);
              }
            }
          }
        }
        if (option.isMultiSelect && indexWhereItExist != -1) {
          selectedOptions.removeAt(indexWhereItExist);
        } else {
          selectedOptions.add(optionItem);
        }
        emit(OptionModified(
          quantity: quantity,
          allRequiredFilled: filledRequiredOptions(),
          additionalPrice: getAdditionalPrice(),
          options: selectedOptions,
        ));
      },
    );

    on<Apply>((event, emit) {
      HttpService service = HttpService();
      final Cart newCart = Cart(
        ownerId: currentUser.userId,
        id: const Uuid().v1(),
        item: event.item,
        selectedOptions: selectedOptions,
        quantity: quantity,
      );
      repo.add(newCart);
    });
  }

  double getAdditionalPrice() {
    if (selectedOptions.isEmpty) return 0;
    return selectedOptions.map((e) => e.additionalPrice).toList().reduce(
          (value, element) => value + element,
        );
  }

  bool filledRequiredOptions() {
    List<bool> allOptionIsFilled = [];
    for (Option option in item.options) {
      if (!option.isRequired) continue;
      bool isFilled = false;
      bool hasFound = false;
      for (OptionItem item in option.items) {
        for (OptionItem selectedItem in selectedOptions) {
          if (item.id == selectedItem.id) {
            isFilled = true;
            hasFound = true;
            break;
          }
        }
        if (hasFound) {
          allOptionIsFilled.add(isFilled);
          break;
        }
      }
    }
    return (!allOptionIsFilled.contains(false) &&
            allOptionIsFilled.isNotEmpty) ||
        allOptionIsFilled.isEmpty;
  }
}
