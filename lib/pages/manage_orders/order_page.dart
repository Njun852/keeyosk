import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/pages/manage_orders/order_item.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double itemColWidth = 55;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Order #0068',
          style: TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
            fontSize: 28,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.35),
                  offset: const Offset(0, 2),
                  blurRadius: 7.7,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Image.asset('./lib/images/order.png'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text('Total Amount:'),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          '\$2,900.00',
                          style: TextStyle(
                            color: primary,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(0, -6),
                      child: const Text(
                        '(2 items)',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const Text(
                      'Status - Pending',
                      style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '10/23/2024',
                      style: TextStyle(
                        color: primary,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      '7:20AM',
                      style: TextStyle(
                        color: primary,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: const Text(
              'Item List',
              style: TextStyle(fontSize: 17),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            color: secondary,
            width: double.infinity,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: itemColWidth,
                ),
                SizedBox(
                  width: itemColWidth,
                  child: Text(
                    'Item Name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 9,
                    ),
                  ),
                ),
                SizedBox(
                  width: itemColWidth,
                  child: Text(
                    'Add-ons',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 9,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(
                  width: itemColWidth,
                  child: Text(
                    'Price',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 9,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(
                  width: itemColWidth,
                  child: Text(
                    'Quantity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 9,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(
                  width: itemColWidth,
                  child: Text(
                    'Actions',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 9,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 400, minHeight: 50),
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return OrderItemView(
                  index: index,
                  itemColWidth: itemColWidth,
                );
              },
              itemCount: 3,
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25),
              )
            ]),
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Image.asset('./lib/images/ticket_blue.png'),
                SizedBox(width: 3),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vouchers Applied:',
                      style:
                          TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      'Custard Apple Coupon, Black Coupon, KKK Exclusive',
                      style:
                          TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(color: Colors.black),
              bottom: BorderSide(color: Colors.black),
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Customer Details',
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Image.asset(
                      './lib/images/user_black.png',
                      height: 75,
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tess Teing Tieng',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Phone Number:',
                          style: TextStyle(
                              fontSize: 12, fontStyle: FontStyle.italic),
                        ),
                        Text(
                          '09123456789',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    IconButton(
                      iconSize: 35,
                      onPressed: () {},
                      icon: Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      iconSize: 35,
                      icon: Icon(
                        Icons.message,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: SizedBox(
                height: 50,
                child: IconButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 76, 187, 23),
                    ),
                    shape: MaterialStatePropertyAll(BeveledRectangleBorder()),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.check),
                ),
              )),
              Expanded(
                  child: SizedBox(
                height: 50,
                child: IconButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 236, 61, 61)),
                    shape: MaterialStatePropertyAll(BeveledRectangleBorder()),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.close),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
