import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/models/option_item.dart';

class OptionEvent {}

class ChangedQuantity extends OptionEvent {
  final int updatedQuantity;
  ChangedQuantity({required this.updatedQuantity});
}

class SelectedOption extends OptionEvent {
  final OptionItem item;
  final bool isMultiSelect;
  final List<OptionItem> others;
  SelectedOption({
    required this.item,
    required this.others,
    required this.isMultiSelect,
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
