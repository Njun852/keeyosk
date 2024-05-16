// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/category/category_bloc.dart';
import 'package:keeyosk/blocs/category/category_event.dart';
import 'package:keeyosk/blocs/category/category_state.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/data/models/category.dart';

class CategoryField extends StatefulWidget {
  final String initalTxt;

  const CategoryField({super.key, required this.initalTxt});

  @override
  State<CategoryField> createState() => _CategoryFieldState();
}

class _CategoryFieldState extends State<CategoryField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.initalTxt;

    return BlocProvider.value(
      value: context.read<CategoryBloc>(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Category Name*',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color.fromRGBO(120, 120, 120, 1),
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      controller: _controller,
                      onChanged: (value) {
                        context.read<CategoryBloc>().add(
                              EditingField(
                                label: widget.initalTxt,
                                updated: Category(label: value),
                              ),
                            );
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: grey, width: 0.5)),
                        // focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: grey, width: 0.5)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: grey, width: 0.5),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        filled: true,
                        fillColor: lightblue,
                        isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    context
                        .read<CategoryBloc>()
                        .add(DeletedField(label: widget.initalTxt));
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color.fromRGBO(255, 78, 78, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('./lib/ui/assets/images/trash.png'),
                        SizedBox(height: 2),
                        Text(
                          'Delete',
                          style: TextStyle(fontSize: 8, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
