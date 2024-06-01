import 'package:http/http.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/data/models/cart.dart';
import 'package:keeyosk/data/models/menu_item.dart';
import 'package:keeyosk/data/repositories/repo.dart';
import 'package:keeyosk/data/services/http_service.dart';

class CartRepo implements Repo<Cart> {
  static final _repo = CartRepo._sharedInstance();
  final List<Cart> _cartList = [];
  final HttpService service = HttpService();
  factory CartRepo() => _repo;
  CartRepo._sharedInstance();

  @override
  void add(Cart data) {
    _cartList.add(data);
    try {
      service.write(route: '/cart', data: data.toJSON());
    } catch (e) {
      print(e);
    }
  }

  @override
  void delete(String id, {bool shouldHide = false}) {
    if (shouldHide) {
      final newData = get(id);
      print('already exist');
      update(
          id,
          Cart(
              ownerId: newData.ownerId,
              id: id,
              item: newData.item,
              hidden: true,
              selectedOptions: newData.selectedOptions,
              quantity: newData.quantity));
    } else {
      _cartList.removeWhere((element) => element.id == id);
      service.delete(route: '/cart', id: id);
    }
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
  Future<List<Cart>> init() async {
    final response =
        await service.read(route: '/cart/all', id: currentUser.userId);
    final List data = response;
    _cartList.clear();
    try {
      final carts = data.map((e) => Cart.fromJSON(e)).toList();
      print(data);
      _cartList.addAll(carts);
    } catch (e) {
      print(e);
    }
    return _cartList;
  }

  @override
  void replaceAll(List<Cart> data) {
    _cartList.clear();
    _cartList.addAll(data);
  }

  @override
  void update(String id, data) {
    final index = _cartList.indexWhere((e) => e.id == id);
    _cartList[index] = data;
    service.update(
      route: '/cart',
      id: id,
      data: data.toJSON(),
    );
  }

  @override
  Cart get(String id) {
    return _cartList[_cartList.indexWhere((element) => element.id == id)];
  }
}
