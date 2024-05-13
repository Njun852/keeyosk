import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/ui/pages/manage_orders/order_page.dart';

class OrderItemView extends StatelessWidget {
  const OrderItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 7.7,
              color: Colors.black.withOpacity(0.35),
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset('./lib/ui/assets/images/user_black.png'),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '#0068',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const Text(
                    'Tess Tieng Tieng',
                    style: TextStyle(fontSize: 17, height: 0.8),
                  ),
                  const Text(
                    '09123456789',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Expanded(child: Container()),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('10/23/2024'),
                      Text('7:20AM'),
                      Text(
                        '\$200.00',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: primary,
                          fontStyle: FontStyle.italic,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              height: double.infinity,
              width: 45,
              child: IconButton(
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)))),
                    backgroundColor: MaterialStatePropertyAll(secondary),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const OrderPage(),
                    ));
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
