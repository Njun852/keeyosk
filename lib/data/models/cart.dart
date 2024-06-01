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
      "selected_options": selectedOptions.map((e) => e.id).toList(),
      "quantity": quantity
    };
  }

  static Cart fromJSON(Map data) {
    int quantity = data["quantity"];
    String ownerId = data["user_id"];
    String cartId = data["cart_id"];
    String productId = data["product_id"];
    List<dynamic> selectedOptions = data["selected_options"];
    final MenuItemRepo menuItemRepo = MenuItemRepo();
    MenuItem item = menuItemRepo.get(productId);

    return Cart(
      id: cartId,
      ownerId: ownerId,
      item: item,
      hidden: data["is_hidden"] == 1,
      selectedOptions: selectedOptions.map((option) {
        int index = -1;
        int outer = -1;
        for (var i = 0; i < item.options.length; i++) {
          for (var j = 0; j < item.options[i].items.length; j++) {
            if (item.options[i].items[j].id == option["item_id"]) {
              index = j;
              outer = i;
              break;
            }
          }
          if (outer != -1) {
            break;
          }
        }
        return OptionItem(
            id: option["item_id"],
            name: item.options[outer].items[index].name,
            additionalPrice: item.options[outer].items[index].additionalPrice);
      }).toList(),
      quantity: quantity,
    );
  }
}
