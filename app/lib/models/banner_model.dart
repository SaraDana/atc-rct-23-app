class CustomBannerScreen {
  int? order;
  String? title;
  String? description1;
  String? description2;
  String? button;
  String? input;
  String? inputHint;

  CustomBannerScreen(
      {this.order,
      this.title,
      this.description1,
      this.description2,
      this.button,
      this.input,
      this.inputHint});

  factory CustomBannerScreen.fromJson(Map<String, dynamic> json) =>
      CustomBannerScreen(
        order: json["order"],
        title: json["title"],
        description1: json["description1"],
        description2: json["description2"],
        button: json["button"],
        input: json["input"],
        inputHint: json["inputHint"],
      );

  Map<String, dynamic> toJson() => {
        "order": order,
        "title": title,
        "description1": description1,
        "description2": description2,
        "button": button,
        "input": input,
        "inputHint": inputHint,
      };
}

class CustomBanner {
  String? id;
  String? name;
  bool? isEnabled;
  bool? isDismissible;
  List<String>? displayInScreens;
  int? maxTimesDisplayed;
  int? sessionsBetweenDisplays;
  int? secondsBetweenDisplays;
  int? screenSecondsUntilDisplay;
  bool? canBeAnsweredMultipleTimes;
  List<CustomBannerScreen>? popupScreens;

  CustomBanner({
    this.id,
    this.name,
    this.isEnabled,
    this.isDismissible,
    this.displayInScreens,
    this.maxTimesDisplayed,
    this.sessionsBetweenDisplays,
    this.secondsBetweenDisplays,
    this.screenSecondsUntilDisplay,
    this.canBeAnsweredMultipleTimes,
    this.popupScreens,
  });

  factory CustomBanner.fromJson(Map<String, dynamic> json) => CustomBanner(
        id: json["id"],
        name: json["name"],
        isEnabled: json["isEnabled"] as bool?,
        isDismissible: json["isDismissible"] as bool?,
        displayInScreens:
            List<String>.from(json["displayInScreens"].map((x) => x)),
        maxTimesDisplayed: json["maxTimesDisplayed"],
        sessionsBetweenDisplays: json["sessionsBetweenDisplays"] as int?,
        secondsBetweenDisplays: json["secondsBetweenDisplays"] as int?,
        screenSecondsUntilDisplay: json["screenSecondsUntilDisplay"] as int?,
        canBeAnsweredMultipleTimes: json["canBeAnsweredMultipleTimes"] as bool?,
        popupScreens: List<CustomBannerScreen>.from(json["popupScreens"] == null
            ? []
            : json["popupScreens"].map((x) => CustomBannerScreen.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isEnabled": isEnabled,
        "isDismissible": isDismissible,
        "displayInScreens": List<dynamic>.from(displayInScreens!.map((x) => x)),
        "maxTimesDisplayed": maxTimesDisplayed,
        "sessionsBetweenDisplays": sessionsBetweenDisplays,
        "secondsBetweenDisplays": secondsBetweenDisplays,
        "screenSecondsUntilDisplay": screenSecondsUntilDisplay,
        "canBeAnsweredMultipleTimes": canBeAnsweredMultipleTimes,
        "popupScreens":
            List<dynamic>.from(popupScreens!.map((x) => x.toJson())),
      };

  CustomBanner copyWith({
    String? id,
    String? name,
    bool? isEnabled,
    bool? isDismissible,
    List<String>? displayInScreens,
    int? maxTimesDisplayed,
    int? sessionsBetweenDisplays,
    int? secondsBetweenDisplays,
    int? screenSecondsUntilDisplay,
    bool? canBeAnsweredMultipleTimes,
    List<CustomBannerScreen>? popupScreens,
  }) =>
      CustomBanner(
        id: id ?? this.id,
        name: name ?? this.name,
        isEnabled: isEnabled ?? this.isEnabled,
        isDismissible: isDismissible ?? this.isDismissible,
        displayInScreens: displayInScreens ?? this.displayInScreens,
        maxTimesDisplayed: maxTimesDisplayed ?? this.maxTimesDisplayed,
        sessionsBetweenDisplays:
            sessionsBetweenDisplays ?? this.sessionsBetweenDisplays,
        secondsBetweenDisplays:
            secondsBetweenDisplays ?? this.secondsBetweenDisplays,
        screenSecondsUntilDisplay:
            screenSecondsUntilDisplay ?? this.screenSecondsUntilDisplay,
        canBeAnsweredMultipleTimes:
            canBeAnsweredMultipleTimes ?? this.canBeAnsweredMultipleTimes,
        popupScreens: popupScreens ?? this.popupScreens,
      );

  CustomBannerScreen get(int order) {
    return popupScreens!.firstWhere((element) => element.order == order);
  }
}
