// ignore_for_file: prefer_const_constructors

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/create_product/create_product_bloc.dart';
import 'package:keeyosk/blocs/create_product/create_product_event.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/data/models/option_item.dart';

class OptionItemView extends StatefulWidget {
  final OptionItem item;
  const OptionItemView({super.key, required this.item});

  @override
  State<OptionItemView> createState() => _OptionItemViewState();
}

class _OptionItemViewState extends State<OptionItemView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final CurrencyTextInputFormatter _priceFormatter =
      CurrencyTextInputFormatter.currency(symbol: '₱');

  @override
  Widget build(BuildContext context) {
    _nameController.text = widget.item.name;
    _priceController.text =
        _priceFormatter.formatDouble(widget.item.additionalPrice);
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
                  controller: _nameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    context.read<CreateProductBloc>().add(UpdatedOptionItem(
                        optionItemId: widget.item.id,
                        itemName: value,
                        extraCharge: widget.item.additionalPrice));
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
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
                                    .add(RemovedOptionItem(id: widget.item.id));
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
                  controller: _priceController,
                  onChanged: (value) {
                    context.read<CreateProductBloc>().add(
                          UpdatedOptionItem(
                            optionItemId: widget.item.id,
                            itemName: widget.item.name,
                            extraCharge: _priceFormatter
                                .getUnformattedValue()
                                .toDouble(),
                          ),
                        );
                  },
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
