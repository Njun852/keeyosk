// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/constants/styles.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
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
      body: Column(
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
              children: [
                Row(
                  children: [
                    Text(
                      'Product Name',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    Expanded(child: Container()),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(210, 210, 210, 1),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      BeveledRectangleBorder()),
                                  backgroundColor:
                                      MaterialStatePropertyAll(secondary),
                                ),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 40,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                      color: Color.fromRGBO(210, 210, 210, 1)),
                                  right: BorderSide(
                                      color: Color.fromRGBO(210, 210, 210, 1)),
                                ),
                                color: Colors.white,
                              ),
                              child: Text(
                                '1',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      BeveledRectangleBorder()),
                                  backgroundColor:
                                      MaterialStatePropertyAll(secondary),
                                ),
                                onPressed: () {},
                                icon: Icon(
                                  color: Colors.black,
                                  Icons.add,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '\$15.00',
                      style: TextStyle(
                          color: Color.fromRGBO(96, 96, 96, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    // Expanded(child: Container()),
                    SizedBox(
                      width: 100,
                      child: DropdownButtonFormField(
                        elevation: 0,
                        dropdownColor: secondary,
                        items: [
                          DropdownMenuItem(
                            child: Text('SMALL'),
                            value: 'SMALL',
                          ),
                          DropdownMenuItem(
                            child: Text('NORMAL'),
                            value: 'NORMAL',
                          ),
                          DropdownMenuItem(
                            child: Text('LARGE'),
                            value: 'LARGE',
                          ),
                        ],
                        decoration: InputDecoration(
                          fillColor: secondary,
                          border: InputBorder.none,
                          filled: true,
                        ),
                        onChanged: (value) {},
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
