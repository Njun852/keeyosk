import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keeyosk/constants/colors.dart';

typedef SidebarOnClick = void Function();
class SidebarItem extends StatelessWidget {
  final String imgUrl;
  final String label;
  final SidebarOnClick onClick;
  const SidebarItem({
    super.key,
    required this.imgUrl,
    required this.label,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(239, 243, 249, 1),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 4),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Image.asset(
                  imgUrl,
                  width: 25,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Text(label),
              Expanded(child: Container()),
              IconButton(
                onPressed: onClick,
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: primary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
