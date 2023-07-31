// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PurchaseInfo _$$_PurchaseInfoFromJson(Map<String, dynamic> json) =>
    _$_PurchaseInfo(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      rawPrice: (json['rawPrice'] as num).toDouble(),
      currencyCode: json['currencyCode'] as String,
    );

Map<String, dynamic> _$$_PurchaseInfoToJson(_$_PurchaseInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'rawPrice': instance.rawPrice,
      'currencyCode': instance.currencyCode,
    };
