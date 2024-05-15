import 'package:flutter/cupertino.dart';
import 'package:keeyosk/utils/extensions/price_format.dart';

class PriceDisplay extends StatelessWidget {
  final double price;
  final double discount;
  final double scale;
  final Color color;
  final double fontSize;
  const PriceDisplay({
    super.key,
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
        fontFamily: 'Roboto');

    if (discount  == 0) {
      return Text(
        price.toPrice(),
        style: bigText,
      );
    }
    return Row(
      children: [
        Text(
          discount.toPrice(),
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
                fontFamily: 'Roboto',
                color: const Color.fromARGB(255, 120, 120, 120),
                fontSize: (fontSize - 5) * scale,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
