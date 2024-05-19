import 'package:keeyosk/constants/routes.dart';
import 'package:keeyosk/data/models/category.dart';
import 'package:keeyosk/data/repositories/repo.dart';
import 'package:keeyosk/data/services/http_service.dart';
import 'package:keeyosk/utils/status.dart';

class CategoryRepo implements Repo<Category> {
  static final CategoryRepo repo = CategoryRepo._sharedInstance();
  factory CategoryRepo() => repo;
  CategoryRepo._sharedInstance();

  final List<Category> _categories = [];
  final HttpService httpService = HttpService();

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
  Future<void> init() async {
    final response = await httpService.read(route: '/category/all');
    final List data = response["data"];

    final categoriesFromDB =
        data.map((element) => Category.fromJSON(element)).toList();
    replaceAll(categoriesFromDB);
  }

  @override
  void update(String id, Category cat) {
    final index = _categories.indexWhere((e) => e.id == id);
    _categories[index] = cat;
    if (cat.label.isNotEmpty) {
      httpService.update(route: '/category', id: id, data: cat.toJSON());
    } else {
      httpService.delete(route: '/category', id: id);
    }
  }

  @override
  void add(Category cat) {
    _categories.add(cat);
    httpService.write(route: '/category', data: cat.toJSON());
  }

  @override
  void delete(String id) {
    _categories.removeWhere((element) => element.id == id);
    httpService.delete(route: '/category', id: id);
  }

  @override
  Category get(String id) {
    return _categories[_categories.indexWhere((element) => element.id == id)];
  }
}
