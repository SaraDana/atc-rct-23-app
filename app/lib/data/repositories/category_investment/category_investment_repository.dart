import 'package:app/core/error/failures.dart';
import 'package:app/models/category_investment_model.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryInvestmentRepository {
  Future<Either<Failure, List<CategoryInvestment>>> invimaCategoryInvestment(
      String? userId,String? email, DateTime fromDate, DateTime toDate);
}
