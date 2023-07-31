import 'package:app/generated/l10n.dart';

enum SeparatorType {
  TODAY,
  YESTERDAY,
  OLD,
  DEFAULT,
  ACTUAL,
}

// extension for get name
extension SeparatorTypeExtension on SeparatorType {
  String get nameUI {
    switch (this) {
      case SeparatorType.TODAY:
        return S.current.today;
      case SeparatorType.YESTERDAY:
        return S.current.yesterday;
      case SeparatorType.OLD:
        return S.current.old_activity;
      case SeparatorType.DEFAULT:
        return '';
      case SeparatorType.ACTUAL:
        return S.current.actual_activity;
    }
  }
}
