import 'package:flutter/material.dart';
import 'package:keeyosk/models/menu_item.dart';

List<MenuItem> items = [
  MenuItem(
    name: 'Burger',
    imageUrl: './lib/images/food1.png',
    price: 20,
    discount: 15,
  ),
  MenuItem(
    name: 'Fries',
    imageUrl: './lib/images/food2.png',
    price: 10,
  ),
  MenuItem(
    name: 'Fried Chicken',
    imageUrl: './lib/images/food3.png',
    price: 50,
    discount: 30,
  ), MenuItem(
    name: 'Burger',
    imageUrl: './lib/images/food1.png',
    price: 20,
    discount: 15,
  ),
  MenuItem(
    name: 'Fries',
    imageUrl: './lib/images/food2.png',
    price: 10,
  ),
  MenuItem(
    name: 'Fried Chicken',
    imageUrl: './lib/images/food3.png',
    price: 50,
    discount: 30,
  ), MenuItem(
    name: 'Burger',
    imageUrl: './lib/images/food1.png',
    price: 20,
    discount: 15,
  ),
  MenuItem(
    name: 'Fries',
    imageUrl: './lib/images/food2.png',
    price: 10,
  ),
  MenuItem(
    name: 'Fried Chicken',
    imageUrl: './lib/images/food3.png',
    price: 50,
    discount: 30,
  ),
];

final List<Widget> imgs = [
  Image.asset(
    './lib/images/burger1.jpg',
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  Image.asset(
    './lib/images/burger2.jpg',
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  Image.asset(
    './lib/images/burger3.jpg',
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
