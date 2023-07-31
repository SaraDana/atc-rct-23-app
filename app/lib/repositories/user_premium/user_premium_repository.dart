import 'package:app/models/purchases/premium_type.dart';

abstract class UserPremiumRepository {
  Future<PremiumType> getPremiumType();
  Future<List<String>> getProgramsUnlocked();
  Future<int> getAvailablePurchaseCredits(int programsUnlocked);
}
