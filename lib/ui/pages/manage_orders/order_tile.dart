// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  '#000001',
                  style: TextStyle(
                      color: secondary,
                      fontWeight: FontWeight.w700,
                      fontSize: 13),
                ),
                Text(
                  'Prince Duran',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '09123456789',
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
                      '10/23/2024',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(210, 210, 210, 1),
                          fontSize: 10),
                    ),
                    Text(
                      '7:20AM',
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
                      child: Transform.scale(
                          scale: 1.2,
                          child: Image.asset(
                              './lib/ui/assets/images/triangle.png')),
                      offset: Offset(-1, 0),
                    ),
                    Expanded(child: Container()),
                    Text(
                      '\$2,900',
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
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    visualDensity: VisualDensity.compact,
                    padding: MaterialStatePropertyAll(EdgeInsets.zero),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        side: BorderSide(color: secondary),
                      ),
                    ),
                  ),
                  onPressed: () {},
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
    );
  }
}
