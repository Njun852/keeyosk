// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/styles.dart';
import 'package:keeyosk/ui/pages/cart_page/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String _v = 'Dine in';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          style: appBarIconButtonStyle,
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          'Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        color: primary,
        child: Container(
          decoration: BoxDecoration(
            color: lightblue,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CartItem(),
                      CartItem(),
                      CartItem(),
                    ],
                  ),
                ),
              ),
              Container(
                height: 330,
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      color: lightblue,
                      height: 45,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Image.asset(
                              './lib/ui/assets/images/ticket_percent.png'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Promo Voucher',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(child: Container()),
                          SizedBox(
                            width: 75,
                            height: 30,
                            child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(secondary),
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  padding:
                                      MaterialStatePropertyAll(EdgeInsets.zero),
                                  visualDensity: VisualDensity.compact),
                              onPressed: () {},
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 23,
                                height: 23,
                                child: Transform.scale(
                                  scale: 1.3,
                                  child: Radio(
                                    value: 'Take out',
                                    fillColor:
                                        MaterialStatePropertyAll(secondary),
                                    groupValue: _v,
                                    focusColor: secondary,
                                    activeColor: secondary,
                                    visualDensity: VisualDensity.compact,
                                    onChanged: (val) {
                                      setState(() {
                                        _v = val!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Take out',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 15),
                              SizedBox(
                                width: 23,
                                height: 23,
                                child: Transform.scale(
                                  scale: 1.3,
                                  child: Radio(
                                    fillColor:
                                        MaterialStatePropertyAll(secondary),
                                    focusColor: secondary,
                                    activeColor: secondary,
                                    value: 'Dine in',
                                    groupValue: _v,
                                    visualDensity: VisualDensity.compact,
                                    onChanged: (val) {
                                      setState(() {
                                        _v = val!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Dine in',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Text(
                                'Subtotal',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(120, 120, 120, 1),
                                  fontSize: 14,
                                ),
                              ),
                              Expanded(child: Container()),
                              Text(
                                '\$20.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(120, 120, 120, 1),
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Text(
                                'Discount',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(120, 120, 120, 1),
                                  fontSize: 14,
                                ),
                              ),
                              Expanded(child: Container()),
                              Text(
                                '\$0.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(120, 120, 120, 1),
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Text(
                                'Processing Fee',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(120, 120, 120, 1),
                                  fontSize: 14,
                                ),
                              ),
                              Expanded(child: Container()),
                              Text(
                                '\$0.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(120, 120, 120, 1),
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Text(
                                'Total Payment',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              Expanded(child: Container()),
                              Text(
                                '\$20.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                          // Expanded(child: Container()),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      height: 44,
                      width: double.infinity,
                      child: TextButton(
                          style: ButtonStyle(
                              visualDensity: VisualDensity.compact,
                              backgroundColor:
                                  MaterialStatePropertyAll(secondary),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              )),
                          onPressed: () {},
                          child: Text(
                            'CHECKOUT',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                            ),
                          )),
                    ),
                    SizedBox(height: 15,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
