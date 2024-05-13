// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/styles.dart';
import 'package:keeyosk/ui/pages/manage_orders/order_tile.dart';

class ManageOrders extends StatelessWidget {
  const ManageOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          style: appBarIconButtonStyle,
          icon: Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        actions: [
          IconButton(
            style: appBarIconButtonStyle,
            onPressed: () {},
            icon: Icon(
              Icons.history,
            ),
          )
        ],
        title: Text(
          'Manage Orders',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        color: lightblue,
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            OrderTile(),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
          secondary,
        )),
        icon: Icon(
          Icons.qr_code_scanner_outlined,
        ),
        onPressed: () {},
      ),
    );
  }
}
