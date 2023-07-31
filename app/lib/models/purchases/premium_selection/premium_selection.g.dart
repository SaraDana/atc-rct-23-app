// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premium_selection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PremiumSelection _$$_PremiumSelectionFromJson(Map<String, dynamic> json) =>
    _$_PremiumSelection(
      unlockId: json['unlockId'] as String,
      programId: json['programId'] as String,
      paymentId: json['paymentId'] as String,
      purchaseDate: DateTime.parse(json['purchaseDate'] as String),
      expiryDate: json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
    );

Map<String, dynamic> _$$_PremiumSelectionToJson(_$_PremiumSelection instance) =>
    <String, dynamic>{
      'unlockId': instance.unlockId,
      'programId': instance.programId,
      'paymentId': instance.paymentId,
      'purchaseDate': instance.purchaseDate.toIso8601String(),
      'expiryDate': instance.expiryDate?.toIso8601String(),
    };
