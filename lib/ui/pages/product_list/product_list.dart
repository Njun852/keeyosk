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
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/repositories/menu_item_repo.dart';
import 'package:keeyosk/data/services/http_service.dart';
import 'package:keeyosk/data/services/product_service.dart';
import 'package:keeyosk/ui/pages/product_list/table_row.dart' as tb;
import 'package:keeyosk/ui/widgets/format_price.dart';
import 'package:keeyosk/ui/widgets/price_display.dart';
import 'package:keeyosk/ui/widgets/search_bar.dart';
import 'package:keeyosk/ui/widgets/table_row.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> with RouteAware {
  List<MenuItem> _items = MenuItemRepo().getAll();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height + kToolbarHeight;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          style: appBarIconButtonStyle,
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Product Lists',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          //TODO: query from db
          await ProductService().init();
          setState(() {
            _items = MenuItemRepo().getAll();
          });
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            color: lightblue,
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Products',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: primary,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: SearchBarView(
                              padding: 12,
                            )),
                            SizedBox(width: 15),
                            SizedBox(
                              width: 100,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(addProduct, arguments: {
                                    "title": "Add New Product",
                                    "button": "Add Product",
                                    "feedback": "Created Product!"
                                  });
                                },
                                style: ButtonStyle(
                                    visualDensity: VisualDensity.comfortable,
                                    padding: WidgetStatePropertyAll(
                                        EdgeInsets.all(2)),
                                    backgroundColor: WidgetStatePropertyAll(
                                      secondary,
                                    ),
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    )),
                                child: Text(
                                  'New product',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.7,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            TableRowWidget(
                                shouldHaveDivider: false,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                items: [
                                  TableItem(
                                    flex: 2,
                                    alignment: Alignment.centerLeft,
                                    widget: Text(
                                      'Product Name',
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ),
                                  TableItem(
                                    flex: 1,
                                    alignment: Alignment.centerLeft,
                                    widget: Text(
                                      'Category',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ),
                                  TableItem(
                                    flex: 2,
                                    alignment: Alignment.center,
                                    widget: Text(
                                      'Price',
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ),
                                  TableItem(
                                    flex: 2,
                                    alignment: Alignment.center,
                                    widget: Text(
                                      'Status',
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ),
                                ],
                                backgroundColor: lightblue,
                                height: 30),
                            ...List.generate(_items.length, (index) {
                              // return tb.TableRow(
                              //   item: items[index],
                              // );
                              return TableRowWidget(
                                shouldHaveDivider: false,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                items: [
                                  TableItem(
                                      flex: 2,
                                      widget: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.memory(
                                              _items[index].images.first.file,
                                              height: 30,
                                              width: 30,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: 50,
                                            child: AutoSizeText(
                                              _items[index].name,
                                              minFontSize: 5,
                                              maxLines: 3,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      )),
                                  TableItem(
                                    flex: 1,
                                    alignment: Alignment.center,
                                    widget: AutoSizeText(
                                      maxLines: 3,
                                      minFontSize: 5,
                                      _items[index].category.label,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  TableItem(
                                    flex: 2,
                                    alignment: Alignment.center,
                                    widget: PriceDisplay(
                                      shouldStack: true,
                                      price: _items[index].price,
                                      fontSize: 10,
                                      color: Colors.black,
                                      discount: _items[index].discount ?? 0,
                                    ),
                                  ),
                                  TableItem(
                                    flex: 2,
                                    alignment: Alignment.centerRight,
                                    widget: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          _items[index].isAvailable
                                              ? 'Available'
                                              : 'Not Available',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: _items[index].isAvailable
                                                  ? Color.fromRGBO(
                                                      56, 165, 97, 1)
                                                  : Color.fromRGBO(
                                                      255, 78, 78, 1)),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          height: 30,
                                          width: 15,
                                          child: PopupMenuButton(
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (context) {
                                              return [
                                                PopupMenuItem(
                                                  onTap: () async {
                                                    //TODO: refactor this
                                                    MenuItem item =
                                                        _items[index];
                                                    print(!item.isAvailable);
                                                    HttpService service =
                                                        HttpService();
                                                    final Map<String, dynamic>
                                                        data = {
                                                      "product_id": item.id,
                                                      "price": item.price,
                                                      "options": item.options
                                                          .map((option) {
                                                        return {
                                                          "option_id":
                                                              option.id,
                                                          "option_name":
                                                              option.name,
                                                          "is_required":
                                                              option.isRequired
                                                                  ? 1
                                                                  : 0,
                                                          "is_multiselect":
                                                              option.isMultiSelect
                                                                  ? 1
                                                                  : 0,
                                                          "option_items": option
                                                              .items
                                                              .map((item) {
                                                            return {
                                                              "item_id":
                                                                  item.id,
                                                              "option_id":
                                                                  option.id,
                                                              "item_name":
                                                                  item.name,
                                                              "additional_price":
                                                                  item.additionalPrice
                                                            };
                                                          }).toList()
                                                        };
                                                      }).toList(),
                                                      "product_name":
                                                          item.name.trim(),
                                                      "category_id":
                                                          item.category.id,
                                                      "discount": item.discount,
                                                      "description": item
                                                          .description
                                                          .trim(),
                                                      "is_available":
                                                          !item.isAvailable,
                                                      "images": item.images
                                                          .map((image) => {
                                                                "image_id":
                                                                    image.id,
                                                                "file":
                                                                    image.file,
                                                              })
                                                          .toList()
                                                    };

                                                    await service.update(
                                                        route: '/product',
                                                        id: item.id,
                                                        data: data);
                                                    MenuItemRepo().update(
                                                        _items[index].id,
                                                        MenuItem.fromJSON(
                                                            data));
                                                    setState(() {
                                                      _items = MenuItemRepo()
                                                          .getAll();
                                                    });
                                                  },
                                                  value:
                                                      _items[index].isAvailable
                                                          ? 'Disable'
                                                          : 'Enable',
                                                  child: Text(
                                                      _items[index].isAvailable
                                                          ? 'Disable'
                                                          : 'Enable'),
                                                ),
                                                PopupMenuItem(
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .pushNamed(addProduct,
                                                            arguments: {
                                                          "title":
                                                              "Edit Product",
                                                          "button": "Apply",
                                                          "feedback":
                                                              "Updated Product!",
                                                          "item": _items[index]
                                                        });
                                                  },
                                                  value: 'Edit',
                                                  child: Text('Edit'),
                                                ),
                                                PopupMenuItem(
                                                  onTap: () async {
                                                    //TODO: refactor
                                                    HttpService service =
                                                        HttpService();
                                                    await service.delete(
                                                        route: '/product',
                                                        id: _items[index].id);
                                                    MenuItemRepo().delete(
                                                        _items[index].id);
                                                    setState(() {
                                                      _items = MenuItemRepo()
                                                          .getAll();
                                                    });
                                                  },
                                                  value: 'Delete',
                                                  child: Text('Delete'),
                                                )
                                              ];
                                            },
                                            icon: Icon(
                                              Icons.more_vert_rounded,
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                                backgroundColor: Colors.white,
                                height: 52,
                              );
                            }),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didPopNext() {
    super.didPopNext();
    setState(() {
      _items = MenuItemRepo().getAll();
    });
  }

  @override
  void dispose() {
    super.dispose();
    routeObserver.unsubscribe(this);
  }
}
