import 'package:flutter/cupertino.dart';
import 'package:keeyosk/constants/colors.dart';

typedef AdminOptionCallBack = void Function();

class AdminOption extends StatelessWidget {
  final String imageUrl;
  final String label;
  final AdminOptionCallBack onClick;
  const AdminOption({
    super.key,
    required this.onClick,
    required this.imageUrl,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Color.fromRGBO(239, 243, 249, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageUrl),
            SizedBox(
              height: 12,
            ),
            Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: primary, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
