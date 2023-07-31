import 'package:app/data/dto/MixpanelQuestionStatement.dart';

class MixpanelQuestionWithInnerStatement {
  String? questionId;
  dynamic value;
  List<Map<String, dynamic>> innerStatements;

  MixpanelQuestionWithInnerStatement(
    this.questionId,
    this.value,
    this.innerStatements,
  );

  Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'value':value,
      'innerQuestions': innerStatements,
    };
  }
}
