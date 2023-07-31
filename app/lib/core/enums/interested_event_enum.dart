enum EventOfInterestedType {
  SHOWN_QUESTIONNAIRE,
  FINISHED_UNIT,
  FINISHED_PROGRAM,
  LIKED_COMMENT,
  COMMENTED_PUBLICATION,
  LIKED_PUBLICATION,
  ANSWERED_MOOD,
  FINISHED_APP_SESSION,
  START_APP_SESSION,

  // no data
  NAVIGATE_MY_PROGRESS,
  NAVIGATE_COMMUNITY,
  NAVIGATE_MOODTRACKER,
  NAVIGATE_NOTIFICATION,
  NAVIGATE_FAVORITE_UNITS,
  NAVIGATE_MOODTRACKER_INFO,
  NAVIGATE_PROFILE,
  CLICK_SHARE_DANA,
  OPEN_NOTIFICATION,
}

// extension for EventOfInterestedType
extension EventOfInterestedTypeExtension on EventOfInterestedType {
  String get nameOfType {
    switch (this) {
      case EventOfInterestedType.LIKED_PUBLICATION:
        return 'LIKED_PUBLICATION';
      case EventOfInterestedType.SHOWN_QUESTIONNAIRE:
        return 'SHOWN_QUESTIONNAIRE';
      case EventOfInterestedType.FINISHED_UNIT:
        return 'FINISHED_UNIT';
      case EventOfInterestedType.ANSWERED_MOOD:
        return 'ANSWERED_MOOD';
      case EventOfInterestedType.FINISHED_PROGRAM:
        return 'FINISHED_PROGRAM';
      case EventOfInterestedType.COMMENTED_PUBLICATION:
        return 'COMMENTED_PUBLICATION';
      case EventOfInterestedType.LIKED_COMMENT:
        return 'LIKED_COMMENT';
      case EventOfInterestedType.FINISHED_APP_SESSION:
        return 'FINISHED_APP_SESSION';
      case EventOfInterestedType.START_APP_SESSION:
        return 'START_APP_SESSION';
      case EventOfInterestedType.NAVIGATE_MY_PROGRESS:
        return 'NAVIGATE_MY_PROGRESS';
      case EventOfInterestedType.NAVIGATE_COMMUNITY:
        return 'NAVIGATE_COMMUNITY';
      case EventOfInterestedType.NAVIGATE_MOODTRACKER:
        return 'NAVIGATE_MOODTRACKER';
      case EventOfInterestedType.NAVIGATE_NOTIFICATION:
        return 'NAVIGATE_NOTIFICATION';
      case EventOfInterestedType.NAVIGATE_FAVORITE_UNITS:
        return 'NAVIGATE_FAVORITE_UNITS';
      case EventOfInterestedType.NAVIGATE_MOODTRACKER_INFO:
        return 'NAVIGATE_MOODTRACKER_INFO';
      case EventOfInterestedType.NAVIGATE_PROFILE:
        return 'NAVIGATE_PROFILE';
      case EventOfInterestedType.CLICK_SHARE_DANA:
        return 'CLICK_SHARE_DANA';
      case EventOfInterestedType.OPEN_NOTIFICATION:
        return 'OPEN_NOTIFICATION';

      default:
        return 'Unknown';
    }
  }
}
