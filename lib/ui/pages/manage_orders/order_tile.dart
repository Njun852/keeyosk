// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/routes.dart';
import 'package:keeyosk/data/models/order.dart';
import 'package:keeyosk/utils/extensions/price_format.dart';
import 'package:keeyosk/utils/get_total_price.dart';

class OrderTile extends StatelessWidget {
  final Order order;
  const OrderTile({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(orderDetails, arguments: order);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          height: 92,
          child: Row(
            children: [
              SizedBox(
                width: 8,
              ),
              Image.asset(
                './lib/ui/assets/images/user_black.png',
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              ),
              Container(
                width: 150,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Table: ${order.tableId}',
                      style: TextStyle(
                          color: secondary,
                          fontWeight: FontWeight.w700,
                          fontSize: 13),
                    ),
                    Text(
                      '${order.customer.firstName} ${order.customer.lastName}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      order.customer.phoneNumber,
                      style: TextStyle(
                          color: Color.fromRGBO(143, 143, 143, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 13),
                    ),
                    Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          order.date,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(210, 210, 210, 1),
                              fontSize: 10),
                        ),
                        Text(
                          order.hour,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(210, 210, 210, 1),
                              fontSize: 10),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(child: Container()),
              Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 75,
                    height: 20,
                    padding: EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      color: secondary,
                    ),
                    child: Row(
                      children: [
                        Transform.translate(
                          offset: Offset(-1, 0),
                          child: Transform.scale(
                              scale: 1.2,
                              child: Image.asset(
                                  './lib/ui/assets/images/triangle.png')),
                        ),
                        Expanded(child: Container()),
                        Text('₱',
                            style: TextStyle(
                              color: primary,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            )),
                        Text(
                          getSubTotal(order.carts).toPriceNoSymbol(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    width: 75,
                    padding: EdgeInsets.only(right: 8, bottom: 8),
                    height: 30,
                    child: IconButton(
                      iconSize: 18,
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.white),
                        visualDensity: VisualDensity.compact,
                        padding: WidgetStatePropertyAll(EdgeInsets.zero),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            side: BorderSide(color: secondary),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(orderDetails, arguments: order);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: secondary,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
