import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:keeyosk/constants/colors.dart';

class ToastView {
  final FToast fToast;

  ToastView({required this.fToast});
  factory ToastView.init(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);

    return ToastView(fToast: fToast);
  }
  void showToast(String txt, IconData? icon) {
    fToast.showToast(
      child: _showToast(txt, icon),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  Widget _showToast(String text, IconData? icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: primary,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
