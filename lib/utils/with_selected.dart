import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/models/option_item.dart';

double getItemPriceWithSelected(
  MenuItem item,
  List<OptionItem> optionItems,
  bool isOriginal,
  int quantity,
) {
  print(optionItems.length);
  double sum = isOriginal ? item.price : item.discount ?? 0;
  if (sum == 0) return 0;
  for (OptionItem option in optionItems) {
    sum += option.additionalPrice;
  }
  print(sum * quantity);
  return sum * quantity;
}
