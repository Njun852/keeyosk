
import 'package:http/http.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/data/models/cart.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/repositories/repo.dart';
import 'package:keeyosk/data/services/http_service.dart';

class CartRepo implements Repo<Cart> {
  static final _repo = CartRepo._sharedInstance();
  final List<Cart> _cartList = [];
  factory CartRepo() => _repo;
  CartRepo._sharedInstance();

  @override
  void add(Cart data) {
    _cartList.add(data);
  }

  @override
  void delete(String id) {
    _cartList.removeWhere((element) => element.id == id);
  }

  @override
  void deleteAll() {
    _cartList.clear();
  }

  @override
  List<Cart> getAll() {
    return _cartList;
  }

  @override
  void init() {}

  @override
  void replaceAll(List<Cart> data) {
    _cartList.clear();
    _cartList.addAll(data);
  }

  @override
  void update(String id, data) {
    _cartList.map((element) {
      if (element.id == id) {
        return Cart(
          ownerId: data.ownerId,
          id: id,
          item: data.item,
          selectedOptions: data.selectedOptions,
          quantity: data.quantity,
        );
      }
      return element;
    });
  }
}
