import 'package:flutter/cupertino.dart';
import 'package:keeyosk/extensions/price_format.dart';

class PriceDisplay extends StatelessWidget {
  final double price;
  final double? discount;
  final double scale;
  final Color color;
  final double fontSize;
  const PriceDisplay({
    super.key,
    required this.price,
    this.scale = 1,
    required this.fontSize,
    required this.color,
    this.discount,
  });

  @override
  Widget build(BuildContext context) {
    final bigText = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: fontSize * scale,
      color: color,
    );

    if (discount == null) {
      return Text(
        price.toPrice(),
        style: bigText,
      );
    }
    return Row(
      children: [
        Text(
          discount!.toPrice(),
          style: bigText,
        ),
        SizedBox(
          width: 5 * scale,
        ),
        Transform.translate(
          offset: const Offset(0, 2),
          child: Text(
            price.toPrice(),
            style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: const Color.fromARGB(255, 120, 120, 120),
                fontSize: (fontSize - 5) * scale,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
