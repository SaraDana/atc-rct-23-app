import 'package:app/models/purchases/constants.dart';

enum PremiumType {
  none,
  yearly,
  monthly,
  pack5,
}

PremiumType convertStringToPremiumType(String? value) {
  if (value == null) {
    return PremiumType.none;
  }
  switch (value) {
    case storeKey1year:
      return PremiumType.yearly;
    case storeKey1month:
      return PremiumType.monthly;
    case storeKeyConsumable:
      return PremiumType.pack5;
    default:
      return PremiumType.none;
  }
}

// create extension return different name
extension PremiumTypeExtension on PremiumType {
  String get uiName {
    switch (this) {
      case PremiumType.yearly:
        return 'Anual';
      case PremiumType.monthly:
        return 'Mensual';
      case PremiumType.pack5:
        return 'Pack 5 programas /3 meses';
      default:
        return 'Sin plan';
    }
  }
}
