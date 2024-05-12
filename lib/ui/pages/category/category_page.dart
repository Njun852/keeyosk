// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/category/category_bloc.dart';
import 'package:keeyosk/blocs/category/category_event.dart';
import 'package:keeyosk/blocs/category/category_state.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/routes.dart';
import 'package:keeyosk/constants/styles.dart';
import 'package:keeyosk/ui/pages/category/category_field.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> with WidgetsBindingObserver {
  double _keyboardHeight = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    setState(() {
      _keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(),
      child: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {
          if (state is Empty) {}
        },
        builder: (context, state) {
          if (state is! Empty) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                leading: IconButton(
                  style: appBarIconButtonStyle,
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                title: Text(
                  'Category (Add/Edit)',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: _keyboardHeight > 0 ? 345 : 600),
                      child: SingleChildScrollView(
                        child: Column(
                          children:
                              List.generate(state.categories.length, (index) {
                            return CategoryField(
                              initalTxt: state.categories[index].label,
                            );
                          }),
                        ),
                      ),
                    ),
                    SizedBox(height: 18),
                    GestureDetector(
                      onTap: () {
                        context.read<CategoryBloc>().add(AddedNewField());
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: IconButton.outlined(
                              style: ButtonStyle(
                                  side: MaterialStatePropertyAll(
                                    BorderSide(color: primary),
                                  ),
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.zero)),
                              onPressed: () {
                                context
                                    .read<CategoryBloc>()
                                    .add(AddedNewField());
                              },
                              icon: Icon(
                                Icons.add,
                                size: 15,
                                color: primary,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Add Category',
                            style: TextStyle(
                                color: primary,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      width: double.infinity,
                      child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            backgroundColor:
                                MaterialStatePropertyAll(secondary),
                          ),
                          onPressed: () {
                            context.read<CategoryBloc>().add(Apply());
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Save Changes',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            );
          }
          context.read<CategoryBloc>().add(Setup());
          return Container();
        },
      ),
    );
  }
}
