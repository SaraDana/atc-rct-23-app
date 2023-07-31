// import 'dart:async';
// import 'dart:io';
//
// import 'package:app/core/utils/date_time_utils.dart';
// import 'package:app/models/purchases/constants.dart';
// import 'package:app/models/purchases/payments/payment.dart';
// import 'package:app/models/purchases/premium_type.dart';
// import 'package:app/models/purchases/purchasable_product.dart';
// import 'package:app/repositories/purchases/purchases_repository.dart';
// import 'package:app/repositories/user_premium/firebase_user_premium_repository.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:in_app_purchase/in_app_purchase.dart';
// import 'package:in_app_purchase_android/in_app_purchase_android.dart';
//
// class NativePurchasesRepository extends PurchasesRepository {
//   final InAppPurchase _inAppPurchase = InAppPurchase.instance;
//   List<PurchasableProduct> products = [];
//   NativePurchasesRepository() {
//     _inAppPurchase.purchaseStream.listen(
//       addToStream,
//       onDone: _updateStreamOnDone,
//       onError: _updateStreamOnError,
//     );
//   }
//
//   @override
//   Future<void> buyProduct(PurchasableProduct purchasableProduct) async {
//     final purchaseParam =
//         PurchaseParam(productDetails: purchasableProduct.productDetails);
//     switch (purchasableProduct.id) {
//       case storeKeyConsumable:
//         await _inAppPurchase.buyConsumable(purchaseParam: purchaseParam);
//         break;
//       case storeKey1year:
//         await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
//         break;
//       case storeKey1month:
//         await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
//         break;
//       default:
//         throw ArgumentError.value(purchasableProduct.productDetails,
//             '${purchasableProduct.id} is not a known product');
//     }
//   }
//
//   @override
//   Future<List<PurchasableProduct>> loadPurchases() async {
//     final available = await _inAppPurchase.isAvailable();
//
//     if (defaultTargetPlatform == TargetPlatform.android) {
//       final InAppPurchaseAndroidPlatformAddition androidAddition =
//           _inAppPurchase
//               .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
//       final QueryPurchaseDetailsResponse response =
//           await androidAddition.queryPastPurchases();
//
//       response.pastPurchases
//           .forEach((pd) => androidAddition.consumePurchase(pd));
//     }
//
//     if (!available) {
//       return [];
//     }
//
//     final response = await _inAppPurchase.queryProductDetails(ids);
//     for (var element in response.notFoundIDs) {
//       debugPrint('Purchase $element not found');
//     }
//
//     products =
//         response.productDetails.map((e) => PurchasableProduct(e)).toList();
//     return products;
//   }
//
//   @override
//   Future<bool> verifyPurchase(PurchaseDetails purchaseDetails) async {
//     return true;
//   }
//
//   Future<void> _updateStreamOnDone() async {
//     print('Stream done');
//   }
//
//   Future<void> _updateStreamOnError(Object error) async {
//     print('Stream error: $error');
//     // handle error here.
//   }
//
//   @override
//   Future<void> savePurchaseToDatabase(PurchaseDetails purchaseDetails) async {
//     switch (purchaseDetails.productID) {
//       case storeKeyConsumable:
//         await _saveConsumableToFirebase(purchaseDetails);
//         break;
//       case storeKey1year:
//         await _saveSubscriptionToFirebase(purchaseDetails);
//         break;
//       case storeKey1month:
//         await _saveSubscriptionToFirebase(purchaseDetails);
//         break;
//     }
//   }
//
//   @override
//   Future<bool> unLockProgram(String programId) async {
//     try {
//       var payments = await _getPayments();
//       final validPayments = _filterValidPayments(payments);
//       final String orderId = _searchOrderId(validPayments);
//
//       final indexOfPayment =
//           payments.indexWhere((element) => element.orderId == orderId);
//       payments[indexOfPayment] = payments[indexOfPayment].copyWith(
//           programsUnlocked: [
//             ...?payments[indexOfPayment].programsUnlocked,
//             programId
//           ]);
//
//       final List jsonList = payments.map((e) => e.toJson()).toList();
//
//       FirebaseFirestore.instance
//           .collection(COLLECTION_USER_PREMIUM)
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .update(
//         {
//           'payments': jsonList,
//         },
//       );
//
//       return true;
//     } catch (e) {
//       print(e);
//
//       return false;
//     }
//   }
//
//   @override
//   Future<List<Payment>> loadHistoryPayments() async {
//     return await _getPayments();
//   }
// }
//
// String _searchOrderId(List<Payment> validPayments) {
//   if (validPayments.isNotEmpty) {
//     validPayments.sort((a, b) => b.expiryDate.compareTo(a.expiryDate));
//     for (Payment validPayment in validPayments) {
//       if (validPayment.programsUnlocked!.length < 5) {
//         return validPayment.orderId;
//       }
//     }
//   }
//   return '';
// }
//
// List<Payment> _filterValidPayments(List<Payment> payments) {
//   late PremiumType premiumType;
//   final validPayments = <Payment>[];
//
//   for (Payment payment in payments) {
//     final expiryDate = timeStampToDateTime(payment.expiryDate);
//     final bool isValidDate = expiryDate.isAfter(DateTime.now());
//     if (isValidDate) {
//       premiumType = convertStringToPremiumType(payment.productId);
//       if (premiumType == PremiumType.pack5) {
//         validPayments.add(payment);
//       }
//     }
//   }
//   return validPayments;
// }
//
// Future<List<Payment>> _getPayments() async {
//   try {
//     final doc = await FirebaseFirestore.instance
//         .collection(COLLECTION_USER_PREMIUM)
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .get();
//     final allData = doc.data() as Map<String, dynamic>;
//     final payments =
//         allData['payments'].map<Payment>((e) => Payment.fromJson(e)).toList();
//     return payments;
//   } catch (e) {
//     return [];
//   }
// }
//
// _saveConsumableToFirebase(PurchaseDetails purchaseDetails) async {
//   final bool existPayment =
//       await _checkIfExistPayment(purchaseDetails.purchaseID ?? '');
//   if (existPayment) {
//     return;
//   }
//   CollectionReference userPremium =
//       FirebaseFirestore.instance.collection(COLLECTION_USER_PREMIUM);
//   final Payment payment = Payment(
//     store: Platform.operatingSystem,
//     orderId: purchaseDetails.purchaseID ?? '',
//     productId: purchaseDetails.productID,
//     checkRenovation: true,
//     purchaseDate: dateTimeToTimeStamp(DateTime.now()).toString(),
//     expiryDate: addMonthsToDate(3),
//     programsUnlocked: [],
//   );
//
//   userPremium.doc(FirebaseAuth.instance.currentUser!.uid).set({
//     'payments': FieldValue.arrayUnion([payment.toJson()])
//   }, SetOptions(merge: true));
// }
//
// Future<bool> _checkIfExistPayment(String orderId) async {
//   final payments = await _getPayments();
//   final indexOfPayment =
//       payments.indexWhere((element) => element.orderId == orderId);
//   if (indexOfPayment == -1) {
//     return false;
//   }
//   return true;
// }
//
// _saveSubscriptionToFirebase(PurchaseDetails purchaseDetails) async {
//   final bool existPayment =
//       await _checkIfExistPayment(purchaseDetails.purchaseID ?? '');
//   if (existPayment) {
//     return;
//   }
//   CollectionReference userPremium =
//       FirebaseFirestore.instance.collection(COLLECTION_USER_PREMIUM);
//   final Payment payment = Payment(
//     store: Platform.operatingSystem,
//     orderId: purchaseDetails.purchaseID ?? '',
//     productId: purchaseDetails.productID,
//     checkRenovation: false,
//     programsUnlocked: [],
//     purchaseDate: dateTimeToTimeStamp(DateTime.now()).toString(),
//     expiryDate: addMonthsToDate(_calculateMonths(purchaseDetails)),
//   );
//   userPremium.doc(FirebaseAuth.instance.currentUser!.uid).set({
//     'payments': FieldValue.arrayUnion([payment.toJson()])
//   }, SetOptions(merge: true));
// }
//
// _calculateMonths(PurchaseDetails details) {
//   if (details.productID == storeKey1month) {
//     return 1;
//   }
//   if (details.productID == storeKey1year) {
//     return 12;
//   }
//   return 3;
// }
