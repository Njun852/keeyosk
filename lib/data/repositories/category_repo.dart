import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/data/repositories/repo.dart';
import 'package:keeyosk/utils/status.dart';

class CategoryRepo implements Repo<Category> {
  static final CategoryRepo repo = CategoryRepo._sharedInstance();
  factory CategoryRepo() => repo;
  CategoryRepo._sharedInstance();

  final List<Category> _categories = [];

  @override
  List<Category> getAll() {
    return _categories;
  }

  @override
  void deleteAll() {
    _categories.clear();
  }

  @override
  void replaceAll(List<Category> cat) {
    _categories.clear();
    _categories.addAll(cat);
  }

  @override
  void init() {
    // _editableCategories.clear();
    // _editableCategories.addAll(_categories);
  }

  @override
  void update(String id, Category cat) {
    final index = _categories.indexWhere((e) => e.id == id);
    _categories[index] = cat;
  }

  @override
  void add(Category cat) {
    _categories.add(cat);
  }

  @override
  void delete(String id) {
    _categories.removeWhere((element) => element.label == id);
  }

  @override
  Category get(String id) {
    return _categories[_categories.indexWhere((element) => element.id == id)];
  }
}
