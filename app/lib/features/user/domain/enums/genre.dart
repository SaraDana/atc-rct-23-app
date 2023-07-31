import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';

enum Genre {
  MAN,
  WOMAN,
  NO_BINARY,
  NO_ANSWER,
}

//list of initialProfileGenre
final List<Genre> profilesGenre = Genre.values.toList();

translateGenre(BuildContext context, Genre? item) {
  switch (item) {
    case Genre.MAN:
      return S.of(context).screenInitialProfilePage3Genre3Man;
    case Genre.WOMAN:
      return S.of(context).screenInitialProfilePage3Genre3Woman;
    case Genre.NO_BINARY:
      return S.of(context).screenInitialProfilePage3Genre3NoBinary;
    case Genre.NO_ANSWER:
      return S.of(context).screenInitialProfilePage3Genre3NoAnswer;
    default:
      return S.of(context).screenInitialProfilePage3Genre3NoAnswer;
  }
}

stringToGenre(String? item) {
  switch (item) {
    case "MAN":
      return Genre.MAN;
    case "WOMAN":
      return Genre.WOMAN;
    case "NO_BINARY":
      return Genre.NO_BINARY;
    case "NO_ANSWER":
      return Genre.NO_ANSWER;
  }
}
