final String hostDeepLinkFirebaseDana = 'health.dana.app';
final String hostDeepLinkFirebaseIosDana = 'com.athousandcolibris.dana';
final String hostDeepLinkDana = "dana.health";
final String hostDeepLinkDanaApp = "dana-app.com";
final String inAppLink = "dana";

final List<String> hostDeepLinksDana = [
  hostDeepLinkDanaApp,
  hostDeepLinkDana,
  hostDeepLinkFirebaseDana,
  hostDeepLinkFirebaseIosDana,
  inAppLink
];

final String publicationUrlPath = "publications/?id";
final String publicationUrlPathEmpty = "publications";

final String programUrlPath = "programs/?id";
final String programUrlPathEmpty = "programs";
final String slashPath = "/";

final String myProgressUrlPath = "myprogress/?index";
final String moodTrackerUrlPath = "moodtracker";
final String consultationUrlPath = "savia-consultation";

final List<String> deeplinkUrlPaths = [
  hostDeepLinkDanaApp,
  publicationUrlPath,
  myProgressUrlPath,
  moodTrackerUrlPath,
  consultationUrlPath,
  programUrlPath,
  programUrlPathEmpty,
  programUrlPathEmpty + slashPath,
  publicationUrlPathEmpty,
  publicationUrlPathEmpty + slashPath,
  slashPath,
  hostDeepLinkFirebaseDana,
  hostDeepLinkFirebaseDana + slashPath,
  hostDeepLinkFirebaseIosDana,
  hostDeepLinkFirebaseIosDana + slashPath,
  hostDeepLinkDana,
  hostDeepLinkDana + slashPath,
  inAppLink,
  inAppLink + slashPath,
];
