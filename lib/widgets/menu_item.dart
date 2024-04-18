import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/link.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(90, 0, 0, 0),
              offset: Offset(0, 2),
              blurRadius: 0.4,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        padding: const EdgeInsets.all(12),
        height: 100,
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    link,
                    height: 100,
                  ),
                ),
              ),
            ),
            const Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Burger',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'No Descriptions',
                  )
                ],
              ),
            ),
            const Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('\$51.00', style: TextStyle(fontWeight: FontWeight.bold),),
                    IconButton(
                      style: ButtonStyle(
                          iconColor: MaterialStatePropertyAll(Colors.black),
                          backgroundColor: MaterialStatePropertyAll(secondary)),
                      onPressed: null,
                      icon: Icon(
                        Icons.add,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
