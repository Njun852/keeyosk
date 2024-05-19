// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/option/option_bloc.dart';
import 'package:keeyosk/blocs/option/option_event.dart';
import 'package:keeyosk/blocs/option/option_state.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/models/option.dart';
import 'package:keeyosk/data/models/option_item.dart';

class OptionSelector extends StatelessWidget {
  final Option option;
  final MenuItem item;
  const OptionSelector({
    super.key,
    required this.item,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<OptionBloc>(),
      child: BlocBuilder<OptionBloc, OptionState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    option.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    option.isRequired ? ' (Required)' : ' (Optional)',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 11,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(option.items.length, (index) {
                  return TextButton(
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(
                        lightblue,
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          side: BorderSide(
                              color: (state is OptionModified &&
                                      (state.options.indexWhere((element) =>
                                              element.name ==
                                              option.items[index].name)) !=
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
                          itemId: option.items[index].id, optionId: option.id));
                    },
                    child: Text(
                      option.items[index].name,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          );
        },
      ),
    );
  }
}
