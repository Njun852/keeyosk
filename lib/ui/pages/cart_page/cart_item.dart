// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
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
import 'package:keeyosk/utils/with_selected.dart';

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
                    child: Image.file(
                      cart.item.images.first,
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
                      SizedBox(
                        width: 150,
                        height: 35,
                        child: AutoSizeText(
                          maxLines: 2,
                          cart.item.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      PriceDisplay(
                        price: getItemPriceWithSelected(
                          cart.item,
                          cart.selectedOptions,
                          true,
                          cart.quantity,
                        ),
                        fontSize: 12,
                        discount: getItemPriceWithSelected(
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
                              backgroundColor: WidgetStatePropertyAll(
                                secondary,
                              ),
                              visualDensity: VisualDensity.compact,
                              padding: WidgetStatePropertyAll(EdgeInsets.zero),
                              shape: WidgetStatePropertyAll(
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
