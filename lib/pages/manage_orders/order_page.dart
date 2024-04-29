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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Image.asset('./lib/images/order.png'),
                ),
                Column(
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
          const SizedBox(height: 14),
          const Text(
            'Order List',
            style: TextStyle(fontSize: 17),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            color: secondary,
            width: double.infinity,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: itemColWidth + itemColWidth * 0.75,
                ),
                SizedBox(
                  width: itemColWidth,
                  child: Text(
                    'Item Name',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(
                  width: itemColWidth,
                  child: Text(
                    'Add-ons',
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(
                  width: itemColWidth,
                  child: Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(
                  width: itemColWidth,
                  child: Text(
                    'Quantity',
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(
                  width: itemColWidth,
                  child: Text(
                    'Actions',
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 400),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return OrderItemView(
                  index: index,
                  itemColWidth: itemColWidth,
                );
              },
              itemCount: 3,
            ),
          )
          //           GridView.count(
          //   crossAxisCount: 6,
          //   children: [
          //     Container(),
          //     Text('Item Name'),
          //     Text('Details'),
          //     Text('Price'),
          //     Text('Quantity'),
          //     Text('Actions')
          //   ],
          // )
          // Container(
          //   constraints: BoxConstraints(maxHeight: 20),
          //   color: secondary,
          //   child: GridView.count(
          //     primary: false,
          //     crossAxisCount: 6,
          //     children: [
          //       SizedBox(width: 45,),
          //       Text(
          //         'Item Name',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontStyle: FontStyle.italic,
          //           fontSize: 12,
          //         ),
          //       ),
          //       Text(
          //         'Details',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontStyle: FontStyle.italic,
          //           fontSize: 12,
          //         ),
          //       ),
          //       Text(
          //         'Price',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontStyle: FontStyle.italic,
          //           fontSize: 12,
          //         ),
          //       ),
          //       Text(
          //         'Quantity',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontStyle: FontStyle.italic,
          //           fontSize: 12,
          //         ),
          //       ),
          //       Text(
          //         'Actions',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontStyle: FontStyle.italic,
          //           fontSize: 12,
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
