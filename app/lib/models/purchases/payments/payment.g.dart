// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Payment _$$_PaymentFromJson(Map<String, dynamic> json) => _$_Payment(
      store: json['store'] as String,
      orderId: json['orderId'] as String,
      productId: json['productId'] as String,
      purchaseDate: json['purchaseDate'] as String,
      checkRenovation: json['checkRenovation'] as bool,
      expiryDate: json['expiryDate'] as int,
      hasBeenDisabled: json['hasBeenDisabled'] as bool?,
      unsubscribedAt: json['unsubscribedAt'] as String?,
      lastPaymentAt: json['lastPaymentAt'] as String?,
      programsUnlocked: (json['programsUnlocked'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_PaymentToJson(_$_Payment instance) =>
    <String, dynamic>{
      'store': instance.store,
      'orderId': instance.orderId,
      'productId': instance.productId,
      'purchaseDate': instance.purchaseDate,
      'checkRenovation': instance.checkRenovation,
      'expiryDate': instance.expiryDate,
      'hasBeenDisabled': instance.hasBeenDisabled,
      'unsubscribedAt': instance.unsubscribedAt,
      'lastPaymentAt': instance.lastPaymentAt,
      'programsUnlocked': instance.programsUnlocked,
    };
