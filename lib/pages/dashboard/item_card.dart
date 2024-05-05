// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/extensions/price_format.dart';

class ItemCard extends StatelessWidget {
  final String imgLink;
  final String name;
  final double price;
  double? discountPrice;
  String? description;

  ItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.imgLink,
    this.discountPrice,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    final bigText = TextStyle(fontWeight: FontWeight.w700, fontSize: 15);

    dynamic priceDisplay = Text(
      price.toPrice(),
      style: bigText,
    );

    if (discountPrice != null) {
      priceDisplay = Row(
        children: [
          Text(
            discountPrice!.toPrice(),
            style: bigText,
          ),
          SizedBox(
            width: 5,
          ),
          Transform.translate(
            offset: Offset(0, 2),
            child: Text(
              price.toPrice(),
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Color.fromARGB(255, 120, 120, 120),
                  fontSize: 9,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        child: InkWell(
          splashColor: secondary,
          onTap: () {},
          child: Container(
            color: Color.fromARGB(255, 239, 249, 252),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          imgLink,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          height: constraints.maxHeight / 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                description ?? 'No description',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.47),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: priceDisplay),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                            ),
                            color: Color.fromARGB(
                              255,
                              244,
                              203,
                              26,
                            ),
                          ),
                          child: Icon(Icons.add),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
