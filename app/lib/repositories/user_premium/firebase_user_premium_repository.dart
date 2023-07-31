import 'package:app/core/utils/date_time_utils.dart';
import 'package:app/models/purchases/payments/payment.dart';
import 'package:app/models/purchases/premium_type.dart';
import 'package:app/repositories/user_premium/user_premium_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final COLLECTION_USER_PREMIUM = 'user_premiumData';

class FirebaseUserPremiumRepository implements UserPremiumRepository {
  FirebaseUserPremiumRepository();
  CollectionReference userPremium =
      FirebaseFirestore.instance.collection(COLLECTION_USER_PREMIUM);

  @override
  Future<PremiumType> getPremiumType() async {
    PremiumType premiumType = PremiumType.none;
    final List<Payment> payments = await _getPayments();
    final List<Payment> validPayments = [];

    for (Payment payment in payments) {
      final expiryDate = timeStampToDateTime(payment.expiryDate);
      final bool isValidDate = expiryDate.isAfter(DateTime.now());

      if (payment.hasBeenDisabled == true) {
        return premiumType; // its return PremiumType.none; Because user canceled before
      }

      if (isValidDate) {
        // is still premium
        validPayments.add(payment);
      }
    }

    if (validPayments.isNotEmpty) {
      validPayments.sort((a, b) => a.purchaseDate.compareTo(b.purchaseDate));
      final Payment latestPayment = validPayments.last;
      premiumType = convertStringToPremiumType(latestPayment.productId);
    }

    return premiumType;
  }

  @override
  Future<List<String>> getProgramsUnlocked() async {
    List<String> programsUnlocked = [];
    final payments = await _getPayments();

    for (Payment payment in payments) {
      final expiryDate = timeStampToDateTime(payment.expiryDate);
      final bool isValidDate = expiryDate.isAfter(DateTime.now());
      if (isValidDate) {
        final premiumType = convertStringToPremiumType(payment.productId);
        if (premiumType == PremiumType.pack5) {
          programsUnlocked.addAll(payment.programsUnlocked ?? []);
        }
      }
    }

    return programsUnlocked;
  }

  Future<List<Payment>> _getPayments() async {
    final doc = await FirebaseFirestore.instance
        .collection(COLLECTION_USER_PREMIUM)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    final allData = doc.data() as Map<String, dynamic>;
    final payments =
        allData['payments'].map<Payment>((e) => Payment.fromJson(e)).toList();
    return payments;
  }

  @override
  Future<int> getAvailablePurchaseCredits(int programsUnlocked) async {
    int totalCredits = 0;
    final payments = await _getPayments();
    for (Payment payment in payments) {
      final expiryDate = timeStampToDateTime(payment.expiryDate);
      final bool isValidDate = expiryDate.isAfter(DateTime.now());
      if (isValidDate) {
        final premiumType = convertStringToPremiumType(payment.productId);
        if (premiumType == PremiumType.pack5) {
          totalCredits += 5;
        }
      }
    }
    return totalCredits - programsUnlocked;
  }
}
