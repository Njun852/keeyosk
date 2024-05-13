import 'package:keeyosk/data/models/option_item.dart';

class OptionState {
  final double additionalPrice;
  OptionState({this.additionalPrice = 0});
}

class InitialOptions extends OptionState {
  InitialOptions();
}

class OptionModified extends OptionState {
  final int quantity;
  final List<OptionItem> options;

  OptionModified({
    required this.quantity,
    required this.options,
    super.additionalPrice,
  });
}
