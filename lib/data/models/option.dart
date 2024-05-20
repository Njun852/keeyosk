import 'package:keeyosk/data/models/option_item.dart';

class Option {
  final String id;
  final String menuItemId = 'test';
  bool isRequired;
  bool isMultiSelect;
  final String name;
  List<OptionItem> items;

  Option({
    required this.isRequired,
    required this.isMultiSelect,
    required this.name,
    required this.id,
    required this.items,
  });
}
