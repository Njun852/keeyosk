// ignore_for_file: prefer_const_constructors

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/create_product/create_product_bloc.dart';
import 'package:keeyosk/blocs/create_product/create_product_event.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/data/models/option_item.dart';

class OptionItemView extends StatelessWidget {
  final OptionItem item;
  OptionItemView({super.key, required this.item});
  final CurrencyTextInputFormatter _priceFormatter =
      CurrencyTextInputFormatter.currency(symbol: '₱');
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<CreateProductBloc>(),
      child: Column(children: [
        Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item Name*',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color.fromRGBO(120, 120, 120, 1),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(4),
                        ),
                      ),
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                context
                                    .read<CreateProductBloc>()
                                    .add(RemovedItem(id: item.id));
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(12, 16, 12, 8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: grey),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ],
            )),
            SizedBox(width: 15),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Extra Charge',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color.fromRGBO(120, 120, 120, 1),
                  ),
                ),
                TextFormField(
                  initialValue: _priceFormatter.formatDouble(0),
                  inputFormatters: [_priceFormatter],
                  style: TextStyle(fontFamily: 'Roboto'),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(12, 16, 12, 8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: grey),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ],
            ))
          ],
        ),
        SizedBox(height: 18),
      ]),
    );
  }
}
