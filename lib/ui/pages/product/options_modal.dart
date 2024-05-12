// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/ui/widgets/price_display.dart';

class OptionsModal extends StatefulWidget {
  final MenuItem item;
  const OptionsModal({
    super.key,
    required this.item,
  });

  @override
  State<OptionsModal> createState() => _OptionsModalState();
}

class _OptionsModalState extends State<OptionsModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      widget.item.imageUrl,
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.item.name,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          )),
                      PriceDisplay(
                        price: widget.item.price,
                        discount: widget.item.discount,
                        fontSize: 20,
                        color: Colors.black45,
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                  Transform.translate(
                    offset: Offset(18, -34),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.close,
                          size: 32,
                          color: Colors.black,
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.options[0].name,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  Row(
                    children: List.generate(widget.item.options[0].items.length,
                        (index) {
                      return Row(
                        children: [
                          TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  lightblue,
                                ),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                )),
                            onPressed: () {},
                            child: Text(
                              widget.item.options[0].items[index].name,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            width:
                                index != widget.item.options[0].items.length - 1
                                    ? 8
                                    : 0,
                          ),
                        ],
                      );
                    }),
                  )
                ],
              )
            ],
          ),
          Expanded(child: Container()),
          Column(
            children: [
              Divider(),
              Row(
                children: [Text('Quantity')],
              )
            ],
          ),
        ],
      ),
    );
  }
}
