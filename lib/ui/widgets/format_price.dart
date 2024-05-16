// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:keeyosk/utils/extensions/price_format.dart';

class FormatPrice extends StatelessWidget {
  final double price;
  final TextStyle style;
  final TextAlign align;

  const FormatPrice({
    super.key,
    this.align = TextAlign.left,
    required this.price,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: '₱',
          style: style.copyWith(fontFamily: 'Roboto'),
          children: [
            TextSpan(
              text: price.toPrice(),
              style: style,
            )
          ]),
    );
  }
}
