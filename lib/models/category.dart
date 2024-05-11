import 'package:keeyosk/models/menu_item.dart';

class Category {
  final String id;
  final String label;
  final List<MenuItem> items;

  Category({
    required this.id,
    required this.label,
    required this.items,
  });
}
