// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keeyosk/constants/colors.dart';

class SearchBarView extends StatefulWidget {
  final double padding;
  const SearchBarView({
    super.key,
    this.padding = 24,
  });

  @override
  State<SearchBarView> createState() => _SearchBarViewState();
}

class _SearchBarViewState extends State<SearchBarView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: TextField(
        style: TextStyle(fontSize: 12),
        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 239, 249, 252),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
                color: primary,
                width: 1.3,
                strokeAlign: BorderSide.strokeAlignOutside),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: primary,
              width: 1.3,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          isDense: true,
          suffixIcon: Padding(
            padding: EdgeInsets.all(1),
            child: IconButton(
                visualDensity: VisualDensity.compact,
                iconSize: 24,
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.yellow)),
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: widget.padding),
          hintText: 'Search for your food',
        ),
      ),
    );
  }
}
