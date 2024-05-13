import 'package:flutter/material.dart';
import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/models/option.dart';
import 'package:keeyosk/data/models/option_item.dart';

List<MenuItem> items = [
  MenuItem(
      name: 'Burger',
      imageUrl: './lib/ui/assets/images/food1.png',
      price: 20,
      options: [
        Option(
          isRequired: false,
          isMultiSelect: false,
          name: 'Size',
          items: [
            OptionItem(
              id: '1',
              name: 'Small',
              additionalPrice: 0,
            ),
            OptionItem(
              id: '2',
              name: 'Medium',
              additionalPrice: 5,
            ),
            OptionItem(
              id: '1',
              name: 'Large',
              additionalPrice: 10,
            )
          ],
        ),
        Option(
          isRequired: false,
          isMultiSelect: true,
          name: 'Addons',
          items: [
            OptionItem(
              id: '1',
              name: 'Ketchup',
              additionalPrice: 5,
            ),
            OptionItem(
              id: '2',
              name: 'Sauce',
              additionalPrice: 5,
            ),
            OptionItem(
              id: '1',
              name: 'Pickles',
              additionalPrice: 4,
            )
          ],
        ),
      ],
      discount: 15,
      category: Category(label: 'afd')),
  MenuItem(
      name: 'Fries',
      imageUrl: './lib/ui/assets/images/food2.png',
      price: 10,
      category: Category(label: 'afd')),
  MenuItem(
      name: 'Fried Chicken',
      imageUrl: './lib/ui/assets/images/food3.png',
      price: 50,
      discount: 30,
      category: Category(label: 'afd')),
  MenuItem(
      name: 'Burger',
      imageUrl: './lib/ui/assets/images/food1.png',
      price: 20,
      discount: 15,
      category: Category(label: 'afd')),
  MenuItem(
      name: 'Fries',
      imageUrl: './lib/ui/assets/images/food2.png',
      price: 10,
      category: Category(label: 'afd')),
  MenuItem(
      name: 'Fried Chicken',
      imageUrl: './lib/ui/assets/images/food3.png',
      price: 50,
      discount: 30,
      category: Category(label: 'afd')),
  MenuItem(
      name: 'Burger',
      imageUrl: './lib/ui/assets/images/food1.png',
      price: 20,
      discount: 15,
      category: Category(label: 'afd')),
  MenuItem(
      name: 'Fries',
      imageUrl: './lib/ui/assets/images/food2.png',
      price: 10,
      category: Category(label: 'afd')),
  MenuItem(
      name: 'Fried Chicken',
      imageUrl: './lib/ui/assets/images/food3.png',
      price: 50,
      discount: 30,
      category: Category(label: 'afd')),
  MenuItem(
      name: 'Burger',
      imageUrl: './lib/ui/assets/images/food1.png',
      price: 20,
      discount: 15,
      category: Category(label: 'afd')),
  MenuItem(
      name: 'Fries',
      imageUrl: './lib/ui/assets/images/food2.png',
      price: 10,
      category: Category(label: 'afd')),
  MenuItem(
      name: 'Fried Chicken',
      imageUrl: './lib/ui/assets/images/food3.png',
      price: 50,
      discount: 30,
      category: Category(label: 'afd')),
];

final List<Widget> imgs = [
  Image.asset(
    './lib/ui/assets/images/burger1.jpg',
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  Image.asset(
    './lib/ui/assets/images/burger2.jpg',
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  Image.asset(
    './lib/ui/assets/images/burger3.jpg',
    fit: BoxFit.cover,
    width: double.infinity,
  ),
];

final List<Container> c = [
  Container(
    color: Colors.green,
    width: double.infinity,
    height: double.infinity,
  ),
  Container(
    color: Colors.blue,
    width: double.infinity,
    height: double.infinity,
  ),
  Container(
    color: Colors.yellow,
    width: double.infinity,
    height: double.infinity,
  )
];
final List<Container> teset = [
  Container(
    color: Colors.pink,
  ),
  Container(
    color: Colors.orange,
  ),
  Container(
    color: Colors.purple,
  )
];

const String txt =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sed congue leo, vel egestas est. Pellentesque et commodo lacus, vel fermentum ex.';
