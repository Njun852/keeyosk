// import 'package:keeyosk/constants/items.dart';
// import 'package:keeyosk/data/models/cart.dart';
// import 'package:keeyosk/data/models/menu_item.dart';
// import 'package:keeyosk/data/models/option.dart';
// import 'package:keeyosk/data/models/option_item.dart';
// import 'package:keeyosk/data/models/order.dart';
// import 'package:keeyosk/data/models/user.dart';
// import 'package:keeyosk/data/repositories/order_repo.dart';

// class OrderService {
//   static final OrderService _service = OrderService._sharedInstance();
//   factory OrderService() => _service;
//   OrderService._sharedInstance();

//   final OrderRepo _repo = OrderRepo();

//   void fromJSON(
//     String tableId,
//     String hour,
//     String date,
//     String orderMode,
//     String customerId,
//     List cart,
//   ) {
//     final int customerIndex = users.indexWhere(
//       (element) => element.userId == customerId,
//     );
//     final User customer = users[customerIndex];
//     final List<Cart> carts = [];

//     for (Map cartItem in cart) {
//       int quantity = cartItem["quantity"];
//       String cartId = cartItem["cartId"];
//       String itemId = cartItem["itemId"];
//       List<dynamic> selectedOptionsId = cartItem["selectedOptionsId"];
//       int itemIndex = items.indexWhere((element) => element.id == itemId);
//       MenuItem item = items[itemIndex];

//       List<OptionItem> selectedOptions = [];
//       for (Option option in item.options) {
//         for (String optionId in selectedOptionsId) {
//           int indexOfItem = option.items.indexWhere(
//             (element) => element.id == optionId,
//           );
//           if (indexOfItem != -1) {
//             selectedOptions.add(option.items[indexOfItem]);
//           }
//         }
//       }
//       carts.add(Cart(
//         id: cartId,
//         item: item,
//         selectedOptions: selectedOptions,
//         quantity: quantity,
//       ));
//     }
//     _repo.add(Order(
//         orderMode: orderMode,
//         hour: hour,
//         date: date,
//         customer: customer,
//         tableId: tableId,
//         carts: carts,
//         vouchersApplied: [],
//         status: OrderStatus.pending));
//   }
// }
