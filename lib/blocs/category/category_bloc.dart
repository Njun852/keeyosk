import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeyosk/blocs/category/category_event.dart';
import 'package:keeyosk/blocs/category/category_state.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/data/repositories/category_repo.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  late CategoryRepo repo = CategoryRepo.repo;
  String _currentLabel = '';

  CategoryBloc() : super(Empty(categories: [])) {
    on<Setup>((event, emit) {
      emit(CategoryState(categories: repo.getAll()));
    });

    on<AddedNewField>(
      (event, emit) {
        if (repo.getAll().isEmpty || repo.getAll().last.label.isNotEmpty) {
          repo.add(Category(label: '', id: uuid.v1()));
        }
        emit(CategoryState(categories: repo.getAll()));
      },
    );

    on<EditingField>(
      (event, emit) {
        repo.update(event.id, Category(id: event.id, label: event.newLabel));

        emit(CategoryState(categories: repo.getAll()));
      },
    );

    on<DeletedField>(
      (event, emit) {
        repo.delete(event.id);
        emit(CategoryState(categories: repo.getAll()));
      },
    );

    on<Apply>(
      (event, emit) {
        repo.getAll().forEach((element) {
          if (element.label.isEmpty) {
            repo.delete(element.id);
          }
        });
      },
    );
  }
}
