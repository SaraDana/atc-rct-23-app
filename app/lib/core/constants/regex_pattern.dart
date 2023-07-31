class RegexPattern {
  static final RegExp numbers = RegExp(
    r'^[0-9_-]*$',
  );

  static final RegExp letters = RegExp(
    r'^[a-zA-Z]*$',
    unicode: true,
    caseSensitive: false,
  );
  static final RegExp lettersWithSpace = RegExp(
    r'^([A-Z][a-z]+){1}( [A-Z][a-z]+)*$',
    unicode: true,
    caseSensitive: false,
  );

  static final RegExp name = RegExp(
    r'^(?=.{1,50}$)[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$',
    unicode: true,
    caseSensitive: false,
  );
  static final RegExp lastName = RegExp(
    r'^(?=.{1,50}$)[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$',
    unicode: true,
    caseSensitive: false,
  );

  // static final RegExp email = RegExp(
  //   r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  // );

  static final RegExp lettersSpacesAndNumbers = RegExp(
    r'^[\p{L}0-9 ]*[\p{L}0-9][\p{L}0-9 ]*$',
    unicode: true,
  );

  static final RegExp username = RegExp(
    r'^(?=.{4,20}$)(?!.*[_.]{2})[a-zA-Z0-9._]+$',
    unicode: true,
  );

  static final RegExp alias = RegExp(
    r'^(?=.{2,50}$)[\p{L}0-9 ]*[\p{L}0-9][\p{L}0-9 ]*$',
    unicode: true,
  );

  static final RegExp email = RegExp(
    r"^(?=.{2,50}$)[\p{L}0-9.\p{L}0-9.!#$%&'*+-/=?^_`{|}~]+@[\p{L}0-9]+\.[\p{L}]+",
    unicode: true,
    caseSensitive: true,
  );

  static final RegExp passwordAllowed = RegExp(
    r'^(?=.*\d)(?=.*[.,\/#!$%\^&\*;:{}=\-_`~()”“"…])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$',
    unicode: true,
    caseSensitive: true,
  );

  static final RegExp lettersSpacesNumbersAndHyphens = RegExp(
    r'^[\p{L}0-9 _-]*[\p{L}0-9][\p{L}0-9 _-]*$',
    unicode: true,
    caseSensitive: true,
  );

  static final RegExp nif = RegExp(
    r'^[0-9]{8}[TRWAGMYFPDXBNJZSQVHLCKET]$',
  );

  static final RegExp nie = RegExp(
    r'^[XYZ][0-9]{7}[TRWAGMYFPDXBNJZSQVHLCKET]$',
  );

  static final RegExp phone = RegExp(
    r'(^[0-9]{9}$)',
  );

  static final RegExp verificationPhoneCode = RegExp(
    r'(^[0-9]{4}$)',
  );

  static final RegExp postalCode = RegExp(
    r'^[a-zA-Z0-9]{2,20}$',
  );
}
