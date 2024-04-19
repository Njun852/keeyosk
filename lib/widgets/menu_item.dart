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
      padding: const EdgeInsets.symmetric(vertical: 4),
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
        height: 85,
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
                    height: 85,
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
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'No Descriptions',
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      '\$5.00',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      iconSize: 15,
                      visualDensity: VisualDensity.compact,
                      style: const ButtonStyle(
                        alignment: Alignment.center,
                          iconColor: MaterialStatePropertyAll(Colors.black),
                          fixedSize: MaterialStatePropertyAll(Size(1, 1)),
                          backgroundColor: MaterialStatePropertyAll(secondary)),
                      onPressed: (){},
                      icon: const Icon(
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
