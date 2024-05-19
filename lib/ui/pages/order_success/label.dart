// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
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
        Expanded(
          flex: 3,
          child: AutoSizeText(
            left,
            maxLines: 2,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Color.fromRGBO(120, 120, 120, 1),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Text(
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
