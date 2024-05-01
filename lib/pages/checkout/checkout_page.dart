import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/pages/checkout/order_item.dart';
import 'package:keeyosk/pages/postcheckout/postcheckout_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? _val = 'Dine in';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.close,
          ),
        ),
        centerTitle: false,
        title: const Text(
          'Cart',
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            OrderItemView(),
            OrderItemView(),
            OrderItemView(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        width: double.infinity,
        height: 250,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: primary,
        ),
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(
                    child: Text(
                  'Subtotal',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                )),
                Text(
                  '\$2.00',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const Row(
              children: [
                Expanded(
                    child: Text(
                  'Discount',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )),
                Text(
                  '\$0.00',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const Row(
              children: [
                Expanded(
                    child: Text(
                  'Processing Fee',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )),
                Text(
                  '\$0.00',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Radio(
                        fillColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 244, 203, 26)),
                        value: 'Take out',
                        groupValue: _val,
                        onChanged: (String? value) {
                          setState(() {
                            _val = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'Take out',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Radio(
                        fillColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 244, 203, 26)),
                        value: 'Dine in',
                        groupValue: _val,
                        onChanged: (String? value) {
                          setState(() {
                            _val = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'Dine in',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Image.asset(
                  './lib/images/ticket_gold.png',
                  height: 35,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'Apply a coupon',
                  style: TextStyle(
                      color: Color.fromARGB(255, 244, 203, 26),
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                    style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(9),
                          ),
                        ),
                      ),
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 244, 203, 26),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PostCheckoutPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
