// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/order/order_bloc.dart';
import 'package:keeyosk/blocs/order/order_state.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/styles.dart';
import 'package:keeyosk/data/models/order.dart';
import 'package:keeyosk/data/repositories/order_repo.dart';
import 'package:keeyosk/ui/pages/manage_orders/order_tile.dart';
import 'package:keeyosk/utils/extensions/price_format.dart';
import 'package:keeyosk/utils/cart_list_subtotal.dart';

class ManageOrders extends StatelessWidget {
  final OrderRepo orderRepo = OrderRepo();
  ManageOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderBloc(
        orderRepo: orderRepo,
        orders: orderRepo.getAll(),
      ),
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
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
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                    children: List.generate(state.orders.length, (index) {
                  final Order order = state.orders[index];
                  return OrderTile(
                    order: order,
                  );
                })),
              ),
            ),
          );
        },
      ),
    );
  }
}
