// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keeyosk/blocs/create_product/create_product_bloc.dart';
import 'package:keeyosk/blocs/create_product/create_product_event.dart';
import 'package:keeyosk/blocs/create_product/create_product_state.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/styles.dart';
import 'package:keeyosk/ui/pages/create_product/product_option.dart';
import 'package:keeyosk/utils/extensions/price_format.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  int _index = 0;
  final CurrencyTextInputFormatter _priceFormatter =
      CurrencyTextInputFormatter.currency(symbol: '₱');
  final _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateProductBloc(),
      child: BlocConsumer<CreateProductBloc, CreateProductState>(
        listener: (context, state) {
          _carouselController.jumpToPage(state.images.length);
          if (state is AddedImages) {
            setState(() {
              _index = state.images.length;
            });
            Future.delayed(Duration(milliseconds: 800), () {
              _carouselController.animateToPage(0,
                  duration: Duration(seconds: 1), curve: Curves.ease);
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: appBarIconButtonStyle,
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                  )),
              title: Text('Add New Product'),
            ),
            body: Container(
              color: lightblue,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CarouselSlider(
                              carouselController: _carouselController,
                              items: [
                                GestureDetector(
                                  onTap: () {
                                    _pickImage(context);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          './lib/ui/assets/images/add_image.svg',
                                        ),
                                        SizedBox(height: 15),
                                        Text(
                                          'Upload Image',
                                          style: TextStyle(
                                            color: primary,
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                ...List.generate(state.images.length, (index) {
                                  return Container(
                                    color: Colors.white,
                                    width: double.infinity,
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.file(
                                            state.images[index],
                                            fit: BoxFit.fitHeight,
                                          ),
                                          Positioned(
                                            right: 5,
                                            top: 5,
                                            child: SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: IconButton(
                                                style: ButtonStyle(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  padding:
                                                      WidgetStatePropertyAll(
                                                          EdgeInsets.zero),
                                                  backgroundColor:
                                                      WidgetStatePropertyAll(
                                                    Color.fromRGBO(
                                                        255, 78, 78, 1),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  context
                                                      .read<CreateProductBloc>()
                                                      .add(RemovedImage(
                                                          image: state
                                                              .images[index]));
                                                },
                                                icon: Icon(Icons.close),
                                              ),
                                            ),
                                          )
                                        ]),
                                  );
                                })
                              ],
                              options: CarouselOptions(
                                animateToClosest: false,
                                viewportFraction: 1,
                                onPageChanged: (val, _) {
                                  setState(() {
                                    _index = val;
                                  });
                                },
                                scrollPhysics: state.images.isNotEmpty
                                    ? ScrollPhysics()
                                    : NeverScrollableScrollPhysics(),
                              )),
                          Visibility(
                            visible: state.images.isNotEmpty,
                            child: Positioned(
                              bottom: 0,
                              child: DotsIndicator(
                                decorator: DotsDecorator(
                                  size: Size(4, 4),
                                  activeSize: Size(4, 4),
                                ),
                                dotsCount: state.images.length + 1,
                                position: _index,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 18),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Name *',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color.fromRGBO(120, 120, 120, 1)),
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: grey),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 18),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Price *',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color:
                                              Color.fromRGBO(120, 120, 120, 1)),
                                    ),
                                    SizedBox(
                                      child: TextFormField(
                                        textInputAction: TextInputAction.next,
                                        inputFormatters: [_priceFormatter],
                                        keyboardType: TextInputType.number,
                                        initialValue:
                                            _priceFormatter.formatDouble(0),
                                        style: TextStyle(fontFamily: 'Roboto'),
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: grey),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: grey),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(color: grey),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Discounted Price',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Color.fromRGBO(120, 120, 120, 1),
                                      ),
                                    ),
                                    TextFormField(
                                      inputFormatters: [_priceFormatter],
                                      keyboardType: TextInputType.number,
                                      initialValue:
                                          _priceFormatter.formatDouble(0),
                                      style: TextStyle(fontFamily: 'Roboto'),
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: grey),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: grey),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(color: grey),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 18),
                          Text(
                            'Description',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color.fromRGBO(120, 120, 120, 1)),
                          ),
                          TextFormField(
                            maxLines: 5,
                            maxLength: 150,
                            style: TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: grey),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 18),
                          Text(
                            'Choose Category*',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color.fromRGBO(120, 120, 120, 1)),
                          ),
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: grey),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            items: [
                              DropdownMenuItem(
                                value: 'Meals',
                                child: Text('Meals'),
                              ),
                              DropdownMenuItem(
                                value: 'Drinks',
                                child: Text('Drinks'),
                              ),
                              DropdownMenuItem(
                                value: 'Dessert',
                                child: Text('Dessert'),
                              )
                            ],
                            onChanged: (_) {},
                          ),
                          // CreateOption(),
                          ...List.generate(state.options.length, (index) {
                            return ProductOption(option: state.options[index]);
                          }),
                          Divider(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<CreateProductBloc>()
                                  .add(AddOption());
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: IconButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        visualDensity: VisualDensity.compact,
                                        padding: WidgetStatePropertyAll(
                                          EdgeInsets.zero,
                                        ),
                                        side: WidgetStatePropertyAll(
                                            BorderSide(color: primary))),
                                    icon: Icon(
                                      Icons.add,
                                      size: 15,
                                      color: primary,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Add Option',
                                  style: TextStyle(
                                    color: primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 35),
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(secondary),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Add Product',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();
    if (!context.mounted) return;
    context.read<CreateProductBloc>().add(
          PickedImages(
            images: images.map((element) => File(element.path)).toList(),
          ),
        );
  }
}
