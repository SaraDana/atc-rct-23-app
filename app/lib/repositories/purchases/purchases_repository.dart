import 'dart:async';

import 'package:app/models/purchases/payments/payment.dart';
import 'package:app/models/purchases/purchasable_product.dart';

abstract class PurchasesRepository {
  Future<void> buyProduct(String id);
  Future<List<PurchasableProduct>> loadPurchases();
  Future<bool> unLockProgram(String orderId);
  Future<List<Payment>> loadHistoryPayments();
  Future<bool> isPremiumUnsubscribed();
  Future<bool> isPremiumActive();
  Future<void> updateDatabaseRenewingPremiums();
  Future<List<Payment>> updateDatabaseUnsubscribingPremiums();
  Future<List<Payment>> updateDatabaseCancellingPremiums();
}
