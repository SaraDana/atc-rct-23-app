import 'dart:async';

import 'package:app/config/constants.dart';
import 'package:app/core/utils/date_time_utils.dart';
import 'package:app/cubits/purchases/purchases_state.dart';
import 'package:app/cubits/user_premium/user_premium_cubit.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/user/domain/models/new_user_model.dart';
import 'package:app/models/purchases/payments/payment.dart';
import 'package:app/models/purchases/purchasable_product.dart';
import 'package:app/models/purchases/purchases_status.dart';
import 'package:app/repositories/purchases/purchases_repository.dart';
import 'package:app/utils/preferences.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/features/user/domain/repositories/user_repository.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchasesCubit extends Cubit<PurchasesState> {
  PurchasesRepository purchasesRepository;
  UserRepository userRepository;
  PurchasesCubit({
    required this.purchasesRepository,
    required this.userRepository,
  }) : super(PurchasesState()) {
    loadPurchases();
  }

  Future<void> updatePremiumCancellationsAndRenewals() async {
    bool unsubscribedToPremium =
        await purchasesRepository.isPremiumUnsubscribed();
    bool premiumActive = await purchasesRepository.isPremiumActive();
    if (!premiumActive) {
      await _cancelPremium();
    }
    if (unsubscribedToPremium) {
      await _unsubscribedPremium();
    }
  }

  Future<void> _unsubscribedPremium() async {
    List<Payment> unsubscribed =
        await purchasesRepository.updateDatabaseUnsubscribingPremiums();
    for (Payment p in unsubscribed) {
      DanaAnalyticsService.trackUnsubscribeToPremium(
          p.productId, p.unsubscribedAt ?? "unknown", p.lastPaymentAt != null);
    }
  }

  Future<void> _cancelPremium() async {
    List<Payment> cancelled =
        await purchasesRepository.updateDatabaseCancellingPremiums();
    for (Payment p in cancelled) {
      DanaAnalyticsService.trackPremiumEnded(
          p.productId, p.unsubscribedAt ?? "unknown", p.lastPaymentAt != null);
    }
  }

  Future<void> loadPurchases() async {
    await updatePremiumCancellationsAndRenewals();
    await purchasesRepository.updateDatabaseRenewingPremiums();

    final List<PurchasableProduct> products =
        await purchasesRepository.loadPurchases();
    products.sort(
        (a, b) => a.purchaseInfo.rawPrice.compareTo(b.purchaseInfo.rawPrice));
    final List<Payment> historyPayments =
        await purchasesRepository.loadHistoryPayments();
    final String dateToExpire = _getDateToExpire(historyPayments);
    emit(state.copyWith(
      products: products,
      dateToExpire: dateToExpire,
      historyPayments: historyPayments,
      selectProduct: products.isNotEmpty ? products.first : null,
    ));
  }

  Future<void> buy() async {
    if (state.selectProduct == null) return;
    try {
      bool hadPreviousPrograms =
          locator<UserPremiumCubit>().state.programsUnlocked.length > 1;
      DanaAnalyticsService.trackBuyProduct(
          state.selectProduct?.id, !hadPreviousPrograms);
      emit(state.copyWith(purchasesStatus: PurchaseStatus.pending));
      await purchasesRepository.buyProduct(state.selectProduct?.id ?? '');
      DanaAnalyticsService.trackPaymentConfirmation(state.selectProduct?.id, !hadPreviousPrograms);
      emit(state.copyWith(
        purchasesStatus: PurchaseStatus.purchased,
      ));
      loadPurchases();
      _updateRole();
    } catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e as PlatformException);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        emit(state.copyWith(
          purchasesStatus: PurchaseStatus.error,
        ));
        return;
      }
      emit(state.copyWith(
        purchasesStatus: PurchaseStatus.initial,
      ));
    }
  }

  void selectProduct(PurchasableProduct product) {
    emit(state.copyWith(selectProduct: product));
  }

  void unlockProgram(String orderId) async {
    emit(state.copyWith(unlockProgram: false));
    final bool unLocked = await purchasesRepository.unLockProgram(orderId);
    if (unLocked) {
      await locator<UserPremiumCubit>().updateUnlockedPrograms(orderId);
      emit(state.copyWith(
        unlockProgram: true,
      ));
    }
  }

  void _updateRole() async {
    PreferenceUtils.setBool(PREF_IS_PREMIUM, true);
    await locator<UserPremiumCubit>().load();
  }

  String _getDateToExpire(List<Payment> historyPayments) {
    // sort payments
    if (historyPayments.isEmpty) return '';
    historyPayments.sort((a, b) => timeStampToDateWithFormat(b.expiryDate)
        .compareTo(timeStampToDateWithFormat(a.expiryDate)));
    return timeStampToDateWithFormat(historyPayments[0].expiryDate);
  }

  Future<void> updateUserInfo() async {
    NewUserModel? user = await userRepository.getUserByEmail();
    if (user?.id != null) {
      await Purchases.logIn(user!.id!);
      if (user.name != null) Purchases.setDisplayName(user.name!);
      if (user.email != null) Purchases.setEmail(user.email!);
    } else
      await Purchases.logOut();
  }

  Future<void> updateUserAttribute(String name, String value) async {
    Purchases.setAttributes({name: value});
  }

  Future<void> reset() async {
    emit(PurchasesState().copyWith(
      products: state.products
    ));
  }
}
