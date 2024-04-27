import 'package:flutter/material.dart';
import 'package:keeyosk/models/menu_item.dart';

const List<MenuItem> meals = [
  MenuItem(
      name: 'Burger',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rFvgkrfICZ15a7ZmW1Lvfo246sj9MAoTJA&s',
      price: 50),
  MenuItem(
      name: 'Chicken Joy',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBJbs_8wMs7ewiaw9noLzArkDTwIE51z_OS_knYps3IB2y3Qin-yUSeS4ppLJtFacGJNU&usqp=CAU',
      price: 25),
  MenuItem(
      name: 'Pizza',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShqNOrnCWng5zaBj2reNeU2QHAMaeyj1EJJhqbunN9kg&s',
      price: 300),
  MenuItem(
      name: 'Balbacua',
      imageUrl:
          'https://images.yummy.ph/yummy/uploads/2022/06/balbacuarecipe-2.jpg',
      price: 40),
  MenuItem(
      name: 'Burger',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rFvgkrfICZ15a7ZmW1Lvfo246sj9MAoTJA&s',
      price: 50),
  MenuItem(
      name: 'Chicken Joy',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBJbs_8wMs7ewiaw9noLzArkDTwIE51z_OS_knYps3IB2y3Qin-yUSeS4ppLJtFacGJNU&usqp=CAU',
      price: 25),
  MenuItem(
      name: 'Pizza',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShqNOrnCWng5zaBj2reNeU2QHAMaeyj1EJJhqbunN9kg&s',
      price: 300),
  MenuItem(
      name: 'Balbacua',
      imageUrl:
          'https://images.yummy.ph/yummy/uploads/2022/06/balbacuarecipe-2.jpg',
      price: 40),
  MenuItem(
      name: 'Burger',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rFvgkrfICZ15a7ZmW1Lvfo246sj9MAoTJA&s',
      price: 50),
  MenuItem(
      name: 'Chicken Joy',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBJbs_8wMs7ewiaw9noLzArkDTwIE51z_OS_knYps3IB2y3Qin-yUSeS4ppLJtFacGJNU&usqp=CAU',
      price: 25),
  MenuItem(
      name: 'Pizza',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShqNOrnCWng5zaBj2reNeU2QHAMaeyj1EJJhqbunN9kg&s',
      price: 300),
  MenuItem(
      name: 'Balbacua',
      imageUrl:
          'https://images.yummy.ph/yummy/uploads/2022/06/balbacuarecipe-2.jpg',
      price: 40)
];

const List<MenuItem> desserts = [
  MenuItem(
      name: 'Ice Cream',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvRL1-NcJU8rwxzTAVTJKlEhRWkdV4QCyHEOL04wkRqg&s',
      price: 35),
  MenuItem(
      description: 'Yum Yum',
      name: 'Halo Halo',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7D5bMhiQ8BcbLE_DtwvfCyQfh0HyamwBM7o30A0soHQ&s',
      price: 40)
];

const List<MenuItem> drinks = [
  MenuItem(
      name: 'Cola',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9jd5_yc6KyAKCN0shTabNtVwuzkW6Y6BRp29NASIGSw&s',
      price: 15),
  MenuItem(
      name: 'Sprite',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuSFY16iVt6ywW0XIj9GSMhKCOVakfgydaHkOQgSylHw&s',
      price: 15),
  MenuItem(
      name: 'Tanduay',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxSS9w18ghKyKdLP-wj2wHsCO2j_mrqwS6I_8yIceJQg&s',
      price: 50)
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
