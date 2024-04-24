import 'package:keeyosk/models/coupon.dart';
import 'package:keeyosk/models/menu_item.dart';

class Order {
  final List<MenuItem> items;
  final double timestamp;
  final List<Coupon>? coupons;
  final double? processingFee;
  Order({
    required this.items,
    required this.timestamp,
    this.processingFee,
    this.coupons,
  });

  double subTotal() {
    double total = 0;
    for (var item in items) {
      total += item.price;
    }
    return total;
  }

  double discountTotal() {
    if (coupons == null) return 0;
    final double subtotal = subTotal();
    double subtractTotal = 0;
    double percentageTotal = 1;
    for (var coupon in coupons!) {
      if (coupon.type == CouponType.subtract) {
        subtractTotal -= coupon.getValue();
      } else {
        percentageTotal += coupon.getValue();
      }
    }
    return (subtotal - subtractTotal) * percentageTotal;
  }

  double totalCost() {
    return discountTotal() + (processingFee ?? 0);
  }
}
