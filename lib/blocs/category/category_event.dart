import 'package:keeyosk/data/models/category.dart';

class CategoryEvent {}

class AddedNewField extends CategoryEvent {}

class Setup extends CategoryEvent {}

class Apply extends CategoryEvent {}

class EditingField extends CategoryEvent {
  final String id;
  final String newLabel;
  EditingField({
    required this.id,
    required this.newLabel,
  });
}

class DeletedField extends CategoryEvent {
  final String id;
  DeletedField({required this.id});
}
