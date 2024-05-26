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
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/constants/styles.dart';
import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/data/repositories/category_repo.dart';
import 'package:keeyosk/ui/pages/create_product/product_option.dart';
import 'package:keeyosk/ui/widgets/toast.dart';
import 'package:keeyosk/utils/extensions/price_format.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  int _index = 0;
  final _formKey = GlobalKey<FormState>();
  final List<Category> categories = CategoryRepo().getAll();
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
                                enableInfiniteScroll: false,
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
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Name*',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color.fromRGBO(120, 120, 120, 1)),
                          ),
                          TextFormField(
                            onChanged: (value) {
                              context.read<CreateProductBloc>().add(
                                  UpdatedProduct(
                                      name: value,
                                      price: state.price,
                                      categoryId: state.categoryId,
                                      discount: state.discountedPrice,
                                      description: state.description));
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a name';
                              }
                              return null;
                            },
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
                                      'Price*',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color:
                                              Color.fromRGBO(120, 120, 120, 1)),
                                    ),
                                    SizedBox(
                                      child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          if (state.price <= 0) {
                                            return 'Invalid price value';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          context.read<CreateProductBloc>().add(
                                              UpdatedProduct(
                                                  name: state.productName,
                                                  price: _priceFormatter
                                                      .getUnformattedValue()
                                                      .toDouble(),
                                                  categoryId: state.categoryId,
                                                  discount:
                                                      state.discountedPrice,
                                                  description:
                                                      state.description));
                                        },
                                        textInputAction: TextInputAction.next,
                                        inputFormatters: [_priceFormatter],
                                        keyboardType: TextInputType.number,
                                        initialValue: _priceFormatter
                                            .formatDouble(state.price),
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
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (_priceFormatter
                                                .getUnformattedValue() >
                                            state.price) {
                                          return 'Invalid discount';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        context.read<CreateProductBloc>().add(
                                            UpdatedProduct(
                                                name: state.productName,
                                                price: state.price,
                                                categoryId: state.categoryId,
                                                discount: _priceFormatter
                                                    .getUnformattedValue()
                                                    .toDouble(),
                                                description:
                                                    state.description));
                                      },
                                      inputFormatters: [_priceFormatter],
                                      keyboardType: TextInputType.number,
                                      initialValue:
                                          _priceFormatter.formatDouble(
                                              state.discountedPrice ?? 0),
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
                            onChanged: (value) {
                              context.read<CreateProductBloc>().add(
                                  UpdatedProduct(
                                      name: state.productName,
                                      price: state.price,
                                      categoryId: state.categoryId,
                                      discount: state.discountedPrice,
                                      description: value));
                            },
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null) {
                                return 'Please select a category';
                              }
                              return null;
                            },
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
                            items: List.generate(categories.length, (index) {
                              return DropdownMenuItem(
                                value: categories[index].id,
                                child: Text(categories[index].label),
                              );
                            }),
                            onChanged: (categoryId) {
                              context.read<CreateProductBloc>().add(
                                  UpdatedProduct(
                                      name: state.productName,
                                      price: state.price,
                                      categoryId: categoryId!,
                                      discount: state.discountedPrice,
                                      description: state.description));
                            },
                          ),
                          // CreateOption(),
                          ...List.generate(state.options.length, (index) {
                            return ProductOption(option: state.options[index]);
                          }),
                          Visibility(
                            visible: state.options.isEmpty,
                            child: Divider(
                              height: 25,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<CreateProductBloc>()
                                  .add(AddedOption());
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      context
                                          .read<CreateProductBloc>()
                                          .add(AddedOption());
                                    },
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
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<CreateProductBloc>()
                                      .add(AddProduct());
                                  Navigator.of(context).pop();
                                  return ToastView.init(context).showToast(
                                    'Created new product!',
                                    Icons.check,
                                  );
                                }
                              },
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
          AddedImages(
            images: images.map((element) => File(element.path)).toList(),
          ),
        );
  }
}
