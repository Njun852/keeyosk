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
  final bool hidden;
  final List<OptionItem> selectedOptions;
  int quantity;

  Cart({
    this.hidden = false,
    required this.ownerId,
    required this.id,
    required this.item,
    required this.selectedOptions,
    required this.quantity,
  });

  Map<String, dynamic> toJSON() {
    return {
      "user_id": ownerId,
      "cart_id": id,
      "product_id": item.id,
      "selected_options": selectedOptions.map((selected) {
        return selected.toJSON(item.options.firstWhere((option) {
          return option.items.indexWhere((item) {
                return item.id == selected.id;
              }) !=
              -1;
        }).id);
      }).toList(),
      "quantity": quantity,
      "is_hidden": hidden ? 1 : 0
    };
  }

  static Cart fromJSON(Map<String, dynamic> data) {
    print('yooo');
    print(data);
    final String cartId = data["cart_id"];
    final String productId = data["product_id"];
    final int quantity = data["quantity"];
    final String userId = data["user_id"];
    final bool isHidden = data["is_hidden"] == 1;
    final MenuItem item = MenuItemRepo().get(productId);
    final List rawOptions = data["selected_options"];
    final List<OptionItem> selectedOptions =
        rawOptions.map((option) => OptionItem.fromJSON(option)).toList();
    return Cart(
        ownerId: userId,
        id: cartId,
        item: item,
        hidden: isHidden,
        selectedOptions: selectedOptions,
        quantity: quantity);
  }
}
