import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/utils/status.dart';

class CategoryRepo {
  static final CategoryRepo repo = CategoryRepo._sharedInstance();
  factory CategoryRepo() => repo;
  CategoryRepo._sharedInstance();

  final List<Category> _editableCategories = [];
  final List<Category> _categories = [];

  List<Category> getAllCategories() {
    return _categories;
  }

  List<Category> getEditableCategories() {
    return _editableCategories;
  }

  void truncateRepo() {
    _editableCategories.clear();
    _categories.clear();
  }

  void init() {
    _editableCategories.clear();
    _editableCategories.addAll(_categories);
  }

  void apply() {
    _categories.clear();
    _categories.addAll(_editableCategories);
    _editableCategories.clear();
  }

  Status updateCategories(List<Category> categories) {
    _editableCategories.clear();
    getAllCategories().addAll(categories);
    return Status.success;
  }

  Status updateCategory(String label, String updated) {
    Category old = getCategoryByLabel(label).first;
    int index = _editableCategories.indexOf(old);
    _editableCategories[index] = Category(label: updated, items: old.items);
    return Status.success;
  }

  Status addCategory(Category cat) {
    if (getCategoryByLabel(cat.label).isNotEmpty) {
      return Status.failed;
    }
    _editableCategories.add(cat);
    return Status.success;
  }

  Status removeCategoryByLabel(String label) {
    final cat = getCategoryByLabel(label).first;
    _editableCategories.remove(cat);
    return Status.success;
  }

  List<Category> getCategoryByLabel(String label) {
    final List<Category> categories = [];
    for (Category cat in _editableCategories) {
      if (cat.label == label) {
        categories.add(cat);
      }
    }
    return categories;
  }
}
