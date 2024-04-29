import 'package:flutter/material.dart';

typedef DrawerItemCallback = Function();

class DrawerItem extends StatelessWidget {
  final bool isImage;
  final String? url;
  final IconData? icon;
  final String label;
  final DrawerItemCallback onClick;
  const DrawerItem({
    super.key,
    required this.onClick,
    required this.isImage,
    required this.label,
    this.url,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: onClick,
        child: Row(
          children: [
            isImage
                ? Image.asset(url!)
                : Icon(
                    icon!,
                    color: Colors.black,
                    size: 30,
                  ),
            const SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
