// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
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
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.history,
                            color: Colors.black,
                            size: 35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Order History',
                            style: TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'lib/images/ticket.png',
                            height: 35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Vouchers',
                            style: TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'lib/images/wrench.png',
                            height: 35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Admin Panel',
                            style: TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.help,
                            color: Colors.black,
                            size: 35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'FAQ',
                            style: TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                    ),
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
          child: NestedScrollView(
              headerSliverBuilder: (context, innerShouldScroll) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: MultiSliver(children: [
                  SliverAppBar(
                    snap: true,
                    floating: true,
                    pinned: true,
                    expandedHeight: 120,
                    title: const Text('Our Menus'),
                    actions: [
                      IconButton(
                          onPressed: null,
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
                  padding: const EdgeInsets.all(8.0),
                  child: CustomScrollView(
                    slivers: [
                      SliverOverlapInjector(
                        handle:
                            NestedScrollView.sliverOverlapAbsorberHandleFor(
                                context),
                      ),
                      SliverList.list(children: [
                        MenuItem(),
                        MenuItem(),
                        MenuItem(),
                        MenuItem()
                      ])
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomScrollView(
                    slivers: [
                      SliverOverlapInjector(
                        handle:
                            NestedScrollView.sliverOverlapAbsorberHandleFor(
                                context),
                      ),
                      SliverList.list(children: [
                        MenuItem(),
                        MenuItem(),
                        MenuItem(),
                        MenuItem()
                      ])
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomScrollView(
                    slivers: [
                      SliverOverlapInjector(
                        handle:
                            NestedScrollView.sliverOverlapAbsorberHandleFor(
                                context),
                      ),
                      SliverList.list(children: [
                        MenuItem(),
                        MenuItem(),
                        MenuItem(),
                        MenuItem()
                      ])
                    ],
                  ),
                ),
              ],
            );
          })),
        ));
  }
}
