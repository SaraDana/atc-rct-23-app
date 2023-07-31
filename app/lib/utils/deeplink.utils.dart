bool urlSegmentFollowsReferenceSegment(
    String urlSegment, String referenceSegment) {
  // case we accept anything in this segment
  if (referenceSegment.length > 0 && referenceSegment[0] == '?') {
    return true;
  }
  return urlSegment == referenceSegment;
}

bool urlFollowsPath(Uri url, String referencePath) {
  List<String> referencePathSegments = referencePath.split("/");
  List<String> urlPathSegments = url.pathSegments;
  if (url.path == referencePath) return true;
  if (urlPathSegments.length != referencePathSegments.length)
    return false; // both paths must have the same number of segments to be considered equal

  // we see if all the segments are matching for path and url
  for (int i = 0; i < referencePathSegments.length; i++) {
    String referenceSegment = referencePathSegments[i];
    String urlSegment = urlPathSegments[i];

    if (!urlSegmentFollowsReferenceSegment(urlSegment, referenceSegment))
      return false;
  }
  return true;
}

String? getParamFromUrlPath(Uri url, String referencePath, String paramName) {
  List<String> referencePathSegments = referencePath.split("/");
  List<String> urlPathSegments = url.pathSegments;

  String paramNameInReferenceSegment = "?" + paramName;

  for (int i = 0;
      i < referencePathSegments.length && i < urlPathSegments.length;
      i++) {
    if (referencePathSegments[i] == paramNameInReferenceSegment)
      return urlPathSegments[i];
  }
  return null;
}
