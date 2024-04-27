import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/pages/checkout/checkout_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverLayoutBuilder(
                builder: (context, constraints) {
                  final bool isScrolled = constraints.scrollOffset > 100;
                  return SliverAppBar(
                    pinned: true,
                    floating: true,
                    title: isScrolled ? const Text('Product Details') : null,
                    snap: true,
                    expandedHeight: 200,
                    backgroundColor: primary,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned(
                            child: CarouselSlider(
                              items: imgs,
                              options: CarouselOptions(
                                  height: double.infinity,
                                  viewportFraction: 1,
                                  onPageChanged: (position, _) {
                                    setState(() {
                                      _index = position;
                                    });
                                  }),
                            ),
                          ),
                          Positioned(
                              bottom: 8,
                              child: DotsIndicator(
                                dotsCount: 3,
                                position: _index,
                              ))
                        ],
                      ),
                    ),
                    leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: isScrolled ? Colors.white : Colors.black,
                      ),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CheckoutPage()));
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          color: isScrolled ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ];
        },
        body: Builder(builder: (context) {
          return CustomScrollView(
            slivers: [
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 18,
                  ),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            '\$15.00',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Description:',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        txt,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 38,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Quantity:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            style: const ButtonStyle(
                              overlayColor: MaterialStatePropertyAll(
                                Colors.grey,
                              ),
                              side: MaterialStatePropertyAll(
                                BorderSide(color: Colors.black),
                              ),
                            ),
                            visualDensity: VisualDensity.compact,
                            onPressed: () {},
                            iconSize: 15,
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 3),
                                  color: Colors.black.withOpacity(0.15),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black),
                            ),
                            child: const Text('1'),
                          ),
                          IconButton(
                            style: const ButtonStyle(
                              overlayColor: MaterialStatePropertyAll(
                                Colors.grey,
                              ),
                              side: MaterialStatePropertyAll(
                                BorderSide(color: Colors.black),
                              ),
                            ),
                            visualDensity: VisualDensity.compact,
                            onPressed: () {},
                            iconSize: 15,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('SIZE:'),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: DropdownButtonFormField(
                          alignment: Alignment.topCenter,
                          value: 'Small',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                          elevation: 1,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            isDense: true,
                            constraints:
                                BoxConstraints(maxWidth: 100, maxHeight: 35),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'Small',
                              child: Text(
                                'Small',
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'Medium',
                              child: Text('Medium'),
                            ),
                            DropdownMenuItem(
                              value: 'Large',
                              child: Text('Large'),
                            ),
                          ],
                          onChanged: (_) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
      bottomNavigationBar: Container(
        color: primary,
        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        width: double.infinity,
        child: ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Color.fromARGB(
                255,
                244,
                203,
                26,
              ),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'ADD TO ORDER',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
