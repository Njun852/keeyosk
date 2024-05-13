import 'package:keeyosk/data/models/cart.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/repositories/repo.dart';

class CartRepo {
  static final _repo = CartRepo._sharedInstance();
  final List<Cart> _cartList = [];
  factory CartRepo() => _repo;

  CartRepo._sharedInstance();
  void apply(Cart cart) {
    _cartList.add(cart);
  }

  void deleteFromId(int id) {
    int index = _cartList.indexWhere((element) => element.id == id);
    delete(index);
  }

  void delete(int index) {
    _cartList.removeAt(index);
  }

  void deleteAll() {
    _cartList.clear();
  }

  List<Cart> getAll() {
    return _cartList;
  }

  void replaceAll(List<Cart> data) {
    _cartList.clear();
    _cartList.addAll(data);
  }

  void update(int index, Cart data) {
    _cartList[index] = data;
  }
}
