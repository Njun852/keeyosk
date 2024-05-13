import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/option/option_bloc.dart';
import 'package:keeyosk/blocs/option/option_event.dart';
import 'package:keeyosk/blocs/option/option_state.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/data/models/option_item.dart';

class OptionSelector extends StatelessWidget {
  final List<OptionItem> items;
  final bool isMultiSelect;
  final String optionName;

  const OptionSelector(
      {super.key,
      required this.items,
      required this.optionName,
      required this.isMultiSelect});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<OptionBloc>(),
      child: BlocBuilder<OptionBloc, OptionState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5,),

              Text(
                optionName,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              Row(
                children: List.generate(items.length, (index) {
                  return Row(
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                            lightblue,
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                  color: (state is OptionModified &&
                                          (state.options.indexWhere((element) =>
                                                  element.name ==
                                                  items[index].name)) !=
                                              -1)
                                      ? Colors.red
                                      : Colors.transparent),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        onPressed: () {
                          final bloc = context.read<OptionBloc>();

                          bloc.add(SelectedOption(
                            item: items[index],
                            others: items
                                .where((element) =>
                                    element.name != items[index].name)
                                .toList(),
                            isMultiSelect: isMultiSelect,
                          ));
                        },
                        child: Text(
                          items[index].name,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: index != items.length - 1 ? 8 : 0,
                      ),
                    ],
                  );
                }),
              ),
              SizedBox(height: 5,),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
