// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
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

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateProductBloc(),
      child: BlocBuilder<CreateProductBloc, CreateProductState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {},
                  style: appBarIconButtonStyle,
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                  )),
              title: Text('Add New Product'),
            ),
            body: Container(
              color: lightblue,
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CarouselSlider(
                            items: [
                              GestureDetector(
                                onTap: () {
                                  _pickImage(context);
                                },
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        './lib/ui/assets/images/add_image.svg',
                                      ),
                                      SizedBox(height: 15),
                                      Text(
                                        'Upload Image',
                                        style: TextStyle(
                                          color: primary,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              ...List.generate(state.images.length, (index) {
                                return Image.file(
                                  state.images[index],
                                  fit: BoxFit.fitHeight,
                                );
                              })
                            ],
                            options: CarouselOptions(
                              viewportFraction: 1,
                              onPageChanged: (val, _) => setState(() {
                                _index = val;
                              }),
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
                  )
                ],
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
