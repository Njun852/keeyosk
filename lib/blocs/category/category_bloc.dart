import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/category/category_event.dart';
import 'package:keeyosk/blocs/category/category_state.dart';
import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/data/repositories/category_repo.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  late CategoryRepo repo = CategoryRepo.repo;
  CategoryBloc() : super(Empty(categories: [])) {
    on<Setup>((event, emit) {
      repo.init();
      emit(CategoryState(categories: repo.getAll()));
    });

    on<AddedNewField>(
      (event, emit) {
        repo.add(Category(label: ''));
        emit(CategoryState(categories: repo.getAll()));
      },
    );

    on<EditingField>(
      (event, emit) {
        repo.update(event.label, event.updated);
        emit(CategoryState(categories: repo.getAll()));
      },
    );

    on<DeletedField>(
      (event, emit) {
        repo.delete(event.label);
        emit(CategoryState(categories: repo.getAll()));
      },
    );

    on<Apply>(
      (event, emit) {
        emit(state);
      },
    );
  }
}
