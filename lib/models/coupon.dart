typedef CouponApplicableChecker = bool Function();

enum CouponType { subtract, percentage }

class Coupon {
  final String code;
  final double value;
  final CouponType type;
  final CouponApplicableChecker applicable;
  const Coupon({
    required this.type,
    required this.value,
    required this.code,
    required this.applicable,
  });
  double getValue() {
    if (!applicable()) return 0;
    return value;
  }
}
