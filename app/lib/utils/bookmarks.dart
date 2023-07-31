import 'dart:convert';
import '../config/constants.dart';
import '../models/unit_bookmarked.dart';
import 'globals.dart';
import 'preferences.dart';

List<UnitBookmarked?> globalBookmarkedUnits = [];

bool checkIfUnitIsBookmarked(UnitWithImage? unitWithImage) {
  if (unitWithImage == null) {
    return false;
  }

  bool unitExists = false;
  List<UnitBookmarked?> bookmarkedUnits = PreferenceUtils.getUnitBookmarked();

  if (bookmarkedUnits.isNotEmpty) {
    final user = PreferenceUtils.getString(PREF_USER_EMAIL);
    final unitBookmarked = bookmarkedUnits
        .firstWhere((element) => element!.userId == user, orElse: () => null);
    if (unitBookmarked != null) {
      final UnitWithImage? unitFound = unitBookmarked.units!.firstWhere(
          (UnitWithImage? un) => un!.unit.id == unitWithImage.unit.id,
          orElse: () => null);

      unitExists = unitFound != null;
    }
  }

  return unitExists;
}

List<UnitWithImage?>? getUnitsForUser() {
  try {
    List<UnitBookmarked?> bookmarkedUnits = PreferenceUtils.getUnitBookmarked();
    final user = PreferenceUtils.getString(PREF_USER_EMAIL);

    final unitsBookmarkedForUser =
        bookmarkedUnits.firstWhere((element) => element!.userId == user);

    if (unitsBookmarkedForUser == null) {
      return [];
    }
    unitsBookmarkedForUser.units!
        .removeWhere((element) => element?.unit.programId == null);

    return unitsBookmarkedForUser.units;
  } catch (e) {
    return [];
  }
}

void setUnitBookmarked(UnitWithImage? unitWithImage) async {
  if (unitWithImage == null ||
      unitWithImage.unit.programId == null ||
      unitWithImage.unit.programId!.isEmpty) {
    return;
  }
  List<UnitBookmarked?> bookmarkedUnits = PreferenceUtils.getUnitBookmarked();

  final user = PreferenceUtils.getString(PREF_USER_EMAIL);
  if (user == null) {
    return;
  }

  if (bookmarkedUnits.isEmpty) {
    bookmarkedUnits.add(
      UnitBookmarked(
        userId: user,
        units: [unitWithImage],
      ),
    );
  } else {
    final UnitBookmarked? unitBookmarkedForUser = bookmarkedUnits.firstWhere(
        (UnitBookmarked? unitBookmarked) => unitBookmarked!.userId == user,
        orElse: (() => null));

    if (unitBookmarkedForUser == null) {
      // user does not exist in persisted object
      bookmarkedUnits.add(
        UnitBookmarked(
          userId: user,
          units: [unitWithImage],
        ),
      );
    } else {
      // user may exist but with 0 programs persisted
      final List<UnitWithImage?> unitsForUser =
          getUnitsForUser() as List<UnitWithImage?>;

      if (!unitsForUser.contains(unitWithImage.unit.id)) {
        unitsForUser.add(unitWithImage);
      }

      bookmarkedUnits
          .firstWhere(
              (UnitBookmarked? unitBookmarked) =>
                  unitBookmarked!.userId == user,
              orElse: (() => null))!
          .units = unitsForUser;
    }
  }


  PreferenceUtils.setUnitBookmarked(bookmarkedUnits);

  globalBookmarkedUnits = bookmarkedUnits;
  final newBookmarkedList = globalBookmarkedUnits.firstWhere(
      (UnitBookmarked? unitBookmarked) => unitBookmarked!.userId == user,
      orElse: (() => null))!;
  unitBookmarkController!.sink.add(newBookmarkedList.units);
}

void setUnitUnBookmarked(UnitWithImage? unitWithImage) {
  if (checkIfUnitIsBookmarked(unitWithImage)) {
    List<UnitBookmarked?> bookmarkedUnits = PreferenceUtils.getUnitBookmarked();
    final user = PreferenceUtils.getString(PREF_USER_EMAIL);
    bookmarkedUnits
        .firstWhere(
            (UnitBookmarked? unitBookmarked) => unitBookmarked!.userId == user,
            orElse: (() => null))!
        .units!
        .removeWhere(
            (UnitWithImage? un) => un!.unit.id == unitWithImage!.unit.id);

    PreferenceUtils.setUnitBookmarked(bookmarkedUnits);
    globalBookmarkedUnits = bookmarkedUnits;
    final newBookmarkedList = globalBookmarkedUnits.firstWhere(
        (UnitBookmarked? unitBookmarked) => unitBookmarked!.userId == user,
        orElse: (() => null))!;
    unitBookmarkController!.sink.add(newBookmarkedList.units);
  }
}
