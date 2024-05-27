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

class ProductOption extends StatefulWidget {
  final Option option;
  ProductOption({super.key, required this.option});

  @override
  State<ProductOption> createState() => _ProductOptionState();
}

class _ProductOptionState extends State<ProductOption> {
  final TextEditingController _controller = TextEditingController();

  final CurrencyTextInputFormatter _priceFormatter =
      CurrencyTextInputFormatter.currency(symbol: '₱');

  @override
  Widget build(BuildContext context) {
    print('id ' + widget.option.id);
    _controller.text = widget.option.name;
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
                  controller: _controller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    context.read<CreateProductBloc>().add(UpdatedOption(
                          optionId: widget.option.id,
                          optionName: value,
                          isMultiSelect: widget.option.isMultiSelect,
                          isRequired: widget.option.isRequired,
                        ));
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
                                    .add(RemovedOption(id: widget.option.id));
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
                          value: widget.option.isRequired,
                          onChanged: (val) {
                            context.read<CreateProductBloc>().add(UpdatedOption(
                                optionId: widget.option.id,
                                optionName: widget.option.name,
                                isMultiSelect: widget.option.isMultiSelect,
                                isRequired: val!));
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
                          value: widget.option.isMultiSelect,
                          onChanged: (val) {
                            context.read<CreateProductBloc>().add(UpdatedOption(
                                optionId: widget.option.id,
                                optionName: widget.option.name,
                                isMultiSelect: val!,
                                isRequired: widget.option.isRequired));
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
          ...List.generate(widget.option.items.length, (index) {
            print(widget.option.items.length);
            return OptionItemView(
              item: widget.option.items[index],
            );
          }),
          GestureDetector(
            onTap: () {
              print('aaaaaaaah ' + widget.option.id);
              context.read<CreateProductBloc>().add(
                    AddedOptionItem(optionId: widget.option.id),
                  );
            },
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    onPressed: () {
                      context.read<CreateProductBloc>().add(
                            AddedOptionItem(optionId: widget.option.id),
                          );
                    },
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
          Divider(
            height: 25,
          ),
        ],
      ),
    );
  }
}
