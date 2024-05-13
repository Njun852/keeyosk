import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/ui/widgets/number_adjuster.dart';
import 'package:keeyosk/ui/widgets/price_display.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: EdgeInsets.all(12),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                items[0].imageUrl,
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items[0].name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                PriceDisplay(
                  price: items[0].price,
                  fontSize: 12,
                  discount: items[0].discount,
                  color: Colors.black38,
                ),
                Expanded(child: Container()),
                NumberAdjuster(
                  showIndicator: false,
                  outlineColor: Colors.grey,
                  btnColor: Colors.white,
                  onAdd: () {},
                  quantity: 1,
                  onSub: () {},
                )
              ],
            ),
            Expanded(child: Container()),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Checkbox(
                  value: false,
                  onChanged: (newVal) {},
                ),
                SizedBox(
                  width: 76,
                  height: 20,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          secondary,
                        ),
                        visualDensity: VisualDensity.compact,
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        )),
                    onPressed: () {},
                    child: Text(
                      'Remove',
                      style: TextStyle(color: Colors.white, fontSize: 11),
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
