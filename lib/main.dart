import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/pages/checkout/checkout_page.dart';
import 'package:keeyosk/pages/dashboard/dashboard.dart';
import 'package:keeyosk/pages/manage_orders/manage_orders.dart';
import 'package:keeyosk/pages/manage_orders/order_page.dart';
import 'package:keeyosk/pages/postcheckout/postcheckout_page.dart';
import 'package:keeyosk/pages/product/product_page.dart';
import 'package:keeyosk/pages/profile/profile_page.dart';
import 'package:keeyosk/pages/signin/signin_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
        textTheme: GoogleFonts.robotoTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: primary,
          
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
        ),
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
      home: const ProductPage(),
    );
  }
}
