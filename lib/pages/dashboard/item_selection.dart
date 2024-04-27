import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/extensions/price_format.dart';
import 'package:keeyosk/models/menu_item.dart';
import 'package:keeyosk/pages/product/product_page.dart';
import 'package:keeyosk/widgets/menu_item.dart';

class ItemSelectionView extends StatelessWidget {
  final MenuItem item;
  const ItemSelectionView({
    super.key,
    required this.item
  });

  @override
  Widget build(BuildContext context) {
    return MenuItemView(
      params: ItemViewParams(
          title: item.name,
          prefix: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              width: 70,
              fit: BoxFit.cover,
              item.imageUrl,
            ),
          ),
          postfix: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                item.price.toPrice(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Align(
                alignment: Alignment.center,
                child: ClipOval(
                  child: Material(
                    color: secondary,
                    elevation: 4,
                    shape: const CircleBorder(),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ProductPage(),
                          ),
                        );
                      },
                      splashColor: Colors.grey,
                      child: const SizedBox(
                        width: 30,
                        height: 30,
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          subheading: item.description ?? 'No Description'),
    );
  }
}
