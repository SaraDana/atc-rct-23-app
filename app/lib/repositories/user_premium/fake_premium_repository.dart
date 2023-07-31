import 'package:app/models/purchases/premium_type.dart';
import 'package:app/models/purchases/purchase_info/purchase_info.dart';
import 'package:app/repositories/user_premium/user_premium_repository.dart';

class FakeUserPremiumRepository implements UserPremiumRepository {
  @override
  Future<PremiumType> getPremiumType() {
    return Future.value(PremiumType.none);
  }

  @override
  Future<void> saveBuy(PurchaseInfo purchaseInfo) {
    // TODO: implement saveBuy
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getProgramsUnlocked() async {
    return ['1', '2'];
  }

  @override
  Future<int> getAvailablePurchaseCredits(int programsUnlocked) {
    // TODO: implement getAvailablePurchaseCredits
    throw UnimplementedError();
  }
}
