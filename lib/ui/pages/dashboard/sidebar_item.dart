import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keeyosk/constants/colors.dart';

class SidebarItem extends StatelessWidget {
  final String imgUrl;
  final String label;
  const SidebarItem({
    super.key,
    required this.imgUrl,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
