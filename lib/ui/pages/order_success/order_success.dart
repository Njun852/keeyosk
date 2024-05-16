// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/routes.dart';
import 'package:keeyosk/constants/styles.dart';
import 'package:keeyosk/data/models/cart.dart';
import 'package:keeyosk/data/models/order.dart';
import 'package:keeyosk/ui/pages/order_success/label.dart';
import 'package:keeyosk/utils/extensions/price_format.dart';
import 'package:keeyosk/utils/extensions/with_selected_items.dart';
import 'package:keeyosk/utils/get_total_price.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    RouteSettings rs = ModalRoute.of(context)!.settings;
    final order = rs.arguments as Order;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Order Success",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        color: lightblue,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    './lib/ui/assets/images/shield.png',
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Text(
                    'You Successfully Ordered!',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: primary),
                  ),
                  // SizedBox(
                  //   height: 15,
                  // )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 120,
                            child: SingleChildScrollView(
                              child: Column(
                                children:
                                    List.generate(order.carts.length, (index) {
                                  Cart cart = order.carts[index];
                                  return Label(
                                    left: cart.item.name,
                                    right: withSelectedOptions(
                                            cart.item,
                                            cart.selectedOptions,
                                            cart.item.discount == null,
                                            cart.quantity)
                                        .toPriceNoSymbol(),
                                  );
                                }),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Column(
                            children: [
                              Label(
                                left: 'Order Id',
                                right: 'Table: ${order.tableId}',
                                includesPrice: false,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Label(
                                left: 'Date',
                                right: order.date,
                                includesPrice: false,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              SizedBox(
                                child: TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      visualDensity: VisualDensity.comfortable,
                                      padding: WidgetStatePropertyAll(
                                          EdgeInsets.zero),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      backgroundColor: WidgetStatePropertyAll(
                                        Color.fromRGBO(239, 243, 249, 1),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Total: ',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: primary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '₱',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 16,
                                            color: primary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                            getSubTotal(order.carts)
                                                .toPriceNoSymbol(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: primary,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(dashboard);
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(secondary),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: Text(
                          'BACK TO MENU',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
