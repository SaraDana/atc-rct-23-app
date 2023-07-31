import 'dart:ui';

import 'package:app/cubits/purchases/purchases_cubit.dart';
import 'package:app/cubits/user_premium/user_premium_state.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/models/program_model.dart';
import 'package:app/models/purchases/payments/payment.dart';
import 'package:app/models/purchases/premium_type.dart';
import 'package:app/models/unit_model.dart';
import 'package:app/repositories/user_premium/user_premium_repository.dart';
import 'package:bloc/bloc.dart';

import '../../config/constants.dart';
import '../../data/services/dana_analytics_service.dart';
import '../../utils/preferences.dart';

class UserPremiumCubit extends Cubit<UserPremiumState> {
  UserPremiumRepository userPremiumRepository;
  UserPremiumCubit({required this.userPremiumRepository})
      : super(UserPremiumState()) {
    load();
  }

  Future<void> load() async {
    try {
      final premiumType = await _checkPremium();
      final programsUnlocked = await _checkProgramsUnlocked();
      final availablePurchaseCredits = await _checkAvailablePurchaseCredits(
          programsUnlocked.length, premiumType);

      PreferenceUtils.setBool(PREF_IS_PREMIUM, premiumType != PremiumType.none);

      emit(state.copyWith(
        premiumType: premiumType,
        programsUnlocked: programsUnlocked,
        availablePurchaseCredits: availablePurchaseCredits,
        showBuyCreditsModal: false,
        showBuyProgramModal: false,
        showPremiumModal: false,
        showFinish5PackModal: false,
        showFinishSubscriptionModal: false,
      ));
    } catch (e) {
      //TODO: handle error
    }
  }

  void navigateTo(VoidCallback callback, Unit unit, Program program) async {
    await load();
    final _userPremiumType = state.premiumType;
    final isPremiumUnit = locator<InitialProfileCubit>()
        .isPremium(unit.isPremium, unit.isPremiumGroupB);
    bool _canNavigate = programUnlocked(program);
    final bool hasOldPayment =
        locator<PurchasesCubit>().state.historyPayments.isNotEmpty;

    if (_canNavigate || !isPremiumUnit) {
      callback();
      return;
    }
    DanaAnalyticsService.trackTryOpenUnitBlocked(unit.id, true, false);
    if (isPremiumUnit) {
      if (_userPremiumType == PremiumType.pack5) {
        if (state.availablePurchaseCredits >= 1) {
          emit(
              state.copyWith(showBuyProgramModal: true, programToBuy: program));
          return;
        } else {
          emit(
              state.copyWith(showBuyCreditsModal: true, programToBuy: program));
          return;
        }
      } else if (hasOldPayment) {
        _checkLastPay();
      } else {
        emit(state.copyWith(showPremiumModal: true, programToBuy: program));
        return;
      }
    }
  }

  bool programUnlocked(Program program) {
    final _programUnlocked = state.premiumType == PremiumType.yearly ||
        state.premiumType == PremiumType.monthly ||
        state.programsUnlocked.contains(program.id);
    return _programUnlocked;
  }

  _checkLastPay() {
    final List<Payment> payments =
        locator<PurchasesCubit>().state.historyPayments;
    if (payments.length > 1) {
      payments.sort((a, b) => a.expiryDate.compareTo(b.expiryDate));
    }
    final PremiumType lastPremiumType =
        convertStringToPremiumType(payments.last.productId);
    if (lastPremiumType == PremiumType.pack5) {
      emit(state.copyWith(showFinish5PackModal: true));
    } else {
      emit(state.copyWith(showFinishSubscriptionModal: true));
    }
  }

  void updatePremiumType() async {
    final PremiumType premiumType = await _checkPremium();
    emit(state.copyWith(
      premiumType: premiumType,
      showBuyCreditsModal: false,
      showBuyProgramModal: false,
      showPremiumModal: false,
      showFinish5PackModal: false,
      showFinishSubscriptionModal: false,
    ));
  }

  Future<void> updateUnlockedPrograms(String programId) async {
    emit(state.copyWith(
      programsUnlocked: [...state.programsUnlocked, programId],
      availablePurchaseCredits: state.availablePurchaseCredits - 1,
    ));
  }

  Future<PremiumType> _checkPremium() async {
    try {
      return await userPremiumRepository.getPremiumType();
    } catch (e) {
      return PremiumType.none;
    }
  }

  Future<PremiumType> getUserPremiumType() => _checkPremium();

  Future<List<String>> _checkProgramsUnlocked() async {
    try {
      return await userPremiumRepository.getProgramsUnlocked();
    } catch (e) {
      return [];
    }
  }

  Future<int> _checkAvailablePurchaseCredits(
      int programsUnlocked, PremiumType premiumType) async {
    if (premiumType == PremiumType.pack5) {
      return await userPremiumRepository
          .getAvailablePurchaseCredits(programsUnlocked);
    }
    return 100;
  }

  Future<void> reset() async {
    emit(UserPremiumState());
    load();
  }
}
