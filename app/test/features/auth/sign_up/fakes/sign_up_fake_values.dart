import 'package:app/core/forms/user/user_form.dart';
import 'package:app/features/auth/index.dart';
import 'package:formz/formz.dart';

const tInvalidNameString = 'invalid';
const tInvalidName = FirstNameForm.dirty(tInvalidNameString);

const tValidNameString = 'test';
const tValidName = FirstNameForm.dirty(tValidNameString);

const tInvalidEmailString = 'invalid';
const tInvalidEmail = EmailForm.dirty(tInvalidEmailString);

const tValidEmailString = 'test@gmail.com';
const tValidEmail = EmailForm.dirty(tValidEmailString);

const tInvalidPasswordString = 'invalid';
const tInvalidPassword = PasswordForm.dirty(tInvalidPasswordString);

const tValidPasswordString = 't0pS3creT1234.';
const tValidPassword = PasswordForm.dirty(tValidPasswordString);
const tValidAcceptedTerms = CheckboxConfirmationForm.dirty(checkboxValue: true);

AuthDTO tAuthDTO = AuthDTO(
  success: true,
  idUser: '',
  token: '',
  email: 'email',
  isNewUser: false,
);

const tValidCheckboxBool = true;
const tValidCheckbox = CheckboxConfirmationForm.dirty(
  checkboxValue: tValidCheckboxBool,
);

const tInvalidConfirmedPasswordString = 'invalid';
const tInvalidConfirmedPassword = ConfirmedPasswordForm.dirty(
  password: tValidPasswordString,
  value: tInvalidConfirmedPasswordString,
);

const tValidConfirmedPasswordString = 't0pS3creT1234.';
const tValidConfirmedPassword = ConfirmedPasswordForm.dirty(
  password: tValidPasswordString,
  value: tValidConfirmedPasswordString,
);

SignUpState tInvalidEmailState =
    const SignUpState(email: tInvalidEmail, status: FormzStatus.invalid);

SignUpState tInvalidConfirmedPasswordState = const SignUpState(
  status: FormzStatus.invalid,
);

SignUpState tValidState = const SignUpState(
  email: tValidEmail,
  password: tValidPassword,
  passwordRepeat: tValidConfirmedPassword,
  acceptTerms: tValidAcceptedTerms,
  status: FormzStatus.valid,
);

SignUpState tInvalidPasswordState = const SignUpState(
  password: tInvalidPassword,
  status: FormzStatus.invalid,
);
SignUpState tInvalidPasswordConfirmedState = const SignUpState(
  email: tValidEmail,
  password: tValidPassword,
  status: FormzStatus.invalid,
);

SignUpState tInvalidState = const SignUpState(
  email: tValidEmail,
  status: FormzStatus.invalid,
);

SignUpState tInProgressState = const SignUpState(
  status: FormzStatus.submissionInProgress,
  email: tValidEmail,
  password: tValidPassword,
  passwordRepeat: tValidConfirmedPassword,
  acceptTerms: tValidAcceptedTerms,
);

SignUpState tSuccessState = const SignUpState(
  status: FormzStatus.submissionSuccess,
  email: tValidEmail,
  password: tValidPassword,
  passwordRepeat: tValidConfirmedPassword,
  acceptTerms: tValidAcceptedTerms,
);
SignUpState tSubmissionFailureState = const SignUpState(
  status: FormzStatus.submissionFailure,
  email: tValidEmail,
  password: tValidPassword,
  passwordRepeat: tValidConfirmedPassword,
  acceptTerms: tValidAcceptedTerms,
);
