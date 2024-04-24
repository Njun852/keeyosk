import 'package:money_formatter/money_formatter.dart';

class MenuItem {
  final String name;
  final String? description;
  final String imageUrl;
  final double price;

  const MenuItem({
    required this.name,
    this.description,
    required this.imageUrl,
    required this.price,
  });

  String priceFormatted() {
    return MoneyFormatter(
      amount: price,
      settings: MoneyFormatterSettings(
        symbol: '₱',
      ),
    ).output.symbolOnLeft;
  }
}
