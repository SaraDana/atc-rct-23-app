import 'package:flutter/cupertino.dart';

import '../../generated/l10n.dart';

const appleApiKey = "appl_SxMGGfQncGJLtSjkomOtIUxelXb";
const googleApiKey = "goog_ILttrxILQBPUNJvDOxZUxAiqwdn";
const storeKeyConsumable = 'pack_5_programas';
const storeKey1month = 'premium_mensual';
const storeKey1year = 'premium_anual';

class PurchasesHelper {
  static String idToSubscriptionName(String id) {
    switch (id) {
      case storeKeyConsumable:
        return 'Tus programas';
      case storeKey1month:
        return 'Mensual';
      case storeKey1year:
        return 'Anual';
      default:
        return 'Premium mensual';
    }
  }

  static String idToTagName(String id) {
    switch (id) {
      case storeKeyConsumable:
        return 'new';
      case storeKey1month:
        return 'popular';
      case storeKey1year:
        return '-50%';
      default:
        return 'new';
    }
  }

  static String idToDescription(String id) {
    switch (id) {
      case storeKeyConsumable:
        return '5 programas / 3 meses';
      case storeKey1month:
        return '7 días de prueba gratis';
      case storeKey1year:
        return '14 días de prueba gratis';
      default:
        return 'new';
    }
  }

  static String idToOldPrice(String id) {
    switch (id) {
      case storeKeyConsumable:
        return '9,99€';
      case storeKey1month:
        return '29,99€';
      case storeKey1year:
        return '180€';
      default:
        return '';
    }
  }

  static List<String> getBenefits(String id, BuildContext context) {
    switch (id) {
      case storeKeyConsumable:
        return [
          S.of(context).premmiumBeneficit5Pack1,
        ];
      case storeKey1month:
        return [
          S.of(context).premiumMonthly1,
        ];
      case storeKey1year:
        return [
          S.of(context).premiumYearly1,
        ];
      default:
        return [];
    }
  }
}
