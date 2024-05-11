import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/routes.dart';
import 'package:keeyosk/ui/pages/admin_panel/admin_panel.dart';
import 'package:keeyosk/ui/pages/category/category_page.dart';
import 'package:keeyosk/ui/pages/checkout/checkout_page.dart';
import 'package:keeyosk/ui/pages/dashboard/dashboard.dart';
import 'package:keeyosk/ui/pages/manage_orders/manage_orders.dart';
import 'package:keeyosk/ui/pages/manage_orders/order_page.dart';
import 'package:keeyosk/ui/pages/postcheckout/postcheckout_page.dart';
import 'package:keeyosk/ui/pages/product/product_page.dart';
import 'package:keeyosk/ui/pages/profile/profile_page.dart';
import 'package:keeyosk/ui/pages/signin/signin_page.dart';

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
      home: Dashboard(),
      routes: {
        productPage: (context) => const ProductPage(),
        adminPanel: (context) => AdminPanel(),
        category: (context) => const Category()
      },
    );
  }
}
