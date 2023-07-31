import 'package:app/core/forms/user/user_form.dart';
import 'package:app/features/auth/app/cubits/recover_password/recover_password_state.dart';
import 'package:formz/formz.dart';

const tInvalidEmailString = 'invalid';
const tInvalidEmail = EmailForm.dirty(tInvalidEmailString);

const tValidEmailString = 'test@gmail.com';
const tValidEmail = EmailForm.dirty(tValidEmailString);

RecoverPasswordState tValidState = const RecoverPasswordState(
  email: tValidEmail,
  status: FormzStatus.valid,
);

RecoverPasswordState tInvalidEmailState = const RecoverPasswordState(
  email: tInvalidEmail,
  status: FormzStatus.invalid,
);
RecoverPasswordState tInProgressState = const RecoverPasswordState(
  email: tValidEmail,
  status: FormzStatus.submissionInProgress,
);

RecoverPasswordState tSuccessStatus = const RecoverPasswordState(
  email: tValidEmail,
  status: FormzStatus.submissionSuccess,
);
RecoverPasswordState tFailureStatus = const RecoverPasswordState(
  email: tValidEmail,
  status: FormzStatus.submissionFailure,
);
