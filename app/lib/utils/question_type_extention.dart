extension QuestionTypeExtension on String {
  convertQuestionTypeToEnum() {
    if (this == "MOOD") return QuestionTypeEnum.MOOD;
    if (this == "TEXT") return QuestionTypeEnum.TEXT;
    if (this == "MULTI") return QuestionTypeEnum.MULTI;
    if (this == "ACTION") return QuestionTypeEnum.ACTION;
    if (this == "YES_NO") return QuestionTypeEnum.YES_NO;
    if (this == "INVIMA_INFORMATION")
      return QuestionTypeEnum.INVIMA_INFORMATION;
  }
}

enum QuestionTypeEnum { MULTI, TEXT, MOOD, ACTION, YES_NO, INVIMA_INFORMATION }
