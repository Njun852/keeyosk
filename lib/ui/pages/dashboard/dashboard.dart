// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/constants/styles.dart';
import 'package:keeyosk/extensions/price_format.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/ui/pages/dashboard/item_card.dart';
import 'package:keeyosk/ui/widgets/search_bar.dart';
import 'package:keeyosk/ui/pages/dashboard/sidebar.dart';
import 'package:keeyosk/ui/pages/manage_orders/manage_orders.dart';
import 'package:keeyosk/ui/pages/profile/profile_page.dart';
import 'package:keeyosk/ui/pages/signin/signin_page.dart';
import 'package:keeyosk/ui/widgets/menu_item.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final int _length = 3;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: DefaultTabController(
        length: _length,
        child: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
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
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
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
                    SizedBox(height: 15),
                    SizedBox(
                      height: 40,
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(227, 234, 246, 1),
                        child: TabBar(
                          tabAlignment: _length > 3 ? TabAlignment.center : TabAlignment.fill,
                          isScrollable: _length > 3 ? true : false,
                          tabs: [
                            Tab(text: 'Meals'),
                            Tab(text: 'Desserts'),
                            Tab(text: 'Drinks'),

                          ],
                          dividerHeight: 0,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primary),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                  children: List.generate(
                _length,
                (index) => GridView.count(
                  padding: EdgeInsets.all(18),
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 8,
                  crossAxisCount: 2,
                  children: List.generate(items.length, (index) {
                    return ItemCard(
                      item: items[index],
                    );
                  }),
                ),
              )),
            )
          ],
        ),
      ),
      drawer: Sidebar(),
    );
  }
}
