import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionsModal extends StatefulWidget {
  const OptionsModal({super.key});

  @override
  State<OptionsModal> createState() => _OptionsModalState();
}

class _OptionsModalState extends State<OptionsModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.red,
    );
  }
}