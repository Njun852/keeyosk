import 'package:keeyosk/data/models/category.dart';

class CategoryEvent {}

class AddedNewField extends CategoryEvent {}

class Setup extends CategoryEvent {}
class Apply extends CategoryEvent {}
class EditingField extends CategoryEvent {
  final String label;
  final String updated;
  EditingField({
    required this.label,
    required this.updated,
  });
}

class DeletedField extends CategoryEvent {
  final String label;
  DeletedField({required this.label});
}


