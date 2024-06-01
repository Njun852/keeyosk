import 'package:keeyosk/data/models/option_item.dart';

class Option {
  final String id;
  final String menuItemId;
  final bool isRequired;
  final bool isMultiSelect;
  final String name;
  final List<OptionItem> items;

  Option({
    required this.menuItemId,
    required this.isRequired,
    required this.isMultiSelect,
    required this.name,
    required this.id,
    required this.items,
  });

  static Option fromJSON(Map<String, dynamic> data) {
    final rawItems = data["items"] as List;
    final List<OptionItem> items =
        rawItems.map((item) => OptionItem.fromJSON(item)).toList();
    return Option(
        menuItemId: data["product_id"],
        isRequired: data["is_required"] == 1,
        isMultiSelect: data["is_multiselect"] == 1,
        name: data["option_name"],
        id: data["option_id"],
        items: items);
  }

  Map<String, dynamic> toJSON() {
    return {
      "option_id": id,
      "product_id": menuItemId,
      "option_name": name,
      "items": items.map((item) => item.toJSON(id)).toList(),
      "is_required": isRequired ? 1 : 0,
      "is_multiselect": isMultiSelect ? 1 : 0
    };
  }
}
