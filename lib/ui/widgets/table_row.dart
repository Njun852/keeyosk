// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:keeyosk/constants/colors.dart';

class TableItem {
  final int flex;
  final Alignment alignment;
  final Widget widget;

  TableItem({
    required this.flex,
    required this.widget,
    this.alignment = Alignment.center,
  });
}

class TableRowWidget extends StatelessWidget {
  final List<TableItem> items;
  final Color backgroundColor;
  final bool shouldHaveDivider;
  final double height;
  const TableRowWidget({
    super.key,
    required this.items,
    this.shouldHaveDivider = true,
    required this.backgroundColor,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: double.infinity,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: List.generate(items.length, (index) {
                return Flexible(
                  fit: FlexFit.tight,
                  flex: items[index].flex,
                  child: Align(
                    alignment: items[index].alignment,
                    child: items[index].widget,
                  ),
                );
              }),
            ),
          ),
          Expanded(child: Container()),
          shouldHaveDivider
              ? Divider(
                  height: 0,
                )
              : SizedBox()
        ],
      ),
    );
  }
}
