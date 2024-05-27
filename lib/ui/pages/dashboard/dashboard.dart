// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/globals.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/constants/routes.dart';
import 'package:keeyosk/constants/styles.dart';
import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/repositories/category_repo.dart';
import 'package:keeyosk/data/repositories/menu_item_repo.dart';
import 'package:keeyosk/data/services/product_service.dart';

import 'package:keeyosk/ui/pages/dashboard/item_card.dart';
import 'package:keeyosk/ui/widgets/search_bar.dart';
import 'package:keeyosk/ui/pages/dashboard/sidebar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with RouteAware {
  List<Category> _categories = CategoryRepo().getAll();
  List<List<MenuItem>> _productsGroup = CategoryRepo().getAll().map((category) {
    final products = MenuItemRepo().getAll();
    return products.where((item) => item.category.id == category.id).toList();
  }).toList();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: DefaultTabController(
        length: _categories.length,
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
                  onPressed: () {
                    Navigator.of(context).pushNamed(cartPage);
                  },
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
                          tabAlignment: _categories.length > 3
                              ? TabAlignment.center
                              : TabAlignment.fill,
                          isScrollable: _categories.length > 3,
                          tabs: List.generate(_categories.length, (index) {
                            return Tab(
                              child: AutoSizeText(
                                _categories[index].label,
                                maxLines: 1,
                                minFontSize: 5,
                                textAlign: TextAlign.center,
                              ),
                            );
                          }),
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
                _productsGroup.length,
                (index) => RefreshIndicator(
                  onRefresh: () async {
                    await ProductService().init();
                    setState(() {
                      _categories = CategoryRepo().getAll();
                      _productsGroup = CategoryRepo().getAll().map((category) {
                        final products = MenuItemRepo().getAll();
                        return products
                            .where((item) => item.category.id == category.id)
                            .toList();
                      }).toList();
                    });
                  },
                  child: GridView.count(
                    padding: EdgeInsets.all(18),
                    childAspectRatio: 0.75,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    crossAxisCount: 2,
                    children: List.generate(_productsGroup[index].length, (i) {
                      return ItemCard(
                        item: _productsGroup[index][i],
                      );
                    }),
                  ),
                ),
              )),
            )
          ],
        ),
      ),
      drawer: Sidebar(),
    );
  }

  @override
  void didPopNext() {
    super.didPopNext();
    setState(() {
      _categories = CategoryRepo().getAll();
      _productsGroup = CategoryRepo().getAll().map((category) {
        final products = MenuItemRepo().getAll();
        return products
            .where((item) => item.category.id == category.id)
            .toList();
      }).toList();
    });
  }

  @override
  void dispose() {
    super.dispose();
    routeObserver.unsubscribe(this);
  }
}
