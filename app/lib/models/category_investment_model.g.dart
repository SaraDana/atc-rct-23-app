// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_investment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryInvestment _$CategoryInvestmentFromJson(Map json) => CategoryInvestment(
      category: json['category'] == null
          ? null
          : Category.fromJson(
              Map<String, dynamic>.from(json['category'] as Map)),
      points: json['points'] as int?,
      percentage: (json['percentage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CategoryInvestmentToJson(CategoryInvestment instance) =>
    <String, dynamic>{
      'category': instance.category?.toJson(),
      'points': instance.points,
      'percentage': instance.percentage,
    };
