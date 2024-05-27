import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
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
import 'package:keeyosk/data/services/http_service.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  final List<MenuItemImage> images = [];
  List<Option> options = [];
  double price = 0;
  String productName = '';
  late final String productId;
  String? description;
  double? discountedPrice;
  String categoryId = '';
  late final bool alreadyExist;

  CreateProductBloc({MenuItem? item})
      : super(Initial(
            productName: item?.name ?? '',
            images: item?.images ?? [],
            categoryId: item?.category.id ?? '',
            price: item?.price ?? 0,
            description:  item?.description,
            options: item?.options ?? [],
            discountedPrice: item?.discount)) {
    print('id: ' + (item?.id.toString() ?? ''));
    print('imgs: ' + images.length.toString());
    if (item?.id != null) {
      alreadyExist = true;
      print(item!.images.length);
      images.addAll(item.images);
      options = item.options;
      productName = item.name;
      description = item.description;
      categoryId = item.category.id;
      price = item.price;
      discountedPrice = item.discount;

      productId = item.id;
    } else {
      alreadyExist = false;
      productId = uuid.v1();
    }
    print(item?.id != null);
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
        images.removeWhere((item) => item.id == event.id);
        emit(RemovedImageState(
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

        emit(CreateProductState(
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
            menuItemId: productId,
            isRequired: false,
            isMultiSelect: false,
            name: '',
            items: [],
            id: uuid.v1(),
          ),
        );
        emit(CreateProductState(
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
            menuItemId: productId,
            isRequired: event.isRequired,
            isMultiSelect: event.isMultiSelect,
            name: event.optionName,
            id: event.optionId,
            items: options[index].items);
        emit(CreateProductState(
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
        emit(CreateProductState(
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
        emit(CreateProductState(
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
        emit(CreateProductState(
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
          menuItemId: productId,
          isRequired: options[index].isRequired,
          isMultiSelect: options[index].isMultiSelect,
          name: options[index].name,
          id: options[index].id,
          items: updatedWithItem);

      emit(CreateProductState(
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
        HttpService service = HttpService();
        final Map<String, dynamic> data = {
          "product_id": productId,
          "price": price,
          "options": options.map((option) {
            return {
              "option_id": option.id,
              "option_name": option.name,
              "is_required": option.isRequired ? 1 : 0,
              "is_multiselect": option.isMultiSelect ? 1 : 0,
              "option_items": option.items.map((item) {
                return {
                  "item_id": item.id,
                  "option_id": option.id,
                  "item_name": item.name,
                  "additional_price": item.additionalPrice
                };
              }).toList()
            };
          }).toList(),
          "product_name": productName.trim(),
          "category_id": categoryId,
          "discount": discountedPrice,
          "description": description?.trim() ?? 'No description',
          "is_available": 1,
          "images": images
              .map((image) => {
                    "image_id": image.id,
                    "file": image.file,
                  })
              .toList()
        };
        if (alreadyExist) {
          menuItemRepo.update(productId, MenuItem.fromJSON(data));
          service.update(route: '/product', id: productId, data: data);
        } else {
          menuItemRepo.add(
            MenuItem(
                name: productName.trim(),
                id: productId,
                images: images,
                price: price,
                options: options,
                discount: discountedPrice,
                description: description?.trim() ?? 'No description',
                category: categoryRepo.get(categoryId),
                isAvailable: true),
          );
          service.write(route: '/product', data: data);
        }
        emit(CreateProductState(
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
