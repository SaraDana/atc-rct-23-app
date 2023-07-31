import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Category {
  String? categoryId;
  String? categoryName;
  Category({
    this.categoryId,
    this.categoryName,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
