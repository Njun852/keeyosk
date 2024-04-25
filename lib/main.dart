import 'package:flutter/material.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/pages/dashboard/dashboard.dart';
import 'package:keeyosk/pages/product/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        iconButtonTheme: const IconButtonThemeData(
            style: ButtonStyle(
          iconColor: MaterialStatePropertyAll(
            Colors.white,
          ),
        )),
        appBarTheme: const AppBarTheme(
            backgroundColor: primary,
            centerTitle: true,
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600)),
        tabBarTheme: const TabBarTheme(
            labelColor: secondary,
            indicatorColor: secondary,
            unselectedLabelColor: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: secondary, elevation: 2),
        primaryColor: primary,
        useMaterial3: true,
      ),
      home: const Dashboard(),
    );
  }
}
