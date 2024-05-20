// ignore_for_file: prefer_const_constructors

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/create_product/create_product_bloc.dart';
import 'package:keeyosk/blocs/create_product/create_product_event.dart';
import 'package:keeyosk/blocs/create_product/create_product_state.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/data/models/option.dart';
import 'package:keeyosk/ui/pages/create_product/option_item.dart';

class ProductOption extends StatelessWidget {
  final Option option;
  ProductOption({super.key, required this.option});

  final CurrencyTextInputFormatter _priceFormatter =
      CurrencyTextInputFormatter.currency(symbol: '₱');

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<CreateProductBloc>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 18),
          Text(
            'Option Label*',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color.fromRGBO(120, 120, 120, 1)),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: option.name,
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
                                    .add(RemovedOption(id: option.id));
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
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      SizedBox(
                        width: 35,
                        height: 25,
                        child: Checkbox(
                          value: option.isRequired,
                          onChanged: (val) {
                            context.read<CreateProductBloc>().add(
                                  ToggledCheckbox(option.id,
                                      isMultiSelect: option.isMultiSelect,
                                      isRequired: val!),
                                );
                          },
                        ),
                      ),
                      Transform.translate(
                          offset: Offset(-5, 0),
                          child: Text(
                            'Required',
                            style: TextStyle(fontSize: 11),
                          ))
                    ]),
                    Row(children: [
                      SizedBox(
                        width: 35,
                        height: 25,
                        child: Checkbox(
                          value: option.isMultiSelect,
                          onChanged: (val) {
                            context.read<CreateProductBloc>().add(
                                  ToggledCheckbox(
                                    option.id,
                                    isMultiSelect: val!,
                                    isRequired: option.isRequired,
                                  ),
                                );
                          },
                        ),
                      ),
                      Transform.translate(
                          offset: Offset(-5, 0),
                          child: Text(
                            'Multi-Select',
                            style: TextStyle(fontSize: 11),
                          ))
                    ])
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 18),
          ...List.generate(option.items.length, (index) {
            print(option.items.length);
            return OptionItemView(
              item: option.items[index],
            );
          }),
          GestureDetector(
            onTap: () {
              context.read<CreateProductBloc>().add(
                    AddOptionItem(optionId: option.id),
                  );
            },
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        visualDensity: VisualDensity.compact,
                        padding: WidgetStatePropertyAll(
                          EdgeInsets.zero,
                        ),
                        side:
                            WidgetStatePropertyAll(BorderSide(color: primary))),
                    icon: Icon(
                      Icons.add,
                      size: 15,
                      color: primary,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'Add Item',
                  style: TextStyle(
                    color: primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
