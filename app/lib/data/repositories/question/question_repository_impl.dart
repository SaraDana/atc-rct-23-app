import 'dart:convert';

import 'package:app/core/constants/api_constants.dart';
import 'package:app/core/error/failures.dart';
import 'package:app/core/extension/http_extension.dart';
import 'package:app/data/repositories/question/question_repository.dart';
import 'package:app/models/mood_question/question_statement_model.dart';
import 'package:app/models/show_questionnare_model.dart';
import 'package:dartz/dartz.dart';
import 'package:app/models/mood_question/questionnaires_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuestionRepositoryImpl extends QuestionRepository {
  //final _userRepository = FirebaseUserRepository();
  static const String _LOG = "QuestionRepositoryImpl";

  final startQuestionnaireEndPoint =
      "${ApiConstants.BASE_URL}/${ApiConstants.startQuestionnare}";

  final answerQuestionEndPoint =
      "${ApiConstants.BASE_URL}/${ApiConstants.answerQuestions}";

  final vitalityTrackerForTheDayEndPoint =
      "${ApiConstants.BASE_URL}/${ApiConstants.vitalityTrackerForTheDay}";

  final endQuestionnaireEndPoint =
      "${ApiConstants.BASE_URL}/${ApiConstants.endQuestionnaireEndPoint}";

  final getQuestionnaireIdToShowEndPoint =
      "${ApiConstants.BASE_URL}/${ApiConstants.getQuestionnaireIdToShow}";

  @override
  Future<Either<Failure, QuestionnairesModel>> startQuestionnare(
      String? userId, String? email, String countryCode,
      {String? questionnaireCode,
      String? questionnareId,
      String? reason}) async {
    try {
      Uri url = Uri.parse(startQuestionnaireEndPoint);

      if (questionnareId != null) {
        url = url.replace(queryParameters: {
          ParametersConstants.questionnaireId: questionnareId,
          ParametersConstants.userId: userId,
          ParametersConstants.email: email,
          ParametersConstants.countryCode: countryCode,
          ParametersConstants.reason: reason
        });
      } else {
        url = url.replace(queryParameters: {
          ParametersConstants.questionnaireCode: questionnaireCode,
          ParametersConstants.userId: userId,
          ParametersConstants.countryCode: countryCode,
          ParametersConstants.reason: reason
        });
      }

      http.Response request = await http.post(url);
      print("URL :$url");

      print(
          "$questionnareId - $questionnaireCode / startQuestionnare DATASI BURADA : ${request.body}");

      StatusCodeEnums statusCodeEnums =
          StatusCodeEnums.StatusController.statusCodeToEnum(request.statusCode);

      if (statusCodeEnums.isSuccess()) {
        dynamic data = json.decode(request.body);
        print("startQuestionnare DATASI BURADA : $data");
        QuestionnairesModel questionnairesModel =
            QuestionnairesModel.fromJson(data);
        return Right(questionnairesModel);
      } else {
        debugPrint(_LOG +
            " startQuestionnare() request status code ${request.statusCode} }");
        return Left(ServiceError(message: request.body.toString()));
      }
    } catch (e) {
      debugPrint(_LOG + " startQuestionnare() $e");
      return Left(ServiceError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, QuestionnairesModel>> answerQuestion(
      String? userQuestionnaireId, String? userId, String? email,
      {List<QuestionStatementModel?>? statement,
      required bool tryEndQuestionnaire}) async {
    try {
      Uri url = Uri.parse(answerQuestionEndPoint).replace(queryParameters: {
        ParametersConstants.userQuestionnaireId: userQuestionnaireId,
        ParametersConstants.userId: userId,
        ParametersConstants.email: email,
      });

      Map<String, String> headers = {'Content-Type': 'application/json'};

      List<Map<String, dynamic>> jsonList = statement!.map((data) {
        return data!.toJson();
      }).toList();

      var requestBody = jsonEncode(
        {'statements': jsonList, "tryEndQuestionnaire": tryEndQuestionnaire},
      );

      http.Response request =
          await http.post(url, headers: headers, body: requestBody);
      print("ANSWER QUESTİON REQUEST BODY : ${requestBody}");
      print("ANSWER QUESTİON RESPONSE BODY : ${request.body}");

      StatusCodeEnums statusCodeEnums =
          StatusCodeEnums.StatusController.statusCodeToEnum(request.statusCode);

      if (statusCodeEnums.isSuccess()) {
        dynamic data = json.decode(request.body);
        print("ANSWER isFinished : ${data["isFinished"]}");

        QuestionnairesModel questionnairesModel =
            QuestionnairesModel.fromJson(data);
        return Right(questionnairesModel);
      } else {
        debugPrint(_LOG +
            " answerQuestion() request status code ${request.statusCode} }");
        return Left(ServiceError(message: request.body.toString()));
      }
    } catch (e) {
      debugPrint(_LOG + " answerQuestion() $e");
      return Left(ServiceError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, QuestionnairesModel?>> vitalityTrackerForTheDay(
      String? userId, String? email) async {
    try {
      Uri url =
          Uri.parse(vitalityTrackerForTheDayEndPoint).replace(queryParameters: {
        ParametersConstants.userId: userId,
        ParametersConstants.email: email,
      });

      http.Response request = await http.post(url);

      StatusCodeEnums statusCodeEnums =
          StatusCodeEnums.StatusController.statusCodeToEnum(request.statusCode);

      if (statusCodeEnums.isSuccess()) {
        dynamic data = json.decode(request.body);

        QuestionnairesModel? questionnairesModel =
            QuestionnairesModel.fromJson(data);
        return Right(questionnairesModel);
      } else {
        debugPrint(_LOG +
            " vitalityTrackerForTheDay() request status code ${request.statusCode} }");
        return Left(ServiceError(message: request.body.toString()));
      }
    } catch (e) {
      debugPrint(_LOG + " vitalityTrackerForTheDay() $e");
      return Left(ServiceError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, QuestionnairesModel?>> endQuestionnaire(
      String? userQuestionnaireId, String? userId, String? email) async {
    try {
      Uri url = Uri.parse(endQuestionnaireEndPoint).replace(queryParameters: {
        ParametersConstants.userId: userId,
        ParametersConstants.userQuestionnaireId: userQuestionnaireId,
        ParametersConstants.email: email,
      });

      http.Response request = await http.post(url);

      print("endQuestionnaire Response Body :  ${request.body}");

      StatusCodeEnums statusCodeEnums =
          StatusCodeEnums.StatusController.statusCodeToEnum(request.statusCode);

      if (statusCodeEnums.isSuccess()) {
        dynamic data = json.decode(request.body);

        QuestionnairesModel? questionnairesModel =
            QuestionnairesModel.fromJson(data);
        return Right(questionnairesModel);
      } else {
        debugPrint(_LOG +
            " endQuestionnaire() request status code ${request.statusCode} }");
        return Left(ServiceError(message: request.body.toString()));
      }
    } catch (e) {
      debugPrint(_LOG + " endQuestionnaire() $e");
      return Left(ServiceError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShowQuestionnareModel>> getQuestionnaireIdToShow(
      String? userId, String? email) async {
    try {
      Uri url =
          Uri.parse(getQuestionnaireIdToShowEndPoint).replace(queryParameters: {
        ParametersConstants.userId: userId,
        ParametersConstants.email: email,
      });

      http.Response request = await http.post(url);

      StatusCodeEnums statusCodeEnums =
          StatusCodeEnums.StatusController.statusCodeToEnum(request.statusCode);

      if (statusCodeEnums.isSuccess()) {
        dynamic data = json.decode(request.body);
        print("getQuestionnaireIdToShow BODY : $data");

        return Right(ShowQuestionnareModel.fromJson(data));
      } else {
        debugPrint(_LOG +
            " getQuestionnaireIdToShow() request status code ${request.statusCode} }");
        return Left(ServiceError(message: request.body.toString()));
      }
    } catch (e) {
      debugPrint(_LOG + " getQuestionnaireIdToShow() $e");
      return Left(ServiceError(message: e.toString()));
    }
  }
}
