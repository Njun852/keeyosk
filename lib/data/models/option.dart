import 'package:keeyosk/data/models/option_item.dart';

class Option {
  final String id = 'test';
  final String menuItemId = 'test';
  final bool isRequired;
  final bool isMultiSelect;
  final String name;
  final List<OptionItem> items;

  Option({
    required this.isRequired,
    required this.isMultiSelect,
    required this.name,
    this.items = const []
  });
}
