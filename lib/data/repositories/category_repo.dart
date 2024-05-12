import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/data/repositories/repo.dart';
import 'package:keeyosk/utils/status.dart';

class CategoryRepo implements Repo<Category> {
  static final CategoryRepo repo = CategoryRepo._sharedInstance();
  factory CategoryRepo() => repo;
  CategoryRepo._sharedInstance();

  final List<Category> _editableCategories = [];
  final List<Category> _categories = [];

  @override
  List<Category> getAllFinal() {
    return _categories;
  }

  @override
  List<Category> getAll() {
    return _editableCategories;
  }

  @override
  void deleteAll() {
    _editableCategories.clear();
  }

  @override
  void replaceAll(List<Category> cat) {
    _editableCategories.clear();
    _editableCategories.addAll(cat);
  }

  @override
  void deleteAllFinal() {
    _editableCategories.clear();
    _categories.clear();
  }

  @override
  void init() {
    _editableCategories.clear();
    _editableCategories.addAll(_categories);
  }

  @override
  void apply() {
    _categories.clear();
    _categories.addAll(_editableCategories);
    _editableCategories.clear();
  }

  @override
  void update(int index, Category cat) {
    _editableCategories[index] = cat;
  }

  void updateCategoryByLabel(String label, String updated) {
    int index = getCategoryByLabel(label);
    update(index, Category(label: updated));
  }

  @override
  void add(Category cat) {
    _editableCategories.add(cat);
  }

  @override
  void delete(int index) {}
  void removeCategoryByLabel(String label) {
    final index = getCategoryByLabel(label);
    _editableCategories.remove(_editableCategories[index]);
  }

  int getCategoryByLabel(String label) {
    return _editableCategories.indexWhere((element) => element.label == label);
  }
}
