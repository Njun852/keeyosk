import 'package:keeyosk/data/models/cart.dart';
import 'package:keeyosk/data/models/option_item.dart';

double getSubTotal(List<Cart> carts) {
  double sum = 0;
  for (Cart cart in carts) {
    double itemPrice = (cart.item.discount ?? cart.item.price);
    for (OptionItem item in cart.selectedOptions) {
      itemPrice += item.additionalPrice;
    }
    sum += itemPrice * cart.quantity;
  }
  return sum;
}
