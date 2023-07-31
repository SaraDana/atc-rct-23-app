import 'package:app/generated/l10n.dart';

enum GrapichType { EMOCIONES, VINCULOS }

extension GrapichTypeToString on GrapichType {
  convertGrapichTypeToString() {
    if (this == GrapichType.EMOCIONES) {
      return S().emocionesGrapichTypeText;
    }
    if (this == GrapichType.VINCULOS) {
      return S().vinculosGrapichTypeText;
    }
  }
}
