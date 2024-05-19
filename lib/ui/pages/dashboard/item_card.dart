// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/routes.dart';
import 'package:keeyosk/utils/extensions/price_format.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/ui/pages/product/product_page.dart';
import 'package:keeyosk/ui/widgets/options_modal.dart';
import 'package:keeyosk/ui/widgets/price_display.dart';

class ItemCard extends StatelessWidget {
  final double scale;
  final MenuItem item;
  final bool shouldPop;

  const ItemCard({
    super.key,
    this.shouldPop = true,
    required this.item,
    this.scale = 1,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        child: InkWell(
          splashColor: secondary,
          onTap: () {
            if (shouldPop) {
              Navigator.of(context).pushNamed(productPage, arguments: item);
              return;
            }
            Navigator.of(context)
                .pushReplacementNamed(productPage, arguments: item);
          },
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
                          item.imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          height: constraints.maxHeight / 2,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 8 * scale,
                              left: 8 * scale,
                              right: 8 * scale),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ConstrainedBox(
                                constraints:
                                    BoxConstraints(maxHeight: 40 * scale),
                                child: AutoSizeText(
                                  item.name,
                                  maxLines: 2,
                                  minFontSize: 5 * scale,
                                  style: TextStyle(
                                    fontSize: 15 * scale,
                                    fontWeight: FontWeight.w600,
                                    // fontSize: 20 * scale,
                                    // overflow: TextOverflow.ellipsis
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5 * scale,
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: 20 * scale,
                                ),
                                child: AutoSizeText(
                                  item.description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  minFontSize: 5,
                                  style: TextStyle(
                                    fontSize: 8 * scale,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.47),
                                  ),
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
                            padding: EdgeInsets.only(left: 8 * scale),
                            child: FittedBox(
                              child: PriceDisplay(
                                price: item.price,
                                fontSize: 15 * scale,
                                discount: item.discount ?? 0,
                                color: Colors.black,
                              ),
                            )),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return OptionsModal(
                                  item: item,
                                );
                              },
                            );
                          },
                          child: Container(
                            width: 35 * scale,
                            height: 35 * scale,
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
                            child: Icon(
                              Icons.add,
                              size: scale * 24,
                            ),
                          ),
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
