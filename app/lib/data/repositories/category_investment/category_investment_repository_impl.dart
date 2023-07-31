import 'dart:convert';

import 'package:app/core/constants/api_constants.dart';
import 'package:app/core/error/failures.dart';
import 'package:app/core/extension/http_extension.dart';
import 'package:app/models/category_investment_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'category_investment_repository.dart';

class CategoryInvestmentRepositoryImpl extends CategoryInvestmentRepository {
  static const String _LOG = "CategoryInvestmentRepositoryImpl";

  final invimaCategoryInvestmentEndPoint =
      "${ApiConstants.BASE_URL}/${ApiConstants.invimaCategoryInvestment}";

  @override
  Future<Either<Failure, List<CategoryInvestment>>> invimaCategoryInvestment(
      String? userId, String? email, DateTime fromDate, DateTime toDate) async {
    try {
      Uri url =
          Uri.parse(invimaCategoryInvestmentEndPoint).replace(queryParameters: {
        ParametersConstants.userId: userId,
        ParametersConstants.email: email,
        ParametersConstants.fromDate:
            Timestamp.fromDate(fromDate).seconds.toString(),
        ParametersConstants.toDate:
            Timestamp.fromDate(toDate).seconds.toString(),
      });
      http.Response request = await http.post(url);

      StatusCodeEnums statusCodeEnums =
          StatusCodeEnums.StatusController.statusCodeToEnum(request.statusCode);

      if (statusCodeEnums.isSuccess()) {
        List<CategoryInvestment> categories = [];
        dynamic data = json.decode(request.body);

        for (var singleCategory in data["categories"]) {
          categories.add(CategoryInvestment.fromJson(singleCategory));
        }

        return Right(categories);
      } else {
        debugPrint(_LOG +
            " invimaCategoryInvestment() request status code ${request.statusCode} }");
        return Left(ServiceError(message: request.body.toString()));
      }
    } catch (e) {
      debugPrint(_LOG + " invimaCategoryInvestment() $e");
      return Left(ServiceError(message: e.toString()));
    }
  }
}
