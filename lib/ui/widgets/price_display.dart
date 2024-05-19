import 'package:flutter/cupertino.dart';
import 'package:keeyosk/ui/widgets/format_price.dart';
import 'package:keeyosk/utils/extensions/price_format.dart';

class PriceDisplay extends StatelessWidget {
  final double price;
  final double discount;
  final double scale;
  final Color color;
  final bool shouldStack;
  final double fontSize;
  const PriceDisplay({
    super.key,
    this.shouldStack = false,
    required this.price,
    this.scale = 1,
    required this.fontSize,
    required this.color,
    this.discount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final bigText = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: fontSize * scale,
      color: color,
    );

    if (discount == 0) {
      return FormatPrice(
        price: price,
        style: bigText,
      );
    }
    final children = [
      FormatPrice(
        price: discount,
        style: bigText,
      ),
      SizedBox(
        width: 5 * scale,
      ),
      Transform.translate(
        offset: const Offset(0, 2),
        child: FormatPrice(
          price: price,
          style: TextStyle(
              decoration: TextDecoration.lineThrough,
              color: const Color.fromARGB(255, 120, 120, 120),
              fontSize: (fontSize - 5) * scale,
              fontWeight: FontWeight.w500),
        ),
      )
    ];
    if (shouldStack) {
      return Column(
        children: children,
      );
    }

    return Row(children: children);
  }
}
