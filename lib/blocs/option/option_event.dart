import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/models/option_item.dart';

class OptionEvent {}

class ChangedQuantity extends OptionEvent {
  final int updatedQuantity;
  ChangedQuantity({required this.updatedQuantity});
}
class Setup extends OptionEvent {}
class SelectedOption extends OptionEvent {
  final String itemId;
  final String optionId;
  // final List<OptionItem> others;
  SelectedOption({
    required this.itemId,
    required this.optionId,
  });
}

class UnselectedOption extends OptionEvent {
  final List<OptionItem> items;
  UnselectedOption({required this.items});
}

class Apply extends OptionEvent {
  MenuItem item;
  Apply({required this.item});
}
