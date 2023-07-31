import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment.freezed.dart';
part 'payment.g.dart';

@freezed
class Payment with _$Payment {
  const factory Payment({
    required String store,
    required String orderId,
    required String productId,
    required String purchaseDate,
    required bool checkRenovation,
    required int expiryDate,
    bool? hasBeenDisabled,
    String? unsubscribedAt,
    String? lastPaymentAt,
    List<String>? programsUnlocked,
  }) = _Payment;
  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}
