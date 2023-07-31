import 'package:app/models/category_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_investment_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class CategoryInvestment {
  Category? category;
  int? points;
  double? percentage;
  CategoryInvestment({
    this.category,
    this.points,
    this.percentage,
  });

  factory CategoryInvestment.fromJson(Map<String, dynamic> json) =>
      _$CategoryInvestmentFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryInvestmentToJson(this);
}
