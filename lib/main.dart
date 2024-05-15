import 'package:flutter/material.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/constants/routes.dart';
import 'package:keeyosk/data/models/order.dart';
import 'package:keeyosk/data/models/user.dart';
import 'package:keeyosk/data/repositories/order_repo.dart';
import 'package:keeyosk/data/services/socket_service.dart';
import 'package:keeyosk/ui/pages/admin_panel/admin_panel.dart';
import 'package:keeyosk/ui/pages/cart_page/cart_page.dart';
import 'package:keeyosk/ui/pages/category/category_page.dart';
import 'package:keeyosk/ui/pages/dashboard/dashboard.dart';
import 'package:keeyosk/ui/pages/manage_orders/manage_orders.dart';
import 'package:keeyosk/ui/pages/manage_orders/qr_code_scanner.dart';
import 'package:keeyosk/ui/pages/order_details/order_details.dart';
import 'package:keeyosk/ui/pages/order_success/order_success.dart';
import 'package:keeyosk/ui/pages/product/product_page.dart';
import 'package:keeyosk/ui/pages/product_list/product_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  currentUser = users[1];
  final SocketService socketService = SocketService();
  socketService.init();

  if (currentUser.role == Role.admin) {
    OrderRepo repo = OrderRepo();
    repo.apply();
    socketService.socket.on("recieve order", (data) {
      repo.add(Order.fromJSON(data));
    });
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconButtonTheme: const IconButtonThemeData(
            style: ButtonStyle(
          iconColor: MaterialStatePropertyAll(
            Colors.white,
          ),
        )),
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          backgroundColor: primary,
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
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
      home: const Dashboard(),
      routes: {
        productPage: (context) => const ProductPage(),
        cartPage: (context) => const CartPage(),
        adminPanel: (context) => AdminPanel(),
        category: (context) => const Category(),
        dashboard: (context) => const Dashboard(),
        productList: (context) => const ProductList(),
        qrCodeScanner: (context) => const QRCodeScanner(),
        manageOrders: (context) => ManageOrders(),
        orderSuccess: (context) => const OrderSuccess(),
        orderDetails: (context) => const OrderDetails()
      },
    );
  }
}
