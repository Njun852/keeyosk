// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/cart/cart_bloc.dart';
import 'package:keeyosk/blocs/cart/cart_event.dart';
import 'package:keeyosk/blocs/cart/cart_state.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/routes.dart';
import 'package:keeyosk/constants/styles.dart';
import 'package:keeyosk/data/repositories/cart_repo.dart';
import 'package:keeyosk/data/repositories/order_repo.dart';
import 'package:keeyosk/ui/widgets/format_price.dart';
import 'package:keeyosk/utils/extensions/price_format.dart';
import 'package:keeyosk/ui/pages/cart_page/cart_item.dart';

// class CartPage extends StatefulWidget {
//   const CartPage({super.key});

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(
        orderRepo: OrderRepo(),
        cartRepo: CartRepo(),
        selectedItems: [],
        orderMode: OrderMode.dineIn,
      ),
      child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state is HasCheckout) {
            Navigator.of(context).pushNamed(
              qrCodeScanner,
              arguments: state.order,
            );
          }
        },
        builder: (context, state) {
          if (state is Initial) {
            context.read<CartBloc>().add(Setup());
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: appBarIconButtonStyle,
                icon: Icon(Icons.arrow_back_ios_new_outlined),
              ),
              title: Text(
                'Cart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            body: Container(
              color: primary,
              child: Container(
                decoration: BoxDecoration(
                  color: lightblue,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: state.items.isEmpty
                          ? Center(child: Text('Your cart is empty.'))
                          : SingleChildScrollView(
                              padding: EdgeInsets.all(18),
                              child: Column(
                                children: List.generate(
                                  state.items.length,
                                  (index) => CartItem(
                                    cart: state.items[index],
                                  ),
                                ),
                              ),
                            ),
                    ),
                    Container(
                      height: 330,
                      color: Colors.white,
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            color: lightblue,
                            height: 45,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Image.asset(
                                    './lib/ui/assets/images/ticket_percent.png'),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Promo Voucher',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Expanded(child: Container()),
                                SizedBox(
                                  width: 75,
                                  height: 30,
                                  child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStatePropertyAll(secondary),
                                        shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        padding: WidgetStatePropertyAll(
                                            EdgeInsets.zero),
                                        visualDensity: VisualDensity.compact),
                                    onPressed: () {},
                                    child: Text(
                                      'Apply',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 23,
                                      height: 23,
                                      child: Transform.scale(
                                        scale: 1.3,
                                        child: Radio(
                                          fillColor:
                                              WidgetStatePropertyAll(secondary),
                                          focusColor: secondary,
                                          activeColor: secondary,
                                          value: OrderMode.dineIn,
                                          groupValue: state.mode,
                                          visualDensity: VisualDensity.compact,
                                          onChanged: (val) {
                                            context
                                                .read<CartBloc>()
                                                .add(SwitchedMode(mode: val!));
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Dine in',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: 23,
                                      height: 23,
                                      child: Transform.scale(
                                        scale: 1.3,
                                        child: Radio(
                                          value: OrderMode.takeOut,
                                          fillColor:
                                              WidgetStatePropertyAll(secondary),
                                          groupValue: state.mode,
                                          focusColor: secondary,
                                          activeColor: secondary,
                                          visualDensity: VisualDensity.compact,
                                          onChanged: (val) {
                                            context
                                                .read<CartBloc>()
                                                .add(SwitchedMode(mode: val!));
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Take out',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Text(
                                      'Subtotal',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(120, 120, 120, 1),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    FormatPrice(
                                      price: state.subtotal,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(120, 120, 120, 1),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Text(
                                      'Discount',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(120, 120, 120, 1),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    FormatPrice(
                                      price: 0,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(120, 120, 120, 1),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Text(
                                      'Processing Fee',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(120, 120, 120, 1),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    FormatPrice(
                                      price: 0,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(120, 120, 120, 1),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Text(
                                      'Total Payment',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    FormatPrice(
                                      price: state.subtotal,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    )
                                  ],
                                ),
                                // Expanded(child: Container()),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          Container(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            height: 44,
                            width: double.infinity,
                            child: TextButton(
                                style: ButtonStyle(
                                    visualDensity: VisualDensity.compact,
                                    backgroundColor: WidgetStatePropertyAll(
                                        state.selectedItems.isEmpty
                                            ? Colors.black54
                                            : secondary),
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    )),
                                onPressed: () {
                                  if (state.selectedItems.isNotEmpty) {
                                    context.read<CartBloc>().add(Checkout());
                                  }
                                },
                                child: Text(
                                  'CHECKOUT',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
