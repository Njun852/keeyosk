// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/ui/widgets/format_price.dart';
import 'package:keeyosk/utils/extensions/price_format.dart';

class TableRow extends StatelessWidget {
  final MenuItem? item;
  final bool isHeader;
  const TableRow({
    super.key,
    this.item,
    this.isHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: isHeader ? 0 : 4),
      child: Row(
        children: [
          isHeader
              ? Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: Text(
                    'Product Name',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black38,
                    ),
                  ),
                )
              : Flexible(
                  flex: 3,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.memory(
                          item!.images.first.file,
                          height: 30,
                          width: 30,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: 50,
                        child: Text(
                          item!.name,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                      ),
                    ],
                  )),
          Flexible(
            fit: FlexFit.tight,
            flex: 3,
            child: Text(
              isHeader ? 'Category' : item!.category.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 10,
                  color: isHeader ? Colors.black38 : Colors.black),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Row(
              children: [
                !isHeader
                    ? FormatPrice(
                        price: item!.price,
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Roboto',
                          color: isHeader ? Colors.black38 : Colors.black,
                        ),
                      )
                    : Text(
                        'Price',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10,
                            color: isHeader ? Colors.black38 : Colors.black),
                      ),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Text(
              isHeader ? 'Status' : 'Available',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color:
                    isHeader ? Colors.black38 : Color.fromRGBO(56, 165, 97, 1),
              ),
            ),
          ),
          isHeader
              ? Flexible(flex: 1, fit: FlexFit.tight, child: SizedBox())
              : Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert_rounded,
                      color: Colors.black,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
