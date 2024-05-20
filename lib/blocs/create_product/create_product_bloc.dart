import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/create_product/create_product_event.dart';
import 'package:keeyosk/blocs/create_product/create_product_state.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/data/models/option.dart';
import 'package:keeyosk/data/models/option_item.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  final List<File> images = [];
  List<Option> options = [];
  final double price = 0;
  final double discountedPrice = 0;
  CreateProductBloc()
      : super(Initial(images: [], discountedPrice: 0, price: 0, options: [])) {
    on<PickedImages>(
      (event, emit) {
        images.addAll(event.images);
        emit(AddedImages(
          images: images,
          price: price,
          options: options,
          discountedPrice: discountedPrice,
        ));
      },
    );
    on<RemovedImage>(
      (event, emit) {
        images.remove(event.image);
        emit(CreateProductState(
          images: images,
          options: options,
          price: price,
          discountedPrice: discountedPrice,
        ));
      },
    );
    on<AddOption>(
      (event, emit) {
        options.add(
          Option(
            isRequired: false,
            isMultiSelect: false,
            name: '',
            items: [],
            id: uuid.v1(),
          ),
        );
        emit(CreateProductState(
          images: images,
          options: options,
          price: price,
          discountedPrice: discountedPrice,
        ));
      },
    );
    on<AddOptionItem>(
      (event, emit) {
        final index = options.indexWhere((e) => e.id == event.optionId);
        options[index]
            .items
            .add(OptionItem(id: uuid.v1(), name: '', additionalPrice: 0));
        emit(CreateProductState(
          images: images,
          options: options,
          price: price,
          discountedPrice: discountedPrice,
        ));
      },
    );

    on<RemovedItem>(
      (event, emit) {
        for (Option op in options) {
          op.items.removeWhere((e) => e.id == event.id);
        }

        emit(CreateProductState(
          images: images,
          options: options,
          price: price,
          discountedPrice: discountedPrice,
        ));
      },
    );
    on<ToggledCheckbox>(
      (event, emit) {
        final index = options.indexWhere((e) => e.id == event.id);
        //TODO: CHANGE BACK TO FINAL 
        options[index].isMultiSelect = event.isMultiSelect;
        options[index].isRequired = event.isRequired;
        emit(CreateProductState(
          images: images,
          options: options,
          price: price,
          discountedPrice: discountedPrice,
        ));
      },
    );
    on<RemovedOption>(
      (event, emit) {
        options.removeWhere((e) => e.id == event.id);
        emit(CreateProductState(
          images: images,
          options: options,
          price: price,
          discountedPrice: discountedPrice,
        ));
      },
    );
  }
}
