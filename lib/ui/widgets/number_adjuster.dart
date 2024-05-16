// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keeyosk/constants/colors.dart';

typedef Callback = void Function();

class NumberAdjuster extends StatelessWidget {
  final Callback onSub;
  final Callback onAdd;
  final Color outlineColor;
  final bool showIndicator;
  final Color btnColor;

  final int quantity;
  const NumberAdjuster({
    super.key,
    required this.onAdd,
    this.outlineColor = Colors.transparent,
    required this.btnColor,
    this.showIndicator = false,
    required this.quantity,
    required this.onSub,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(4),
            ),
            border: Border(
              left: BorderSide(
                color: outlineColor,
              ),
              top: BorderSide(
                color: outlineColor,
              ),
              bottom: BorderSide(
                color: outlineColor,
              ),
            ),
            color: quantity > 1 || !showIndicator ? btnColor : Colors.grey,
          ),
          child: IconButton(
            style: ButtonStyle(
              visualDensity: VisualDensity.compact,
              padding: WidgetStatePropertyAll(EdgeInsets.zero),
            ),
            onPressed: onSub,
            icon: Icon(
              Icons.remove,
              size: 15,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          width: 30,
          alignment: Alignment.center,
          height: 24,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
              )),
          child: Text(
            quantity.toString(),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(4),
              ),
              border: Border(
                right: BorderSide(
                  color: outlineColor,
                ),
                top: BorderSide(
                  color: outlineColor,
                ),
                bottom: BorderSide(
                  color: outlineColor,
                ),
              ),
              color: btnColor),
          width: 24,
          height: 24,
          child: IconButton(
            style: ButtonStyle(
              visualDensity: VisualDensity.compact,
              padding: WidgetStatePropertyAll(EdgeInsets.zero),
            ),
            onPressed: onAdd,
            icon: Icon(
              Icons.add,
              size: 15,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
