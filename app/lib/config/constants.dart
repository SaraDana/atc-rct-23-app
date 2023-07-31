// Paths
import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';

const String ASSETS_IMAGES = 'assets/images';

// Firestore Collections
const String COLLECTION_USERS = 'users';
const String COLLECTION_DELETE_USERS = 'askedForAccountDeletion';
const String COLLECTION_UNITS = 'units';
const String COLLECTION_COLLECTIONS = 'collections';
const String COLLECTION_PROGRAMS = 'programs';
const String COLLECTION_USER_MOOD = 'user_moods';
const String COLLECTION_USER_MOOD_MOODS = 'moods';
const String COLLECTION_USER_PROGRAMS = 'user_programs';
const String COLLECTION_USER_UNITS = 'user_units';
const String COLLECTION_APP_CONFIG = 'app_config';
const String COLLECTION_APP_SECTION = 'app_section';
const String COLLECTION_SOCIAL_PUBLICATION = 'social_publications';
const String COLLECTION_SOCIAL_SECTIONS = 'social_sections';
const String COLLECTION_COMMENTS = 'comments';
const String COLLECTION_SUBCOMMENTS = 'subcomments';
const String COLLECTION_ANSWERS = 'poll_answers';
const String COLLECTION_SELECTIONS = 'selections';
const String COLLECTION_TAGS = 'tags';
const String COLLECTION_SOCIAL_CONFIG = 'social_config';
const String COLLECTION_USER_ASKING_FOR_INFO = 'users_asking_for_info';

// Firestore constant documents
const String DOCUMENT_ID_HOME_CONFIG = 'home_config';

// Firestore document attributes
const String DOCUMENT_USER_PROGRAM_USER_ID = 'userId';
const String DOCUMENT_USER_PROGRAM_PROGRAM_ID = 'programId';
const String DOCUMENT_USER_UNITS_USER_ID = 'userId';
const String DOCUMENT_USER_UNITS_PROGRAM_ID = 'programId';
const String DOCUMENT_USER_UNITS_UNIT_ID = 'unitId';
const String DOCUMENT_USER_MOOD_COMMENT = 'comment';
const String DOCUMENT_HOME_CONFIG_TAG_REFERENCES = 'tagsRefs';

// Preferences
const String PREF_IS_PREMIUM = 'isPremium';
const String PREF_MOOD_QUESTION_DATE = 'moodQuestionDate';
const String PREF_USER_EMAIL = 'userEmail';
const String PREF_USER_NAME = 'userName';
const String PREF_USER_LOGGED_IN = 'userLoggedIn';
const String PREF_FIRST_PROFILE_QUESTION = 'firstProfileQuestion';
const String UNIT_BOOKMARKED = 'UNIT_BOOKMARKED';
const String PREF_TIMES_DISPLAYED = 'timesDisplayed';
const String PREF_SESSIONS = 'sessions';
const String PREF_LAST_DISPLAY = 'lastDisplay';
const String PREF_ANSWERED = 'answered';



// Roles
const String APP_ROLE_FREE = 'FREE';
const String APP_ROLE_PREMIUM = 'PREMIUM';
const String AUTO_PLAY = 'AUTO_PLAY';
const String NOTIFICATIONS = 'NOTIFICATIONS';
const String ONE_SIGNAL_ID = 'one_signal_ids';

const String NUMBER_OF_TIMES_IN_APP_REVIEW_SHOWN =
    'NUMBER_OF_TIMES_IN_APP_REVIEW_SHOWN';
const String NUMBER_OF_NOTIFICATIONS = 'NUMBER_OF_NOTIFICATIONS';

// Evaluation Program
enum EvaluationProgramType { INITIAL_EVALUATION, FINAL_EVALUATION }

// Program Result
enum ProgramResult { IN_PROGRESS, FINISHED }

// Program Result
enum AppBarType { TITLE_BACK, ONLY_CLOSE }

//Store Links

const String ANDROID_STORE_URL =
    'https://play.google.com/store/account/subscriptions';
const String IOS_STORE_URL = 'https://apps.apple.com/account/subscriptions';

enum UserNavigationEvents {
  MoodTrackerDialogReturnHome,
  MoodTrackerDialogReturnTracking,
  MoodTrackerDialogReturnCommunity,
  MoodTrackerDialogReturnBack,
  ProgramFinished,
  ShowPremiumDialog,
  ProgramRated
}

enum InitialProfileMoment {
  LOOKING_TO_GET_PREGNANT,
  I_AM_PREGNANT,
  I_AM_ALREADY_MOTHER,
  I_AM_THE_MOTHERS_PARTNER,
  I_AM_A_HEALTH_PROFESSIONAL,
  NONE_OF_THE_ABOVE
}

initialProfileMomentToString(InitialProfileMoment? item) {
  switch (item) {
    case InitialProfileMoment.LOOKING_TO_GET_PREGNANT:
      return "LOOKING_TO_GET_PREGNANT";
    case InitialProfileMoment.I_AM_PREGNANT:
      return "I_AM_PREGNANT";
    case InitialProfileMoment.I_AM_ALREADY_MOTHER:
      return "I_AM_ALREADY_MOTHER";
    case InitialProfileMoment.I_AM_THE_MOTHERS_PARTNER:
      return "I_AM_THE_MOTHERS_PARTNER";
    case InitialProfileMoment.I_AM_A_HEALTH_PROFESSIONAL:
      return "I_AM_A_HEALTH_PROFESSIONAL";
    case InitialProfileMoment.NONE_OF_THE_ABOVE:
      return "NONE_OF_THE_ABOVE";
    default:
      return "NONE_OF_THE_ABOVE";
  }
}

initialProfileMomentToStringTraduction(
    BuildContext context, InitialProfileMoment? item) {
  switch (item) {
    case InitialProfileMoment.LOOKING_TO_GET_PREGNANT:
      return S.of(context).screenInitialProfilePage4LookingToGetPregnant;
    case InitialProfileMoment.I_AM_PREGNANT:
      return S.of(context).screenInitialProfilePage4MomentImPregnant;
    case InitialProfileMoment.I_AM_ALREADY_MOTHER:
      return S.of(context).screenInitialProfilePage4MomentImAlreadyMother;
    case InitialProfileMoment.I_AM_THE_MOTHERS_PARTNER:
      return S.of(context).screenInitialProfilePage4MomentImTheMothersPartner;
    case InitialProfileMoment.I_AM_A_HEALTH_PROFESSIONAL:
      return S.of(context).screenInitialProfilePage4MomentImAHealthProfessional;
    case InitialProfileMoment.NONE_OF_THE_ABOVE:
      return S.of(context).screenInitialProfilePage4MomentNoneOfTheAbove;
    default:
      return S.of(context).screenInitialProfilePage4MomentNoneOfTheAbove;
  }
}

stringToInitialProfileMoment(String? item) {
  if (item == null) return InitialProfileMoment.NONE_OF_THE_ABOVE;
  switch (item) {
    case "LOOKING_TO_GET_PREGNANT":
      return InitialProfileMoment.LOOKING_TO_GET_PREGNANT;
    case "I_AM_PREGNANT":
      return InitialProfileMoment.I_AM_PREGNANT;
    case "I_AM_ALREADY_MOTHER":
      return InitialProfileMoment.I_AM_ALREADY_MOTHER;
    case "I_AM_THE_MOTHERS_PARTNER":
      return InitialProfileMoment.I_AM_THE_MOTHERS_PARTNER;
    case "I_AM_A_HEALTH_PROFESSIONAL":
      return InitialProfileMoment.I_AM_A_HEALTH_PROFESSIONAL;
    case "NONE_OF_THE_ABOVE":
      return InitialProfileMoment.NONE_OF_THE_ABOVE;
    case "":
      return InitialProfileMoment.NONE_OF_THE_ABOVE;
  }
}

enum InitialProfileMotherMonths {
  MONTHS_1_LESS,
  MONTHS_1_3,
  MONTHS_3_6,
  MONTHS_6_9,
  MONTHS_9_12,
  MONTHS_12_24,
  MONTHS_24_36,
  MONTHS_36_MORE
}

// ignore: non_constant_identifier_names
initialProfileMotherMonthsToString(InitialProfileMotherMonths? item) {
  switch (item) {
    case InitialProfileMotherMonths.MONTHS_1_LESS:
      return "MONTHS_1_LESS";
    case InitialProfileMotherMonths.MONTHS_1_3:
      return "MONTHS_1_3";
    case InitialProfileMotherMonths.MONTHS_3_6:
      return "MONTHS_3_6";
    case InitialProfileMotherMonths.MONTHS_6_9:
      return "MONTHS_6_9";
    case InitialProfileMotherMonths.MONTHS_9_12:
      return "MONTHS_9_12";
    case InitialProfileMotherMonths.MONTHS_12_24:
      return "MONTHS_12_24";
    case InitialProfileMotherMonths.MONTHS_24_36:
      return "MONTHS_24_36";
    case InitialProfileMotherMonths.MONTHS_36_MORE:
      return "MONTHS_36_MORE";
    default:
      return "MONTHS_36_MORE";
  }
}

initialProfileMotherMonthsToStringTraduction(
    BuildContext context, InitialProfileMotherMonths? item) {
  switch (item) {
    case InitialProfileMotherMonths.MONTHS_1_LESS:
      return S.of(context).screenInitialProfilePage4MotherMonths1_less;
    case InitialProfileMotherMonths.MONTHS_1_3:
      return S.of(context).screenInitialProfilePage4MotherMonths1_3;
    case InitialProfileMotherMonths.MONTHS_3_6:
      return S.of(context).screenInitialProfilePage4MotherMonths3_6;
    case InitialProfileMotherMonths.MONTHS_6_9:
      return S.of(context).screenInitialProfilePage4MotherMonths6_9;
    case InitialProfileMotherMonths.MONTHS_9_12:
      return S.of(context).screenInitialProfilePage4MotherMonths9_12;
    case InitialProfileMotherMonths.MONTHS_12_24:
      return S.of(context).screenInitialProfilePage4MotherMonths12_24;
    case InitialProfileMotherMonths.MONTHS_24_36:
      return S.of(context).screenInitialProfilePage4MotherMonths24_36;
    case InitialProfileMotherMonths.MONTHS_36_MORE:
      return S.of(context).screenInitialProfilePage4MotherMonths36_more;
    default:
      return S.of(context).screenInitialProfilePage4MotherMonths36_more;
  }
}

stringToInitialMotherMonts(String? item) {
  switch (item) {
    case "MONTHS_1_LESS":
      return InitialProfileMotherMonths.MONTHS_1_LESS;
    case "MONTHS_1_3":
      return InitialProfileMotherMonths.MONTHS_1_3;
    case "MONTHS_3_6":
      return InitialProfileMotherMonths.MONTHS_3_6;
    case "MONTHS_6_9":
      return InitialProfileMotherMonths.MONTHS_6_9;
    case "MONTHS_9_12":
      return InitialProfileMotherMonths.MONTHS_9_12;
    case "MONTHS_12_24":
      return InitialProfileMotherMonths.MONTHS_12_24;
    case "MONTHS_24_36":
      return InitialProfileMotherMonths.MONTHS_24_36;
    case "MONTHS_36_MORE":
      return InitialProfileMotherMonths.MONTHS_36_MORE;
  }
}

enum InitialProfileMotherExperience {
  VERY_GOOD_EXPERIENCE,
  GOOD_EXPERIENCE,
  HARD_EXPERIENCE,
  VERY_HARD_EXPERIENCE
}

// ignore: non_constant_identifier_names
InitialProfileMotherExperienceToString(InitialProfileMotherExperience? item) {
  switch (item) {
    case InitialProfileMotherExperience.VERY_GOOD_EXPERIENCE:
      return "VERY_GOOD_EXPERIENCE";
    case InitialProfileMotherExperience.GOOD_EXPERIENCE:
      return "GOOD_EXPERIENCE";
    case InitialProfileMotherExperience.HARD_EXPERIENCE:
      return "HARD_EXPERIENCE";
    case InitialProfileMotherExperience.VERY_HARD_EXPERIENCE:
      return "VERY_HARD_EXPERIENCE";
    default:
      return "VERY_HARD_EXPERIENCE";
  }
}

stringToInitialProfileMotherExperience(String item) {
  switch (item) {
    case "VERY_GOOD_EXPERIENCE":
      return InitialProfileMotherExperience.VERY_GOOD_EXPERIENCE;
    case "GOOD_EXPERIENCE":
      return InitialProfileMotherExperience.GOOD_EXPERIENCE;
    case "HARD_EXPERIENCE":
      return InitialProfileMotherExperience.HARD_EXPERIENCE;
    case "VERY_HARD_EXPERIENCE":
      return InitialProfileMotherExperience.VERY_HARD_EXPERIENCE;
  }
}

enum InitialProfileHelp {
  IMPROVE_MY_MOOD,
  FEEL_BETTER_PHYSICALLY,
  SHARE_EXPERIENCES,
  CONSULT_HEALTH_PROFESSIONALS,
  INFORMATION_ABOUT_MATERNITY,
  OTHERS,

  INFORMATION_OF_INTEREST,
  FEEL_BETTER,
  RELATIONSHIPS_WITH_OTHER_MOTHERS,
  GET_SUPPORT,
  ENTERTAINMENT,
  DONT_KNOW
}

// ignore: non_constant_identifier_names
InitialProfileHelpToString(InitialProfileHelp item) {
  switch (item) {
    case InitialProfileHelp.IMPROVE_MY_MOOD:
      return "IMPROVE_MY_MOOD";
    case InitialProfileHelp.FEEL_BETTER_PHYSICALLY:
      return "FEEL_BETTER_PHYSICALLY";
    case InitialProfileHelp.SHARE_EXPERIENCES:
      return "SHARE_EXPERIENCES";
    case InitialProfileHelp.CONSULT_HEALTH_PROFESSIONALS:
      return "CONSULT_HEALTH_PROFESSIONALS";
    case InitialProfileHelp.INFORMATION_ABOUT_MATERNITY:
      return "INFORMATION_ABOUT_MATERNITY";
    case InitialProfileHelp.OTHERS:
      return "OTHERS";
    case InitialProfileHelp.INFORMATION_OF_INTEREST:
      return "INFORMATION_OF_INTEREST";
    case InitialProfileHelp.FEEL_BETTER:
      return "FEEL_BETTER";
    case InitialProfileHelp.RELATIONSHIPS_WITH_OTHER_MOTHERS:
      return "RELATIONSHIPS_WITH_OTHER_MOTHERS";
    case InitialProfileHelp.GET_SUPPORT:
      return "GET_SUPPORT";
    case InitialProfileHelp.ENTERTAINMENT:
      return "ENTERTAINMENT";
    case InitialProfileHelp.DONT_KNOW:
      return "DONT_KNOW";
  }
}

stringToInitialProfileHelp(String? item) {
  switch (item) {
    case "IMPROVE_MY_MOOD":
      return InitialProfileHelp.IMPROVE_MY_MOOD;
    case "FEEL_BETTER_PHYSICALLY":
      return InitialProfileHelp.FEEL_BETTER_PHYSICALLY;
    case "SHARE_EXPERIENCES":
      return InitialProfileHelp.SHARE_EXPERIENCES;
    case "CONSULT_HEALTH_PROFESSIONALS":
      return InitialProfileHelp.CONSULT_HEALTH_PROFESSIONALS;
    case "INFORMATION_ABOUT_MATERNITY":
      return InitialProfileHelp.INFORMATION_ABOUT_MATERNITY;
    case "OTHERS":
      return InitialProfileHelp.OTHERS;
    case "INFORMATION_OF_INTEREST":
      return InitialProfileHelp.INFORMATION_OF_INTEREST;
    case "FEEL_BETTER":
      return InitialProfileHelp.FEEL_BETTER;
    case "RELATIONSHIPS_WITH_OTHER_MOTHERS":
      return InitialProfileHelp.RELATIONSHIPS_WITH_OTHER_MOTHERS;
    case "GET_SUPPORT":
      return InitialProfileHelp.GET_SUPPORT;
    case "ENTERTAINMENT":
      return InitialProfileHelp.ENTERTAINMENT;
    case "DONT_KNOW":
      return InitialProfileHelp.DONT_KNOW;
  }
}

enum InitialProfileContentType {
  EMOTIONAL_MANAGEMENT,
  YOGA,
  MINDFULNESS,
  SPORT,
  GENERAL_INFORMATION,
  SCIENTIFIC_INFORMATION
}

// ignore: non_constant_identifier_names
InitialProfileContentTypeToString(InitialProfileContentType item) {
  switch (item) {
    case InitialProfileContentType.EMOTIONAL_MANAGEMENT:
      return "EMOTIONAL_MANAGEMENT";
    case InitialProfileContentType.YOGA:
      return "YOGA";
    case InitialProfileContentType.MINDFULNESS:
      return "MINDFULNESS";
    case InitialProfileContentType.SPORT:
      return "SPORT";
    case InitialProfileContentType.GENERAL_INFORMATION:
      return "GENERAL_INFORMATION";
    case InitialProfileContentType.SCIENTIFIC_INFORMATION:
      return "SCIENTIFIC_INFORMATION";
  }
}

stringToInitialProfileContentType(String? item) {
  switch (item) {
    case "EMOTIONAL_MANAGEMENT":
      return InitialProfileContentType.EMOTIONAL_MANAGEMENT;
    case "YOGA":
      return InitialProfileContentType.YOGA;
    case "MINDFULNESS":
      return InitialProfileContentType.MINDFULNESS;
    case "SPORT":
      return InitialProfileContentType.SPORT;
    case "GENERAL_INFORMATION":
      return InitialProfileContentType.GENERAL_INFORMATION;
    case "SCIENTIFIC_INFORMATION":
      return InitialProfileContentType.SCIENTIFIC_INFORMATION;
  }
}

enum InitialProfileEmotions {
  ANXIETY,
  AFRAID,
  FAULT,
  LONELINESS,
  SADNESS,
  SELF_CARE,
  BABY_LINK,
  SLEEP_QUALITY,
  RELATIONSHIP,
  NUTRITION,
  OTHERS
}

// ignore: non_constant_identifier_names
InitialProfileEmotionsToString(InitialProfileEmotions item) {
  switch (item) {
    case InitialProfileEmotions.ANXIETY:
      return "ANXIETY";
    case InitialProfileEmotions.AFRAID:
      return "AFRAID";
    case InitialProfileEmotions.FAULT:
      return "FAULT";
    case InitialProfileEmotions.LONELINESS:
      return "LONELINESS";
    case InitialProfileEmotions.SADNESS:
      return "SADNESS";
    case InitialProfileEmotions.BABY_LINK:
      return "BABY_LINK";
    case InitialProfileEmotions.SLEEP_QUALITY:
      return "SLEEP_QUALITY";
    case InitialProfileEmotions.RELATIONSHIP:
      return "RELATIONSHIP";
    case InitialProfileEmotions.SELF_CARE:
      return "SELF_CARE";
    case InitialProfileEmotions.NUTRITION:
      return "NUTRITION";
    case InitialProfileEmotions.OTHERS:
      return "OTHERS";
  }
}

stringToInitialProfileEmotions(String? item) {
  switch (item) {
    case "ANXIETY":
      return InitialProfileEmotions.ANXIETY;
    case "AFRAID":
      return InitialProfileEmotions.AFRAID;
    case "FAULT":
      return InitialProfileEmotions.FAULT;
    case "LONELINESS":
      return InitialProfileEmotions.LONELINESS;
    case "SADNESS":
      return InitialProfileEmotions.SADNESS;
    case "BABY_LINK":
      return InitialProfileEmotions.BABY_LINK;
    case "SLEEP_QUALITY":
      return InitialProfileEmotions.SLEEP_QUALITY;
    case "RELATIONSHIP":
      return InitialProfileEmotions.RELATIONSHIP;
    case "SELF_CARE":
      return InitialProfileEmotions.SELF_CARE;
    case "NUTRITION":
      return InitialProfileEmotions.NUTRITION;
    case "OTHERS":
      return InitialProfileEmotions.OTHERS;
  }
}

enum InitialProfilePsychologicalTherapy {
  NEVER_AND_NOT_INTERESTED,
  NO_AND_INTERESTED,
  YES_PREVIOUSLY,
  YES_CURRENTLY
}

initialProfilePsychologicalTherapyToString(
    InitialProfilePsychologicalTherapy? item) {
  switch (item) {
    case InitialProfilePsychologicalTherapy.NEVER_AND_NOT_INTERESTED:
      return "NEVER_AND_NOT_INTERESTED";
    case InitialProfilePsychologicalTherapy.NO_AND_INTERESTED:
      return "NO_AND_INTERESTED";
    case InitialProfilePsychologicalTherapy.YES_PREVIOUSLY:
      return "YES_PREVIOUSLY";
    case InitialProfilePsychologicalTherapy.YES_CURRENTLY:
      return "YES_CURRENTLY";
    default:
      return "YES_CURRENTLY";
  }
}

stringToInitialPsychologicalTherapy(String? item) {
  switch (item) {
    case "NEVER_AND_NOT_INTERESTED":
      return InitialProfilePsychologicalTherapy.NEVER_AND_NOT_INTERESTED;
    case "NO_AND_INTERESTED":
      return InitialProfilePsychologicalTherapy.NO_AND_INTERESTED;
    case "YES_PREVIOUSLY":
      return InitialProfilePsychologicalTherapy.YES_PREVIOUSLY;
    case "YES_CURRENTLY":
      return InitialProfilePsychologicalTherapy.YES_CURRENTLY;
  }
}

enum InitialProfileSupportGroup {
  NEVER_AND_NOT_INTERESTED,
  NO_AND_INTERESTED,
  YES_PREVIOUSLY,
  YES_CURRENTLY
}

initialProfileSupportGroupToString(InitialProfileSupportGroup? item) {
  switch (item) {
    case InitialProfileSupportGroup.NEVER_AND_NOT_INTERESTED:
      return "NEVER_AND_NOT_INTERESTED";
    case InitialProfileSupportGroup.NO_AND_INTERESTED:
      return "NO_AND_INTERESTED";
    case InitialProfileSupportGroup.YES_PREVIOUSLY:
      return "YES_PREVIOUSLY";
    case InitialProfileSupportGroup.YES_CURRENTLY:
      return "YES_CURRENTLY";
    default:
      return "YES_CURRENTLY";
  }
}

stringToInitialSupportGroup(String? item) {
  switch (item) {
    case "NEVER_AND_NOT_INTERESTED":
      return InitialProfileSupportGroup.NEVER_AND_NOT_INTERESTED;
    case "NO_AND_INTERESTED":
      return InitialProfileSupportGroup.NO_AND_INTERESTED;
    case "YES_PREVIOUSLY":
      return InitialProfileSupportGroup.YES_PREVIOUSLY;
    case "YES_CURRENTLY":
      return InitialProfileSupportGroup.YES_CURRENTLY;
  }
}

enum ProfileLinks {
  WELCOME,
  HELP,
  COLLABORATORS,
  PRIVACITY,
  TERMS_AND_CONDITIONS,
  SCIENCE_BEHIND_DANA,
  COOKIES,
  MY_FAVOURITES,
  MY_PROGRESS,
  ACCOUNT,
  HISTORY,
  SUBSCRIPTIONS,
  UNSUBSCRIBE,
  PLANDEPAGO
  // String to enum
}

ProfileLinks profileLinkFromString(String? key) {
  return ProfileLinks.values.firstWhere((e) => e.name == key);
}

String profileMomentToTagId(InitialProfileMoment profileMoment) {
  if (profileMoment == InitialProfileMoment.LOOKING_TO_GET_PREGNANT) {
  } else if (profileMoment == InitialProfileMoment.I_AM_PREGNANT) {
    return '0bz8Ik5yguUGN16sWAWA';
  } else if (profileMoment == InitialProfileMoment.I_AM_ALREADY_MOTHER) {
    return 'fxvJ2A2DPNYvWGndgbxx';
  } else if (profileMoment == InitialProfileMoment.I_AM_THE_MOTHERS_PARTNER) {
  } else if (profileMoment == InitialProfileMoment.I_AM_A_HEALTH_PROFESSIONAL) {
  } else if (profileMoment == InitialProfileMoment.NONE_OF_THE_ABOVE) {}
  return '';
}
