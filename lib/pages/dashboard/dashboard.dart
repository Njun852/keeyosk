// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/extensions/price_format.dart';
import 'package:keeyosk/models/menu_item.dart';
import 'package:keeyosk/pages/checkout/checkout_page.dart';
import 'package:keeyosk/pages/dashboard/bottom_sheet.dart';
import 'package:keeyosk/pages/dashboard/drawer_item.dart';
import 'package:keeyosk/pages/dashboard/item_selection.dart';
import 'package:keeyosk/widgets/menu_item.dart';
import 'package:keeyosk/widgets/search_input.dart';
import 'package:sliver_tools/sliver_tools.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: primary),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          height: 60,
                          image: AssetImage('lib/images/user.png'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Tess Tieng Tieng',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '09276300212',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  DrawerItem(
                    isImage: false,
                    label: 'Order History',
                    icon: Icons.history,
                  ),
                  DrawerItem(
                    isImage: false,
                    label: 'FAQ',
                    icon: Icons.help,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 20,
                          endIndent: 20,
                        ),
                      ),
                      Text(
                        'Admin Panel',
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                      Expanded(
                        child: Divider(
                          height: 20,
                          indent: 20,
                        ),
                      ),
                    ],
                  ),
                  DrawerItem(
                    isImage: false,
                    label: 'Orders',
                    icon: Icons.list_alt,
                  ),
                  DrawerItem(
                    isImage: true,
                    label: 'Coupons',
                    url: './lib/images/ticket.png',
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7))),
                    fixedSize: MaterialStatePropertyAll(Size(250, 30)),
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 227, 77, 30))),
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child:
            NestedScrollView(headerSliverBuilder: (context, innerShouldScroll) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: MultiSliver(children: [
                SliverAppBar(
                  snap: true,
                  floating: true,
                  pinned: true,
                  centerTitle: true,
                  expandedHeight: 120,
                  title: const Text('Our Menu'),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CheckoutPage(),
                          ));
                        },
                        icon: Icon(Icons.shopping_cart_outlined))
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.bottomCenter,
                      child: SearchInput(),
                    ),
                  ),
                ),
                SliverPinnedHeader(
                    child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: primary,
                        offset: Offset(0, -1),
                      ),
                    ],
                    color: primary,
                  ),
                  child: TabBar(tabs: [
                    Text('Meals'),
                    Text('Dessert'),
                    Text('Drinks'),
                  ]),
                )),
              ]),
            )
          ];
        }, body: Builder(builder: (context) {
          return TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: CustomScrollView(
                  slivers: [
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverList.builder(
                      itemBuilder: (context, index) {
                        return ItemSelectionView(
                          item: meals[index],
                        );
                      },
                      itemCount: meals.length,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: CustomScrollView(
                  slivers: [
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverList.builder(
                      itemBuilder: (context, index) {
                        return ItemSelectionView(item: desserts[index]);
                      },
                      itemCount: desserts.length,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: CustomScrollView(
                  slivers: [
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverList.builder(
                      itemBuilder: (context, index) {
                        return ItemSelectionView(item: drinks[index]);
                      },
                      itemCount: drinks.length,
                    ),
                  ],
                ),
              ),
            ],
          );
        })),
      ),
      bottomNavigationBar: CustomBottomSheet(),
    );
  }
}
