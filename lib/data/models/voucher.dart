enum VoucherStatus { active, expired, deactivated }

class Voucher {
  final String offerName;
  final double minimumSpent;
  final double discountPercentage;
  final DateTime start;
  final DateTime end;
  final VoucherStatus status;

  Voucher({
    required this.offerName,
    required this.minimumSpent,
    required this.discountPercentage,
    required this.start,
    required this.end,
    required this.status,
  });
}
