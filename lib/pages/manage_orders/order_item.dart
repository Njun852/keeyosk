import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';

class OrderItemView extends StatelessWidget {
  final int index;
  final double itemColWidth;
  const OrderItemView({
    super.key,
    required this.index,
    required this.itemColWidth
  });

  @override
  Widget build(BuildContext context) {
    final int value = index % 2 == 0 ? 237 : 210;
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
        color: Color.fromARGB(
          255,
          value,
          value,
          value,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            './lib/images/burger1.jpg',
            width: itemColWidth + itemColWidth * 0.75,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          const Text(
            'Burger',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            width: itemColWidth,
            child: const Text(
              'Cheese, Pickles💀, Raisins',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(
            width: itemColWidth,
            child: const Text(
              '\$2,500',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(
            width: itemColWidth,
            child: const Text(
              '10',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(
            width: itemColWidth,
            child: Row(
              children: [
                SizedBox(
                  width: 28,
                  height: 28,
                  child: IconButton(
                    iconSize: 12,
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(secondary)),
                    visualDensity: VisualDensity.compact,
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                SizedBox(
                  width: 28,
                  height: 28,
                  child: IconButton(
                    iconSize: 12,
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(secondary)),
                    visualDensity: VisualDensity.compact,
                    onPressed: () {},
                    icon: Icon(Icons.close),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
