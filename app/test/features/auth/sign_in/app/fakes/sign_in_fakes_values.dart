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

SignInState tInvalidEmailState =
    const SignInState(email: tInvalidEmail, status: FormzStatus.invalid);

SignInState tInvalidConfirmedPasswordState = const SignInState(
  status: FormzStatus.invalid,
);

SignInState tValidState = const SignInState(
  email: tValidEmail,
  password: tValidPassword,
  status: FormzStatus.valid,
);

SignInState tInvalidPasswordState = const SignInState(
  password: tInvalidPassword,
  status: FormzStatus.invalid,
);
SignInState tInvalidPasswordConfirmedState = const SignInState(
  email: tValidEmail,
  password: tValidPassword,
  status: FormzStatus.invalid,
);

SignInState tInvalidState = const SignInState(
  email: tValidEmail,
  status: FormzStatus.invalid,
);

SignInState tInProgressState = const SignInState(
  status: FormzStatus.submissionInProgress,
  email: tValidEmail,
  password: tValidPassword,
);

SignInState tSuccessState = const SignInState(
  status: FormzStatus.submissionSuccess,
  email: tValidEmail,
  password: tValidPassword,
);
SignInState tSubmissionFailureState = const SignInState(
  status: FormzStatus.submissionFailure,
  email: tValidEmail,
  password: tValidPassword,
  errorMessage: 'Login cancelado'
);
