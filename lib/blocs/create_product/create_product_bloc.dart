import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/create_product/create_product_event.dart';
import 'package:keeyosk/blocs/create_product/create_product_state.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/models/option.dart';
import 'package:keeyosk/data/models/option_item.dart';
import 'package:keeyosk/data/repositories/category_repo.dart';
import 'package:keeyosk/data/repositories/menu_item_repo.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  final List<File> images = [];
  List<Option> options = [];
  double price = 0;
  String productName = '';
  String? description;
  double discountedPrice = 0;
  String categoryId = '';

  CreateProductBloc()
      : super(Initial(
          productName: '',
          images: [],
          description: '',
          categoryId: '',
          discountedPrice: 0,
          price: 0,
          options: [],
        )) {
    on<AddedImages>(
      (event, emit) {
        images.addAll(event.images);
        emit(AddedImagesState(
          productName: productName,
          images: images,
          price: price,
          categoryId: categoryId,
          description: description,
          options: options,
          discountedPrice: discountedPrice,
        ));
      },
    );
    on<RemovedImage>(
      (event, emit) {
        images.remove(event.image);
        emit(AddedImagesState(
          productName: productName,
          images: images,
          price: price,
          categoryId: categoryId,
          description: description,
          options: options,
          discountedPrice: discountedPrice,
        ));
      },
    );

    on<UpdatedProduct>(
      (event, emit) {
        categoryId = event.categoryId;
        productName = event.name;
        description = event.description;
        price = event.price;
        discountedPrice = event.discount;

        emit(AddedImagesState(
          productName: productName,
          images: images,
          price: price,
          categoryId: categoryId,
          description: description,
          options: options,
          discountedPrice: discountedPrice,
        ));
      },
    );
    on<AddedOption>(
      (event, emit) {
        if (options.isNotEmpty && options.last.name.isEmpty) return;
        options.add(
          Option(
            isRequired: false,
            isMultiSelect: false,
            name: '',
            items: [],
            id: uuid.v1(),
          ),
        );
        emit(AddedImagesState(
          productName: productName,
          images: images,
          price: price,
          categoryId: categoryId,
          description: description,
          options: options,
          discountedPrice: discountedPrice,
        ));
      },
    );
    on<UpdatedOption>(
      (event, emit) {
        final index = options.indexWhere((e) => e.id == event.optionId);
        options[index] = Option(
            isRequired: event.isRequired,
            isMultiSelect: event.isMultiSelect,
            name: event.optionName,
            id: event.optionId,
            items: options[index].items);
        emit(AddedImagesState(
          productName: productName,
          images: images,
          price: price,
          categoryId: categoryId,
          description: description,
          options: options,
          discountedPrice: discountedPrice,
        ));
      },
    );
    on<RemovedOption>(
      (event, emit) {
        options.removeWhere((e) => e.id == event.id);
        emit(AddedImagesState(
          productName: productName,
          images: images,
          price: price,
          categoryId: categoryId,
          description: description,
          options: options,
          discountedPrice: discountedPrice,
        ));
      },
    );
    on<AddedOptionItem>(
      (event, emit) {
        final index = options.indexWhere((e) => e.id == event.optionId);
        if (options[index].items.isNotEmpty &&
            options[index].items.last.name.isEmpty) return;
        options[index]
            .items
            .add(OptionItem(id: uuid.v1(), name: '', additionalPrice: 0));
        emit(AddedImagesState(
          productName: productName,
          images: images,
          price: price,
          categoryId: categoryId,
          description: description,
          options: options,
          discountedPrice: discountedPrice,
        ));
      },
    );

    on<RemovedOptionItem>(
      (event, emit) {
        for (Option op in options) {
          op.items.removeWhere((e) => e.id == event.id);
        }
        emit(AddedImagesState(
          productName: productName,
          images: images,
          price: price,
          categoryId: categoryId,
          description: description,
          options: options,
          discountedPrice: discountedPrice,
        ));
      },
    );
    on<UpdatedOptionItem>((event, emit) {
      final index = options.indexWhere((option) {
        return option.items.indexWhere((item) {
              return item.id == event.optionItemId;
            }) !=
            -1;
      });
      final updatedWithItem = options[index].items.map((item) {
        if (item.id == event.optionItemId) {
          return OptionItem(
              id: event.optionItemId,
              name: event.itemName,
              additionalPrice: event.extraCharge);
        }
        return item;
      }).toList();
      options[index] = Option(
          isRequired: options[index].isRequired,
          isMultiSelect: options[index].isMultiSelect,
          name: options[index].name,
          id: options[index].name,
          items: updatedWithItem);

      emit(AddedImagesState(
        productName: productName,
        images: images,
        price: price,
        categoryId: categoryId,
        description: description,
        options: options,
        discountedPrice: discountedPrice,
      ));
    });
    on<AddProduct>(
      (event, emit) {
        MenuItemRepo menuItemRepo = MenuItemRepo();
        CategoryRepo categoryRepo = CategoryRepo();
        menuItemRepo.add(
          MenuItem(
              name: productName.trim(),
              id: uuid.v1(),
              images: images,
              price: price,
              options: options,
              discount: discountedPrice,
              description: description?.trim() ?? 'No description',
              category: categoryRepo.get(categoryId),
              isAvailable: true),
        );
        emit(AddedImagesState(
          productName: productName,
          images: images,
          price: price,
          categoryId: categoryId,
          description: description,
          options: options,
          discountedPrice: discountedPrice,
        ));
      },
    );
  }
}
