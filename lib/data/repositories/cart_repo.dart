import 'package:http/http.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/data/models/cart.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/repositories/repo.dart';
import 'package:keeyosk/data/services/http_service.dart';

class CartRepo {
  static final _repo = CartRepo._sharedInstance();
  final List<Cart> _cartList = [];
  factory CartRepo() => _repo;

  Future<void> init() async {
    // service = HttpService();
    // final res =
    //     await service.read(route: "cart", data: currentUser.userId) as List;
    // _cartList.addAll(res.map((e) => Cart.fromJSON(e)).toList());
    // for (var i = 0; i < res.length; i++) {
    //   _cartList.add(Cart.fromJSON(res[i]));
    // }
    // print(res);
  }

  CartRepo._sharedInstance();
  void apply(Cart cart) {
    _cartList.add(cart);
  }

  void deleteFromId(String id) {
    delete(getIndexFromId(id));
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

  int getIndexFromId(String id) {
    return _cartList.indexWhere((element) => element.id == id);
  }

  void update(String id, Cart data) {
    _cartList[getIndexFromId(id)] = data;
  }
}
