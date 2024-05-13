import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';

class OrderItemView extends StatelessWidget {
  final int index;
  final double itemColWidth;
  const OrderItemView(
      {super.key, required this.index, required this.itemColWidth});

  @override
  Widget build(BuildContext context) {
    final int value = index % 2 == 0 ? 237 : 210;
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      height: 85,
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
            './lib/ui/assets/images/burger1.jpg',
            width: itemColWidth,
            height: itemColWidth,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: itemColWidth,
            child: const Text(
              'Burger',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(
            width: itemColWidth,
            child: const Text(
              'Cheese, Pickles💀, Raisins',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(
            width: itemColWidth,
            child: const Text(
              '\$2,500',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(
            width: itemColWidth,
            child: const Text(
              '10',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: itemColWidth * 0.5 - 2,
                height: itemColWidth * 0.5 - 2,
                child: IconButton(
                  iconSize: 10,
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(secondary)),
                  visualDensity: VisualDensity.compact,
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              SizedBox(
                width: itemColWidth * 0.5 - 2,
                height: itemColWidth * 0.5 - 2,
                child: IconButton(
                  iconSize: 10,
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(secondary)),
                  visualDensity: VisualDensity.compact,
                  onPressed: () {},
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
