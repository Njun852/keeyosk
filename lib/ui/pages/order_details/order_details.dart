// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/constants/styles.dart';
import 'package:keeyosk/data/models/order.dart';
import 'package:keeyosk/ui/widgets/format_price.dart';
import 'package:keeyosk/ui/widgets/table_row.dart';
import 'package:keeyosk/utils/extensions/price_format.dart';
import 'package:keeyosk/utils/with_selected.dart';
import 'package:keeyosk/utils/cart_list_subtotal.dart';
import 'package:keeyosk/utils/formatted_options.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    RouteSettings rs = ModalRoute.of(context)!.settings;
    final order = rs.arguments as Order;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          style: appBarIconButtonStyle,
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text('Order Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 18, bottom: 12),
            height: 100,
            width: double.infinity,
            child: Row(
              children: [
                Image.asset('./lib/ui/assets/images/edit_yellow.png'),
                SizedBox(
                  width: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Total Amount: ',
                          style: TextStyle(
                            height: 1.8,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        FormatPrice(
                          price: getSubTotalFromCartList(order.carts),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    Text(
                      '(${order.orderMode})',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Status - ${order.status.name}',
                      style: TextStyle(
                        color: grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
                Expanded(child: SizedBox()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      order.date.replaceAll('/', ' - '),
                      style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      '${order.hour.replaceAll(RegExp(r'[A-Z][A-Z]'), '')} ${order.hour.replaceAll(RegExp(r'[0-9][0-9]:[0-9][0-9]'), '')}',
                      style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        height: 1.5,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Text('Item List'),
          ),
          Divider(
            color: Colors.grey[200],
          ),
          TableRowWidget(
            padding: EdgeInsets.symmetric(horizontal: 16),
            shouldHaveDivider: false,
            backgroundColor: Colors.white,
            height: 23,
            items: [
              TableItem(flex: 1, widget: SizedBox()),
              TableItem(
                flex: 1,
                widget: Text(
                  'Item Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 8,
                    height: 1.2,
                  ),
                ),
              ),
              TableItem(
                flex: 1,
                widget: Text(
                  'Details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 8,
                    height: 1.2,
                  ),
                ),
              ),
              TableItem(
                flex: 1,
                widget: Text(
                  'Price',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 8,
                    height: 1.2,
                  ),
                ),
              ),
              TableItem(
                flex: 1,
                widget: Text(
                  'Quantity',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 8,
                    height: 1.2,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(order.carts.length, (index) {
                  return TableRowWidget(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      backgroundColor: lightblue,
                      height: 74,
                      items: [
                        TableItem(
                          flex: 1,
                          alignment: Alignment.centerLeft,
                          widget: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.file(
                              order.carts[index].item.images.first,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        TableItem(
                          flex: 1,
                          widget: Text(
                            order.carts[index].item.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 8,
                              height: 1.2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TableItem(
                          flex: 1,
                          widget: Text(
                            getFormattedOptions(
                                order.carts[index].selectedOptions),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 8,
                              height: 1.2,
                            ),
                          ),
                        ),
                        TableItem(
                          flex: 1,
                          widget: FormatPrice(
                            price: getItemPriceWithSelected(
                              order.carts[index].item,
                              order.carts[index].selectedOptions,
                              order.carts[index].item.discount == null,
                              order.carts[index].quantity,
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 8,
                              height: 1.2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TableItem(
                          flex: 1,
                          widget: Text(
                            order.carts[index].quantity.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 8,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ]);
                }),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 300,
            child: Column(
              children: [
                Container(
                  color: lightblue,
                  // height: 36,
                  child: Column(
                    children: [
                      Divider(
                        height: 0,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              './lib/ui/assets/images/ticket_percent.png',
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Promo Ticket',
                              style: TextStyle(
                                color: primary,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                height: 1.2,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(child: SizedBox()),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Voucher Applied: None',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: primary,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 7,
                                      height: 1.1),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Customer Details',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          height: 1.2,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            './lib/ui/assets/images/user_black.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${currentUser.firstName} ${currentUser.lastName}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1.8,
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(
                            'Table Number:  ${order.tableId}',
                            style: TextStyle(
                              height: 1.8,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Divider(),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contact Number:',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  height: 1.5,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                currentUser.phoneNumber,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    height: 1.3,
                                    fontSize: 13),
                              )
                            ],
                          ),
                          Expanded(child: Container()),
                          IconButton(
                            onPressed: openSMS,
                            icon: Icon(
                              Icons.message,
                              color: primary,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          IconButton(
                            onPressed: openPhone,
                            icon: Icon(
                              Icons.phone,
                              color: primary,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0.1,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(255, 78, 78, 1),
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Cancel Order',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(56, 165, 97, 1),
                          ),
                        ),
                        child: Text(
                          'Accept Order',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  //TODO: REMOVE THIS LATER
  Future<void> openPhone() async {
    final url = Uri.parse('tel:${currentUser.phoneNumber}');
    launchUrl(url);
  }

  Future<void> openSMS() async {
    final url = Uri.parse('sms:${currentUser.phoneNumber}');
    launchUrl(url);
  }
}
