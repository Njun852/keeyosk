import 'package:keeyosk/data/models/menu_item.dart';

class Category {
  final String id;
  final String label;

  Category({
    required this.id,
    required this.label,
  });

  Map<String, dynamic> toJSON() {
    return {"category_id": id, "category_label": label};
  }
  static Category fromJSON(Map<String, dynamic> data) {
    return Category(id: data["category_id"], label: data["category_label"]);
  }
}
