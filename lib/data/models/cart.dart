import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/models/option.dart';
import 'package:keeyosk/data/models/option_item.dart';
import 'package:keeyosk/data/repositories/menu_item_repo.dart';

class Cart {
  final String id;
  final MenuItem item;
  final String ownerId;
  final List<OptionItem> selectedOptions;
  int quantity;

  Cart({
    required this.ownerId,
    required this.id,
    required this.item,
    required this.selectedOptions,
    required this.quantity,
  });

  Map<String, dynamic> toJSON() {
    return {
      "ownerId": ownerId,
      "cartId": id,
      "itemId": item.id,
      "selectedOptionsId": selectedOptions.map((e) => e.id).toList(),
      "quantity": quantity
    };
  }

  static Cart fromJSON(Map data) {
    int quantity = data["quantity"];
    String ownerId = data["ownerId"];
    String cartId = data["cartId"];
    String itemId = data["itemId"];
    List<dynamic> selectedOptionsId = data["selectedOptionsId"];
    final MenuItemRepo menuItemRepo = MenuItemRepo();
    MenuItem item = menuItemRepo.get(itemId);

    List<OptionItem> selectedOptions = [];
    for (Option option in item.options) {
      for (String optionId in selectedOptionsId) {
        int indexOfItem = option.items.indexWhere(
          (element) => element.id == optionId,
        );
        if (indexOfItem != -1) {
          selectedOptions.add(option.items[indexOfItem]);
        }
      }
    }
    return Cart(
      id: cartId,
      ownerId: ownerId,
      item: item,
      selectedOptions: selectedOptions,
      quantity: quantity,
    );
  }
}
