import 'package:app/cubits/category_investment/category_investment_cubit.dart';
import 'package:app/models/category_investment_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_investment_state.freezed.dart';

@freezed
class CategoryInvestmentState with _$CategoryInvestmentState {
  const factory CategoryInvestmentState({
    @Default([]) List<CategoryInvestment> categoryInvestmentList,
    @Default(CategoryInvestmentEnum.Idle)
        CategoryInvestmentEnum categoryInvestmentEnum,
    String? userId,
    String? email,
  }) = _CategoryInvestmentState;
}
