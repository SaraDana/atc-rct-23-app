import 'package:app/data/dto/MixpanelQuestionWithInnerStatement.dart';

import '../../models/mood_question/question_statement_model.dart';
import '../dto/MixpanelQuestionStatement.dart';

class QuestionStatementTransformer {
  static MixpanelQuestionStatement getMixpanelStatementFromStatementModel(
      QuestionStatementModel questionStatement) {
    return new MixpanelQuestionStatement(
        questionStatement.questionId, questionStatement.value);
  }

  static getMixpanelWithPositivelyStatementsFromStatementModel(
      List<QuestionStatementModel> statements) {
    List<String> positivelyAnsweredQuestions = [];

    for (QuestionStatementModel q in statements) {
      if (q.innerStatements != null) {
        positivelyAnsweredQuestions.add(q.questionId.toString());
        for (QuestionStatementModel statement in q.innerStatements!) {
          positivelyAnsweredQuestions.add(statement.questionId.toString());
        }
      } else {
        positivelyAnsweredQuestions.add(q.questionId.toString());
      }
    }

    return positivelyAnsweredQuestions;
  }

  static MixpanelQuestionWithInnerStatement
      getMixpanelWithInnerStatementFromStatementModel(String questionId,
          dynamic value, List<Map<String, dynamic>> innerStatements) {
    return new MixpanelQuestionWithInnerStatement(
        questionId, value, innerStatements);
  }

  static List<Map<String, dynamic>>
      getMixpanelStatementListFromStatementModelList(
          List<QuestionStatementModel> models) {
    List<Map<String, dynamic>> list = [];
    for (QuestionStatementModel q in models) {
      if (q.innerStatements != null) {
        List<Map<String, dynamic>> mixPanelInnerStaments = [];

        for (QuestionStatementModel iq in q.innerStatements!) {
          mixPanelInnerStaments
              .add(MixpanelQuestionStatement(iq.questionId, iq.value).toJson());
        }

        list.add(getMixpanelWithInnerStatementFromStatementModel(
                q.questionId ?? "", q.value, mixPanelInnerStaments)
            .toJson());
      } else {
        list.add(getMixpanelStatementFromStatementModel(q).toJson());
      }
    }

    return list;
  }

  static Map<String, dynamic>? getMixpanelSingleStatementFromStatementModel(
      QuestionStatementModel q) {
    try {
      if (q.innerStatements != null) {
        List<Map<String, dynamic>> mixPanelInnerStaments = [];

        for (QuestionStatementModel iq in q.innerStatements!) {
          mixPanelInnerStaments
              .add(MixpanelQuestionStatement(iq.questionId, iq.value).toJson());
        }
        return getMixpanelWithInnerStatementFromStatementModel(
                q.questionId ?? "", q.value, mixPanelInnerStaments)
            .toJson();
      } else {
        return getMixpanelStatementFromStatementModel(q).toJson();
      }
    } catch (e) {
      print(
          "There is a problem in getMixpanelSingleStatementFromStatementModel  $e");
    }
  }
}
