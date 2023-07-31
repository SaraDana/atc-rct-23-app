import 'package:app/models/purchases/payments/payment.dart';
import 'package:app/models/purchases/purchasable_product.dart';
import 'package:app/models/purchases/purchases_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'purchases_state.freezed.dart';

@freezed
class PurchasesState with _$PurchasesState {
  const factory PurchasesState({
    @Default(false) bool fullPremium,
    @Default(PurchaseStatus.initial) PurchaseStatus purchasesStatus,
    PurchasableProduct? selectProduct,
    @Default([]) List<PurchasableProduct> products,
    @Default(false) bool unlockProgram,
    @Default([]) List<Payment> historyPayments,
    @Default('') String dateToExpire,
  }) = _PurchasesState;
}
