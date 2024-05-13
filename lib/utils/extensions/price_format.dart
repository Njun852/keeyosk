import 'package:money_formatter/money_formatter.dart';

extension PriceFormat on num {
  String toPrice() {
    return MoneyFormatter(
      amount: toDouble(),
      settings: MoneyFormatterSettings(
        symbol: '₱',
      ),
    ).output.symbolOnLeft.replaceFirst(RegExp(r' '), '');
  }

  String toPriceNoSymbol() {
    return MoneyFormatter(
      amount: toDouble(),
      settings: MoneyFormatterSettings(
        symbol: '',
      ),
    ).output.symbolOnLeft.replaceFirst(RegExp(r' '), '');
  }
}
