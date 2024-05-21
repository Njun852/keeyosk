import 'package:flutter/material.dart';
import 'package:keeyosk/data/models/user.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();
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

