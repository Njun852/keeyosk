import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/models/option_item.dart';

double withSelectedOptions(
  MenuItem item,
  List<OptionItem> optionItems,
  bool isOriginal,
  int quantity,
) {

  double sum = isOriginal ? item.price : item.discount ?? 0;

  for (OptionItem option in optionItems) {
    sum += option.additionalPrice;
  }
  return sum * quantity;
}
