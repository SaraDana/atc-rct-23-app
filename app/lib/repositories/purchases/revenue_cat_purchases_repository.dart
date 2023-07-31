import 'dart:io';

import 'package:app/core/utils/date_time_utils.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/models/purchases/constants.dart';
import 'package:app/models/purchases/payments/payment.dart';
import 'package:app/models/purchases/premium_type.dart';
import 'package:app/models/purchases/purchasable_product.dart';
import 'package:app/repositories/purchases/purchases_repository.dart';
import 'package:app/repositories/user_premium/firebase_user_premium_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

const String premium_entitlement_id = "premium";

class RevenueCatPurchasesRepository implements PurchasesRepository {
  @override
  Future<void> buyProduct(String id) async {
    try {
      Package packageToBuy = await _searchPackageById(id);
      final CustomerInfo customerInfo =
          await Purchases.purchasePackage(packageToBuy);
      if (customerInfo
              .entitlements.all[packageToBuy.offeringIdentifier]?.isActive ??
          false) {
        final Payment payment = _createPayment(id);
        await _savePurchaseToDatabase(payment);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<Package> _searchPackageById(String id) async {
    final List<Package> packages = await fetchPackages();
    final Package packageToBuy = packages.firstWhere(
      (p) => p.storeProduct.identifier == id,
    );
    return packageToBuy;
  }

  @override
  Future<List<PurchasableProduct>> loadPurchases() async {
    List<PurchasableProduct> products = [];
    final List<Package> packages = await fetchPackages();
    products = packages.map((p) => PurchasableProduct.fromPackage(p)).toList();
    return products;
  }

  Future<void> _savePurchaseToDatabase(Payment payment) async {
    final bool existPayment = await _checkIfExistPayment(payment.orderId);
    if (existPayment) {
      return;
    }
    CollectionReference userPremium =
        FirebaseFirestore.instance.collection(COLLECTION_USER_PREMIUM);
    userPremium.doc(FirebaseAuth.instance.currentUser!.uid).set({
      'payments': FieldValue.arrayUnion([payment.toJson()])
    }, SetOptions(merge: true));
  }

  Future<List<Package>> fetchPackages() async {
    List<Package> packages = [];

    try {
      final offerings = await Purchases.getOfferings();
      packages = offerings.all.values
          .toList()
          .map((offer) => offer.availablePackages)
          .expand((package) => package)
          .toList();
      return packages;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> unLockProgram(String programId) async {
    try {
      var payments = await _getPayments();
      final validPayments = _filterValidPayments(payments);
      final String orderId = _searchOrderId(validPayments);

      final indexOfPayment =
          payments.indexWhere((element) => element.orderId == orderId);
      payments[indexOfPayment] = payments[indexOfPayment].copyWith(
          programsUnlocked: [
            ...?payments[indexOfPayment].programsUnlocked,
            programId
          ]);

      final List jsonList = payments.map((e) => e.toJson()).toList();

      _updatePayments(jsonList);

      return true;
    } catch (e) {

      return false;
    }
  }

  @override
  Future<List<Payment>> loadHistoryPayments() async {
    final List<Payment> payments = await _getPayments();
    //sort expired date
    payments.sort((a, b) => timeStampToDateWithFormat(b.expiryDate)
        .compareTo(timeStampToDateWithFormat(a.expiryDate)));
    return payments;
  }

  @override
  Future<bool> isPremiumUnsubscribed() async {
    // true if we have an active premium on firebase but revenuecat says it has been cancelled
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();
    String? unsubscribeDetectedAt = customerInfo
        .entitlements.all[premium_entitlement_id]?.unsubscribeDetectedAt;
    return unsubscribeDetectedAt != null;
  }

  @override
  Future<bool> isPremiumActive() async {
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();
    return customerInfo.entitlements.all[premium_entitlement_id]?.isActive ??
        false;
  }

  @override
  Future<List<Payment>> updateDatabaseCancellingPremiums() async {
    List<Payment> changedPayments = <Payment>[];
    List<Payment> newPayments = <Payment>[];

    try {
      List<Payment> payments = await _getPayments();

      if (payments.isEmpty || _isGift(payments)) return [];

      CustomerInfo customerInfo = await Purchases.getCustomerInfo();
      String? unsubscribeDetectedAt = customerInfo
          .entitlements.all[premium_entitlement_id]?.unsubscribeDetectedAt;
      String? lastPaymentAt = customerInfo
          .entitlements.all[premium_entitlement_id]?.latestPurchaseDate;

      for (Payment payment in payments) {
        if ((payment.productId == storeKey1month ||
                payment.productId == storeKey1year) &&
            !(payment.hasBeenDisabled ?? false)) {
          Payment p = payment.copyWith(
              unsubscribedAt: unsubscribeDetectedAt,
              lastPaymentAt: lastPaymentAt,
              hasBeenDisabled: true);
          changedPayments.add(p);
          newPayments.add(p);
        } else {
          newPayments.add(payment);
        }
      }
      final List jsonList = newPayments.map((e) => e.toJson()).toList();

      _updatePayments(jsonList);
      return changedPayments;
    } catch (e) {
      return [];
    }
  }

  void _updatePayments(List<dynamic> jsonList) {
    FirebaseFirestore.instance
        .collection(COLLECTION_USER_PREMIUM)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
      {
        'payments': jsonList,
      },
    );
  }

  bool _isGift(List<Payment> payments) {
    if (payments.isEmpty) return false;
    return payments.last.store == 'gift';
  }

  @override
  Future<List<Payment>> updateDatabaseUnsubscribingPremiums() async {
    List<Payment> changedPayments = <Payment>[];
    List<Payment> newPayments = <Payment>[];
    List<Payment> payments = await _getPayments();
    if (payments.isEmpty || _isGift(payments)) return [];
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();
    String? unsubscribeDetectedAt = customerInfo
        .entitlements.all[premium_entitlement_id]?.unsubscribeDetectedAt;
    String? lastPaymentAt = customerInfo
        .entitlements.all[premium_entitlement_id]?.latestPurchaseDate;

    for (Payment payment in payments) {
      if ((payment.productId == storeKey1month ||
              payment.productId == storeKey1year) &&
          payment.unsubscribedAt == null) {
        Payment p = payment.copyWith(
            unsubscribedAt: unsubscribeDetectedAt,
            lastPaymentAt: lastPaymentAt,
            hasBeenDisabled: false);
        changedPayments.add(p);
        newPayments.add(p);
      } else {
        newPayments.add(payment);
      }
    }
    final List jsonList = newPayments.map((e) => e.toJson()).toList();

    _updatePayments(jsonList);
    return changedPayments;
  }

  @override
  Future<void> updateDatabaseRenewingPremiums() async {
    try {
      final List<Payment> validPayments = await _getPayments();
      validPayments
          .where((payment) =>
              payment.productId == storeKey1month ||
              payment.productId == storeKey1year)
          .toList();
      if (validPayments.isEmpty) return;
      final CustomerInfo customerInfo = await Purchases.getCustomerInfo();
      final EntitlementInfo? entitlement =
          customerInfo.entitlements.all[premium_entitlement_id];

      final Payment lastPayment = validPayments.last;
      final DateTime? revenueCatDate =
          DateTime.tryParse(entitlement?.latestPurchaseDate ?? '');
      final DateTime firebaseDate =
          timeStampToDateTime((int.tryParse(lastPayment.purchaseDate) ?? 0));

      if (lastPayment.hasBeenDisabled == null ||
          lastPayment.unsubscribedAt == null && revenueCatDate != null) {
        if (firebaseDate.toUtc().isBefore(revenueCatDate!.toUtc())) {
          final Payment newPayment = Payment(
            store: Platform.operatingSystem,
            orderId: dateTimeToTimeStamp(DateTime.now()).toString() +
                locator<InitialProfileCubit>().state.id,
            productId: entitlement?.productIdentifier ?? '',
            checkRenovation: false,
            purchaseDate: dateTimeToTimeStamp(
                    DateTime.parse(entitlement?.latestPurchaseDate ?? ''))
                .toString(),
            expiryDate: dateTimeToTimeStamp(
                DateTime.parse(entitlement?.expirationDate ?? '')),
            programsUnlocked: [],
          );
          DanaAnalyticsService.trackPremiumRenewed(
              entitlement?.productIdentifier ?? '');
          await _savePurchaseToDatabase(newPayment);
        }
      }
    } catch (e) {
    }
  }
}

String _searchOrderId(List<Payment> validPayments) {
  if (validPayments.isNotEmpty) {
    validPayments.sort((a, b) => timeStampToDateWithFormat(b.expiryDate)
        .compareTo(timeStampToDateWithFormat(a.expiryDate)));
    for (Payment validPayment in validPayments) {
      if (validPayment.programsUnlocked!.length < 5) {
        return validPayment.orderId;
      }
    }
  }
  return '';
}

List<Payment> _filterValidPayments(List<Payment> payments) {
  late PremiumType premiumType;
  final validPayments = <Payment>[];

  for (Payment payment in payments) {
    final expiryDate = timeStampToDateTime(payment.expiryDate);
    final bool isValidDate = expiryDate.isAfter(DateTime.now());
    if (isValidDate) {
      premiumType = convertStringToPremiumType(payment.productId);
      if (premiumType == PremiumType.pack5) {
        validPayments.add(payment);
      }
    }
  }
  return validPayments;
}

Future<List<Payment>> _getPayments() async {
  try {
    final doc = await FirebaseFirestore.instance
        .collection(COLLECTION_USER_PREMIUM)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    final allData = doc.data() as Map<String, dynamic>;
    final payments =
        allData['payments'].map<Payment>((e) => Payment.fromJson(e)).toList();

    return payments;
  } catch (e) {
    return [];
  }
}

Future<bool> _checkIfExistPayment(String orderId) async {
  final payments = await _getPayments();
  final indexOfPayment =
      payments.indexWhere((element) => element.orderId == orderId);
  if (indexOfPayment == -1) {
    return false;
  }
  return true;
}

_calculateMonths(String productId) {
  if (productId == storeKey1month) {
    return 1;
  }
  if (productId == storeKey1year) {
    return 12;
  }
  return 3;
}

Payment _createPayment(String productId) {
  return Payment(
    store: Platform.operatingSystem,
    orderId: dateTimeToTimeStamp(DateTime.now()).toString() +
        locator<InitialProfileCubit>().state.id,
    productId: productId,
    checkRenovation: false,
    purchaseDate: dateTimeToTimeStamp(DateTime.now()).toString(),
    expiryDate: addMonthsToDate(_calculateMonths(productId)),
    programsUnlocked: [],
  );
}
