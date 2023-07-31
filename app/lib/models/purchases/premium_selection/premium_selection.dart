import 'package:freezed_annotation/freezed_annotation.dart';
part 'premium_selection.freezed.dart';
part 'premium_selection.g.dart';

@freezed
class PremiumSelection with _$PremiumSelection {
  const factory PremiumSelection({
    required String unlockId,
    required String programId,
    required String paymentId,
    required DateTime purchaseDate,
    DateTime? expiryDate,
  }) = _PremiumSelection;
  factory PremiumSelection.fromJson(Map<String, dynamic> json) =>
      _$PremiumSelectionFromJson(json);
}
