import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/link.dart';
import 'package:keeyosk/widgets/menu_item.dart';

class OrderItemView extends StatelessWidget {
  const OrderItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuItemView(
      params: ItemViewParams(
        subheadingSize: 12,
        title: 'Burger',
        prefix: Padding(
          padding: const EdgeInsets.only(top: 4, left: 4, bottom: 4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('./lib/images/burger1.jpg'),
          ),
        ),
        postfix: SizedBox(
          width: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.edit_square,
                        size: 12,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Text('Quantity:')),
                      Align(
                        child: Text(
                          '1',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                    Expanded(child: Text('Total:')),
                    Text(
                      '\$5.00',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ])
                ],
              )
            ],
          ),
        ),
        subheading: 'Details: Nothing Specified',
      ),
    );
  }
}
