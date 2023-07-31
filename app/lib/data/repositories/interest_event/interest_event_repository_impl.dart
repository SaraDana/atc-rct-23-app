import 'dart:convert';

import 'package:app/core/constants/api_constants.dart';
import 'package:app/core/enums/interested_event_enum.dart';
import 'package:app/core/error/failures.dart';
import 'package:app/core/extension/http_extension.dart';
import 'package:app/data/repositories/interest_event/interest_event_repository.dart';
import 'package:app/models/mood_question/question_statement_model.dart';
import 'package:dartz/dartz.dart';
import 'package:app/models/mood_question/questionnaires_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InterestedEventRepositoryImpl extends InterestedEventRepository {
  static const String _LOG = "InterestedEventRepositoryImpl";

  final eventOfInterestHappenedEndPoint =
      "${ApiConstants.BASE_URL}/${ApiConstants.eventOfInterestHappened}";

  @override
  Future<Either<Failure, bool>> eventOfInterestHappened(
      String? userId,
       String? email,
      EventOfInterestedType eventOfInterestedType,
      Map<String, String> details) async {
    try {
      Uri url =
          Uri.parse(eventOfInterestHappenedEndPoint).replace(queryParameters: {
        ParametersConstants.userId: userId,
         ParametersConstants.email: email,
      });
      Map<String, String> headers = {'Content-Type': 'application/json'};

      var requestBody = jsonEncode({
        "event": {"type": eventOfInterestedType.nameOfType, "details": details},
      });

      http.Response request =
          await http.post(url, body: requestBody, headers: headers);

      StatusCodeEnums statusCodeEnums =
          StatusCodeEnums.StatusController.statusCodeToEnum(request.statusCode);

      if (statusCodeEnums.isSuccess()) {
        return Right(true);
      } else {
        debugPrint(_LOG +
            " eventOfInterestHappened() request status code ${request.statusCode} }");
        return Left(ServiceError(message: request.body.toString()));
      }
    } catch (e) {
      debugPrint(_LOG + " eventOfInterestHappened() $e");
      return Left(ServiceError(message: e.toString()));
    }
  }
}
