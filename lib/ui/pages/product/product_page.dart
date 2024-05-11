// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/constants/styles.dart';
import 'package:keeyosk/extensions/price_format.dart';
import 'package:keeyosk/models/menu_item.dart';
import 'package:keeyosk/ui/pages/dashboard/item_card.dart';
import 'package:keeyosk/ui/pages/product/options_modal.dart';
import 'package:keeyosk/ui/widgets/price_display.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    RouteSettings rs = ModalRoute.of(context)!.settings;
    final item = rs.arguments as MenuItem;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: appBarIconButtonStyle,
            icon: Icon(
              Icons.arrow_back_ios_new,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
            style: appBarIconButtonStyle,
          )
        ],
      ),
      body: Container(
        color: Color(0x00fefefe),
        child: Column(
          children: [
            Stack(alignment: Alignment.center, children: [
              CarouselSlider(
                items: imgs,
                options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _index = index;
                      });
                    }),
              ),
              Positioned(
                bottom: 0,
                child: DotsIndicator(
                  decorator: DotsDecorator(
                    size: Size(5, 5),
                    color: Color.fromRGBO(244, 203, 26, 1),
                    activeColor: Color.fromRGBO(244, 203, 26, 0.5),
                  ),
                  dotsCount: imgs.length,
                  position: _index,
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  Row(
                    children: [
                      PriceDisplay(
                        price: item.price,
                        fontSize: 20,
                        color: Color.fromRGBO(96, 96, 96, 1),
                        discount: item.discount,
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Color.fromRGBO(176, 176, 176, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    item.description,
                    style: TextStyle(
                      fontSize: 11,
                      color: Color.fromRGBO(176, 176, 176, 1),
                    ),
                  ),
                  SizedBox(height: 12),
                  Divider(),
                  SizedBox(height: 12),
                  Text(
                    'Recommended',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 32),
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                shrinkWrap: true,
                crossAxisSpacing: 5,
                childAspectRatio: 0.9,
                children: List.generate(items.length, (index) {
                  return ItemCard(
                    scale: 0.6,
                    shouldPop: false,
                    item: items[index],
                  );
                }),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 32),
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return OptionsModal();
              },
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(secondary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(double.infinity, 32)),
          ),
          child: Text(
            'ADD TO ORDER',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
