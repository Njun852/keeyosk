// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/link.dart';
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
        drawer: Drawer(),
        body: DefaultTabController(
          initialIndex: 0,
          length: 3,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                snap: true,
                floating: true,
                pinned: true,
                expandedHeight: 130,
                title: const Text('Our Menu'),
                actions: [
                  IconButton(
                      onPressed: null, icon: Icon(Icons.shopping_cart_outlined))
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
                height: 40,
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
              SliverFillRemaining(
                child: Container(
                  color: Color.fromARGB(255, 245, 245, 245),
                  padding: const EdgeInsets.all(8.0),
                  child: TabBarView(
                    children: [
                      ListView(
                        children: [
                          MenuItem(),
                          MenuItem(),
                          MenuItem(),
                          MenuItem(),
                          MenuItem()
                        ],
                      ),
                      ListView(
                        children: [
                          MenuItem(),
                          MenuItem(),
                          MenuItem(),
                          MenuItem(),
                          MenuItem()
                        ],
                      ),
                      ListView(
                        children: [
                          MenuItem(),
                          MenuItem(),
                          MenuItem(),
                          MenuItem(),
                          MenuItem()
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
