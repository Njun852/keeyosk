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
      emit(CategoryState(categories: repo.getEditableCategories()));
    });

    on<AddedNewField>(
      (event, emit) {
        repo.addCategory(Category(label: '', items: []));
        emit(CategoryState(categories: repo.getEditableCategories()));
      },
    );

    on<EditingField>(
      (event, emit) {
        repo.updateCategory(event.label, event.updated);
        emit(CategoryState(categories: repo.getEditableCategories()));
      },
    );

    on<DeletedField>(
      (event, emit) {
        repo.removeCategoryByLabel(event.label);
        emit(CategoryState(categories: repo.getEditableCategories()));
      },
    );

    on<Apply>(
      (event, emit) {
        repo.apply();
        emit(state);
      },
    );
  }
}
