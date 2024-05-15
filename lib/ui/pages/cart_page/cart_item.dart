// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/cart/cart_bloc.dart';
import 'package:keeyosk/blocs/cart/cart_event.dart';
import 'package:keeyosk/blocs/cart/cart_state.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/data/models/cart.dart';
import 'package:keeyosk/ui/widgets/number_adjuster.dart';
import 'package:keeyosk/ui/widgets/price_display.dart';
import 'package:keeyosk/utils/extensions/with_selected_items.dart';

class CartItem extends StatelessWidget {
  final Cart cart;
  const CartItem({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<CartBloc>(),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              padding: EdgeInsets.all(12),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(10),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      cart.item.imageUrl,
                      width: 75,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cart.item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      PriceDisplay(
                        price: withSelectedOptions(
                          cart.item,
                          cart.selectedOptions,
                          true,
                          cart.quantity,
                        ),
                        fontSize: 12,
                        discount: withSelectedOptions(
                          cart.item,
                          cart.selectedOptions,
                          false,
                          cart.quantity,
                        ),
                        color: Colors.black38,
                      ),
                      Expanded(child: Container()),
                      NumberAdjuster(
                        showIndicator: false,
                        outlineColor: Colors.grey,
                        btnColor: Colors.white,
                        onAdd: () {
                          context.read<CartBloc>().add(
                                ChangedQuantity(
                                  id: cart.id,
                                  quantity: cart.quantity + 1,
                                ),
                              );
                        },
                        quantity: cart.quantity,
                        onSub: () {
                          if (cart.quantity > 1) {
                            context.read<CartBloc>().add(
                                  ChangedQuantity(
                                    id: cart.id,
                                    quantity: cart.quantity - 1,
                                  ),
                                );
                          }
                        },
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Checkbox(
                        value: state.selectedItems.indexWhere(
                                (element) => element.id == cart.id) !=
                            -1,
                        onChanged: (newVal) {
                          context.read<CartBloc>().add(
                                ToggledCartItem(item: cart, isAdded: newVal!),
                              );
                        },
                      ),
                      SizedBox(
                        width: 76,
                        height: 20,
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                secondary,
                              ),
                              visualDensity: VisualDensity.compact,
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              )),
                          onPressed: () {
                            context
                                .read<CartBloc>()
                                .add(RemovedItem(id: cart.id));
                          },
                          child: Text(
                            'Remove',
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
