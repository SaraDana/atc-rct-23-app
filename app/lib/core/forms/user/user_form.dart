import 'package:app/core/constants/regex_pattern.dart';
import 'package:formz/formz.dart';

enum EmailValidationError { invalid }

///Email Form
class EmailForm extends FormzInput<String, EmailValidationError> {
  const EmailForm.pure() : super.pure('');

  const EmailForm.dirty([String value = '']) : super.dirty(value);
  static final RegExp _emailRegExp = RegexPattern.email;

  @override
  EmailValidationError? validator(String? value) {
    return _emailRegExp.hasMatch(value ?? '')
        ? null
        : EmailValidationError.invalid;
  }
}

enum PasswordValidationError { invalid }

///Password Form
class PasswordForm extends FormzInput<String, PasswordValidationError> {
  const PasswordForm.pure() : super.pure('');

  const PasswordForm.dirty([String value = '']) : super.dirty(value);

  //static final _passwordRegExp = RegexPattern.passwordAllowed;

  @override
  PasswordValidationError? validator(String? value) {
    return value != null && value.length >= 6
        ? null
        : PasswordValidationError.invalid;
  }
}

enum FirstNameValidationError { invalid }

///FirstName Form
class FirstNameForm extends FormzInput<String, FirstNameValidationError> {
  const FirstNameForm.pure() : super.pure('');

  const FirstNameForm.dirty([String value = '']) : super.dirty(value);

  static final RegExp _nameRegExp = RegexPattern.name;

  @override
  FirstNameValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return FirstNameValidationError.invalid;
    }
    return null;
  }
}

enum ChildCountValidationError { invalid }

class ChildCountForm extends FormzInput<int?, ChildCountValidationError> {
  const ChildCountForm.pure() : super.pure(null);

  const ChildCountForm.dirty([int? value = null]) : super.dirty(value);

  @override
  ChildCountValidationError? validator(int? value) {
    if (value == null || value > 4 || value == 0) {
      return ChildCountValidationError.invalid;
    }
    return null;
  }
}

enum GenreValidationError { invalid }

///FirstName Form
class GenreForm extends FormzInput<String, GenreValidationError> {
  const GenreForm.pure() : super.pure('');

  const GenreForm.dirty([String value = '']) : super.dirty(value);

  @override
  GenreValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return GenreValidationError.invalid;
    }
    return null;
  }
}

///LastName Form
class LastNameForm extends FormzInput<String, FirstNameValidationError> {
  const LastNameForm.pure() : super.pure('');

  const LastNameForm.dirty([String value = '']) : super.dirty(value);

  static final RegExp _nameRegExp = RegexPattern.lastName;

  @override
  FirstNameValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return FirstNameValidationError.invalid;
    }
    return _nameRegExp.hasMatch(value)
        ? null
        : FirstNameValidationError.invalid;
  }
}

enum CheckboxValidationStatus { disabled }

///Checkbox Confirmation Form
class CheckboxConfirmationForm
    extends FormzInput<bool, CheckboxValidationStatus> {
  const CheckboxConfirmationForm.pure({this.checkboxValue = false})
      : super.pure(false);

  const CheckboxConfirmationForm.dirty({required this.checkboxValue})
      : super.dirty(checkboxValue);

  final bool checkboxValue;

  @override
  CheckboxValidationStatus? validator(bool value) {
    return value == true ? null : CheckboxValidationStatus.disabled;
  }
}

enum ConfirmedPasswordValidationError { invalid }

///Confirmed Password Form
class ConfirmedPasswordForm
    extends FormzInput<String, ConfirmedPasswordValidationError> {
  const ConfirmedPasswordForm.pure({this.password = ''}) : super.pure('');

  const ConfirmedPasswordForm.dirty({required this.password, String value = ''})
      : super.dirty(value);

  final String password;

  @override
  ConfirmedPasswordValidationError? validator(String? value) {
    return password == value ? null : ConfirmedPasswordValidationError.invalid;
  }
}

///Username
class UserNameForm extends FormzInput<String, FirstNameValidationError> {
  const UserNameForm.pure() : super.pure('');

  const UserNameForm.dirty([String value = '']) : super.dirty(value);

  static final RegExp _nameRegExp = RegexPattern.username;

  @override
  FirstNameValidationError? validator(String? value) {
    return _nameRegExp.hasMatch(value ?? '')
        ? null
        : FirstNameValidationError.invalid;
  }
}

//Birthdate
enum BirthdateValidationError { invalid }

class BirthDateForm extends FormzInput<String, BirthdateValidationError> {
  const BirthDateForm.pure() : super.pure('');

  const BirthDateForm.dirty([String value = '']) : super.dirty(value);

  @override
  BirthdateValidationError? validator(String? value) {
    return value != null && value.isNotEmpty
        ? null
        : BirthdateValidationError.invalid;
  }
}

//Birtdate List
enum BirthdateListValidationError { invalid }

class BirthDateListForm
    extends FormzInput<List<String>, BirthdateListValidationError> {
  BirthDateListForm.pure() : super.pure([]);

  BirthDateListForm.dirty(value) : super.dirty(value);

  @override
  BirthdateListValidationError? validator(List<String>? value) {
    return value != null && value.isNotEmpty
        ? null
        : BirthdateListValidationError.invalid;
  }
}

enum PhoneNumberError { invalid }

/// Phone number
class PhoneNumberForm extends FormzInput<String, PhoneNumberError> {
  const PhoneNumberForm.pure() : super.pure('');

  const PhoneNumberForm.dirty([String value = '']) : super.dirty(value);

  static final RegExp _phoneRegex = RegexPattern.phone;

  @override
  PhoneNumberError? validator(String? value) {
    return _phoneRegex.hasMatch(value ?? '') ? null : PhoneNumberError.invalid;
  }
}

enum PhoneNumberCodeError { invalid }

/// Phone number
class PhoneCodeForm extends FormzInput<String, PhoneNumberCodeError> {
  const PhoneCodeForm.pure() : super.pure('');

  const PhoneCodeForm.dirty([String value = '']) : super.dirty(value);

  // TODO: Pending add regex for code
  static final RegExp _phoneRegex = RegexPattern.verificationPhoneCode;

  @override
  PhoneNumberCodeError? validator(String? value) {
    return _phoneRegex.hasMatch(value ?? '')
        ? null
        : PhoneNumberCodeError.invalid;
  }
}

//endregion

enum RequiredStringError { invalid }

class RequiredStringForm extends FormzInput<String, RequiredStringError> {
  const RequiredStringForm.pure() : super.pure('');

  const RequiredStringForm.dirty([String value = '']) : super.dirty(value);

  @override
  RequiredStringError? validator(String? value) {
    return (value != null && value.trim().isNotEmpty)
        ? null
        : RequiredStringError.invalid;
  }
}
