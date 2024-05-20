import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/create_product/create_product_event.dart';
import 'package:keeyosk/blocs/create_product/create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  final List<File> images = [];
  CreateProductBloc() : super(Initial(images: [])) {
    on<AddedImages>(
      (event, emit) {
        images.addAll(event.images);
        emit(CreateProductState(images: images));
      },
    );
  }
}
