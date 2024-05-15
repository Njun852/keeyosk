import 'package:keeyosk/data/models/option_item.dart';

class OptionState {
  final double additionalPrice;
  final int quantity;
  final bool allRequiredFilled;
  OptionState({
    required this.additionalPrice,
    required this.quantity,
    required this.allRequiredFilled,
  });
}

class InitialOptions extends OptionState {
  InitialOptions({
    required super.additionalPrice,
    required super.quantity,
    required super.allRequiredFilled,
  });
}

class OptionModified extends OptionState {
  final List<OptionItem> options;

  OptionModified({
    required super.quantity,
    required this.options,
    required super.additionalPrice,
    required super.allRequiredFilled,
  });
}
