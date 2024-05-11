import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/extensions/price_format.dart';
import 'package:keeyosk/models/menu_item.dart';
import 'package:keeyosk/ui/pages/product/product_page.dart';

class ItemViewParams {
  final String title;
  final Widget prefix;
  final Widget postfix;
  final String subheading;
  final double? subheadingSize;
  final double? padding;
  ItemViewParams(
      {required this.title,
      required this.prefix,
      required this.postfix,
      required this.subheading,
      this.padding,
      this.subheadingSize});
}

class MenuItemView extends StatelessWidget {
  final ItemViewParams params;
  const MenuItemView({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(90, 0, 0, 0),
              offset: Offset(0, 2),
              blurRadius: 0.4,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        padding: EdgeInsets.all(params.padding ?? 8),
        height: 85,
        child: Row(
          children: [
            params.prefix,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      params.title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      params.subheading,
                      style: TextStyle(
                        fontSize: params.subheadingSize,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: params.postfix,
            )
          ],
        ),
      ),
    );
  }
}
