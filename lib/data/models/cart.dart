import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/models/option_item.dart';

class Cart {
  final int id;
  final MenuItem item;
  final List<OptionItem> selectedOptions;
  final int quantity;

  Cart({
    required this.id,
    required this.item,
    required this.selectedOptions,
    required this.quantity,
  });
}
