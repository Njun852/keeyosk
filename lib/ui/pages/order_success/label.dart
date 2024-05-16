// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/ui/widgets/format_price.dart';

class Label extends StatelessWidget {
  final String right;
  final String left;
  final bool includesPrice;
  const Label({
    super.key,
    required this.left,
    required this.right,
    this.includesPrice = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          left,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Color.fromRGBO(120, 120, 120, 1),
          ),
        ),
        Expanded(
          child: Container(),
        ),
        includesPrice
            ? FormatPrice(
                price: double.parse(right),
                style: TextStyle(
                  fontSize: 15,
                  color: primary,
                  fontWeight: FontWeight.w600,
                ),
              )
            : Text(
                right,
                style: TextStyle(
                  fontSize: 15,
                  color: primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ],
    );
  }
}
