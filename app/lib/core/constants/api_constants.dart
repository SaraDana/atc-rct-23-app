abstract class ApiConstants {
  static String BASE_URL = "https://us-central1-dana-health.cloudfunctions.net";

  //endpoints
  static String startQuestionnare = "startQuestionnaire";
  static String answerQuestions = "answerQuestions";
  static String vitalityTrackerForTheDay = "vitalityTrackerForTheDay";
  static String invimaCategoryInvestment = "invimaCategoryInvestment";
  static String eventOfInterestHappened = "eventOfInterestHappened";
  static String endQuestionnaireEndPoint = "endQuestionnaire";
  static String getQuestionnaireIdToShow = "getQuestionnaireIdToShow";
}

abstract class ParametersConstants {
  // general
  static String userId = "userId";
  static String email = "email";

  // start questionnare
  static String questionnaireCode = "questionnaireCode";
  static String countryCode = "countryCode";
  static String reason = "reason";

  //answe questionare
  static String userQuestionnaireId = "userQuestionnaireId";
  static String questionnaireId = "questionnaireId";

  //questionStatement
  static String questionStatement = "questionStatement";

  //invimaCategoryInvestment
  static String fromDate = "fromDate";
  static String toDate = "toDate";
}

abstract class PropertyConstants {
  // midwife
  static String phoneNumber = "phoneNumber";
  static String email = "email";
  static String date = "date";
  static String courseName = "courseName";
  static String userName = "userName";
}
