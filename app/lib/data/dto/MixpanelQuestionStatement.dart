class MixpanelQuestionStatement {
  String? questionId;
  dynamic value;

  MixpanelQuestionStatement(
    this.questionId,
    this.value,
  );

  Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'value': value,
    };
  }
}
