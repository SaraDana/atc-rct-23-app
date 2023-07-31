import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';

enum MotherMonths {
  MONTHS_1_LESS,
  MONTHS_1_3,
  MONTHS_3_6,
  MONTHS_6_9,
  MONTHS_9_12,
  MONTHS_12_24,
  MONTHS_24_36,
  MONTHS_36_MORE,
}

List<MotherMonths> get monthsList => MotherMonths.values;

String getMonthLabel(BuildContext context, MotherMonths motherMonths) {
  switch (motherMonths) {
    case MotherMonths.MONTHS_1_LESS:
      return S.of(context).screenInitialProfilePage4MotherMonths1_less;
    case MotherMonths.MONTHS_1_3:
      return S.of(context).screenInitialProfilePage4MotherMonths1_3;
    case MotherMonths.MONTHS_3_6:
      return S.of(context).screenInitialProfilePage4MotherMonths3_6;
    case MotherMonths.MONTHS_6_9:
      return S.of(context).screenInitialProfilePage4MotherMonths6_9;
    case MotherMonths.MONTHS_9_12:
      return S.of(context).screenInitialProfilePage4MotherMonths9_12;
    case MotherMonths.MONTHS_12_24:
      return S.of(context).screenInitialProfilePage4MotherMonths12_24;
    case MotherMonths.MONTHS_24_36:
      return S.of(context).screenInitialProfilePage4MotherMonths24_36;
    case MotherMonths.MONTHS_36_MORE:
      return S.of(context).screenInitialProfilePage4MotherMonths36_more;
  }
}

Map<MotherMonths, String> getMonthsLabels(BuildContext context) {
  return {
    MotherMonths.MONTHS_1_LESS:
        getMonthLabel(context, MotherMonths.MONTHS_1_LESS),
    MotherMonths.MONTHS_1_3: getMonthLabel(context, MotherMonths.MONTHS_1_3),
    MotherMonths.MONTHS_3_6: getMonthLabel(context, MotherMonths.MONTHS_3_6),
    MotherMonths.MONTHS_6_9: getMonthLabel(context, MotherMonths.MONTHS_6_9),
    MotherMonths.MONTHS_9_12: getMonthLabel(context, MotherMonths.MONTHS_9_12),
    MotherMonths.MONTHS_12_24:
        getMonthLabel(context, MotherMonths.MONTHS_12_24),
    MotherMonths.MONTHS_24_36:
        getMonthLabel(context, MotherMonths.MONTHS_24_36),
    MotherMonths.MONTHS_36_MORE:
        getMonthLabel(context, MotherMonths.MONTHS_36_MORE),
  };
}
