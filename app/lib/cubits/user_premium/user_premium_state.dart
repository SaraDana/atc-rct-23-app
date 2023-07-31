import 'package:app/models/program_model.dart';
import 'package:app/models/purchases/premium_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_premium_state.freezed.dart';

@freezed
class UserPremiumState with _$UserPremiumState {
  const factory UserPremiumState({
    @Default(PremiumType.none) PremiumType premiumType,
    @Default([]) List<String> programsUnlocked,
    @Default(0) int availablePurchaseCredits,
    @Default(false) bool showPremiumModal,
    @Default(false) bool showBuyCreditsModal,
    @Default(false) bool showBuyProgramModal,
    @Default(false) bool showFinish5PackModal,
    @Default(false) bool showFinishSubscriptionModal,
    Program? programToBuy,
  }) = _UserPremiumState;
}
