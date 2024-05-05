// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/constants/styles.dart';
import 'package:keeyosk/extensions/price_format.dart';
import 'package:keeyosk/models/menu_item.dart';
import 'package:keeyosk/pages/checkout/checkout_page.dart';
import 'package:keeyosk/pages/dashboard/item_card.dart';
import 'package:keeyosk/pages/dashboard/search_bar.dart';
import 'package:keeyosk/pages/manage_orders/manage_orders.dart';
import 'package:keeyosk/pages/profile/profile_page.dart';
import 'package:keeyosk/pages/signin/signin_page.dart';
import 'package:keeyosk/widgets/menu_item.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 3, vsync: this, animationDuration: Duration.zero);
    _tabController.addListener(handleChange);
  }

  void handleChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            centerTitle: true,
            title: Text(
              'Our menu',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
            leading: IconButton(
              style: appBarIconButtonStyle,
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                style: appBarIconButtonStyle,
                icon: Icon(Icons.shopping_cart_outlined),
                onPressed: () {},
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SearchBarView(),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: GridView.count(
              padding: EdgeInsets.all(18),
              childAspectRatio: 0.75,
              mainAxisSpacing: 12,
              crossAxisSpacing: 8,
              crossAxisCount: 2,
              children: List.generate(items.length, (index) {
                return ItemCard(
                  name: items[index].name,
                  price: items[index].price,
                  imgLink: items[index].imageUrl,
                  discountPrice: items[index].discount,
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
