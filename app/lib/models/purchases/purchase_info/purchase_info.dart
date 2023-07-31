import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_info.freezed.dart';
part 'purchase_info.g.dart';

@freezed
abstract class PurchaseInfo with _$PurchaseInfo {
  factory PurchaseInfo({
    required String id,
    required String title,
    required String description,
    required String price,
    required double rawPrice,
    required String currencyCode,
  }) = _PurchaseInfo;

  // Create a new instance of PurchaseInfo from a JSON object
  factory PurchaseInfo.fromJson(Map<String, dynamic> json) =>
      _$PurchaseInfoFromJson(json);
}
