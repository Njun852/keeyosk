import 'package:flutter/material.dart';
import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/models/option.dart';
import 'package:keeyosk/data/models/option_item.dart';
import 'package:keeyosk/data/models/user.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();
List<MenuItem> items = [
  MenuItem(
      id: 'fdsfdsfewfs',
      name: 'Burger',
      imageUrl: './lib/ui/assets/images/food1.png',
      price: 20,
      options: [
        Option(
          id: 'dsfdskjf234dsfdkfj',
          isRequired: true,
          isMultiSelect: false,
          name: 'Size',
          items: [
            OptionItem(
              id: 'dfjsdfjsdj35453kfjsd',
              name: 'Small',
              additionalPrice: 0,
            ),
            OptionItem(
              id: 'dskfjsdkgffgrfjdksf',
              name: 'Medium',
              additionalPrice: 5,
            ),
            OptionItem(
              id: 'dfskfjdaersfds',
              name: 'Large',
              additionalPrice: 10,
            )
          ],
        ),
        Option(
          id: 'fdsfsdbfhhfsd',
          isRequired: false,
          isMultiSelect: true,
          name: 'Addons',
          items: [
            OptionItem(
              id: 'sdfsdfzxcsdf',
              name: 'Ketchup',
              additionalPrice: 5,
            ),
            OptionItem(
              id: 'fdsfdsfsdvbfvf',
              name: 'Sauce',
              additionalPrice: 5,
            ),
            OptionItem(
              id: 'fdsfsd432fsdf',
              name: 'Pickles',
              additionalPrice: 4,
            )
          ],
        ),
      ],
      discount: 15,
      category: Category(label: 'afd')),
  MenuItem(
      id: 'fdsfsdfs434df',
      name: 'Fries',
      imageUrl: './lib/ui/assets/images/food2.png',
      price: 10,
      category: Category(label: 'afd')),
  MenuItem(
      id: 'fdsfsdccfsd',
      name: 'Fried Chicken',
      imageUrl: './lib/ui/assets/images/food3.png',
      price: 50,
      discount: 30,
      category: Category(label: 'afd')),
];
final List<String> tables = ['0001', '0002', '0003'];
late User currentUser;
final List<User> users = [
  User(
    role: Role.customer,
    userId: '123',
    firstName: 'John',
    lastName: 'Doe',
    middleName: '',
    phoneNumber: '09123456789',
  ),
  User(
    role: Role.admin,
    userId: '321',
    firstName: 'Harley',
    lastName: 'Hart',
    middleName: '',
    phoneNumber: '09123456789',
  )
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
