// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:keeyosk/blocs/option/option_bloc.dart';
import 'package:keeyosk/blocs/option/option_event.dart';
import 'package:keeyosk/blocs/option/option_state.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/models/option.dart';
import 'package:keeyosk/ui/pages/product/option_selector.dart';
import 'package:keeyosk/ui/widgets/number_adjuster.dart';
import 'package:keeyosk/ui/widgets/price_display.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:keeyosk/utils/toast.dart';

class OptionsModal extends StatefulWidget {
  final MenuItem item;
  const OptionsModal({
    super.key,
    required this.item,
  });

  @override
  State<OptionsModal> createState() => _OptionsModalState();
}

class _OptionsModalState extends State<OptionsModal> {
  late final ToastView toast;
  @override
  void initState() {
    super.initState();
    toast = ToastView.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OptionBloc(item: widget.item),
      child: BlocBuilder<OptionBloc, OptionState>(
        builder: (context, state) {
          return Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              widget.item.imageUrl,
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.item.name,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  )),
                              PriceDisplay(
                                price: (widget.item.price +
                                        state.additionalPrice) *
                                    context.read<OptionBloc>().quantity,
                                discount: widget.item.discount != null
                                    ? (widget.item.discount! +
                                            state.additionalPrice) *
                                        context.read<OptionBloc>().quantity
                                    : 0,
                                fontSize: 20,
                                color: Colors.black45,
                              )
                            ],
                          ),
                          Expanded(child: Container()),
                          Transform.translate(
                            offset: Offset(18, -34),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.close,
                                  size: 32,
                                  color: Colors.black,
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Divider(),
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(widget.item.options.length,
                                (index) {
                              return OptionSelector(
                                option: widget.item.options[index],
                                item: widget.item,
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Divider(),
                      SizedBox(
                        height: 8,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Row(
                          children: [
                            Text(
                              'Quantity',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(child: Container()),
                            NumberAdjuster(
                                btnColor: secondary,
                                onAdd: () {
                                  context
                                      .read<OptionBloc>()
                                      .add(ChangedQuantity(updatedQuantity: 1));
                                },
                                quantity: context.read<OptionBloc>().quantity,
                                onSub: () {
                                  final bloc = context.read<OptionBloc>();
                                  if (bloc.quantity > 1) {
                                    bloc.add(
                                        ChangedQuantity(updatedQuantity: -1));
                                  }
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: TextButton(
                    onPressed: () {
                      if (state.allRequiredFilled) {
                        context
                            .read<OptionBloc>()
                            .add(Apply(item: widget.item));
                        Navigator.of(context).pop();
                        toast.showToast('Added to cart.', Icons.check);
                      } else {
                        toast.showToast(
                          'Please provide the required options',
                          Icons.warning_amber,
                        );
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          state.allRequiredFilled ? secondary : Colors.black54,
                        ),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )),
                    child: Text(
                      'ADD TO ORDER',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
