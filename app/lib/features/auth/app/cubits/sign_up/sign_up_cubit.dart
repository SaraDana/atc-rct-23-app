import 'package:app/config/constants.dart';
import 'package:app/core/forms/user/user_form.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/user/domain/repositories/user_repository.dart';
import 'package:app/utils/preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:app/features/auth/index.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    required this.authRepository,
    required this.userRepository,
  }) : super(const SignUpState());

  final AuthRepository authRepository;
  final UserRepository userRepository;

  void resetState() {
    emit(SignUpState());
  }

  void emailChanged(String value) {
    final email = EmailForm.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([
          email,
          state.password,
          state.passwordRepeat,
          state.acceptTerms,
        ]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = PasswordForm.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([
          state.email,
          state.passwordRepeat,
          password,
          state.acceptTerms,
        ]),
      ),
    );
  }

  void confirmedPasswordChanged(String value) {
    final passwordRepeat = ConfirmedPasswordForm.dirty(
        password: state.password.value, value: value);
    emit(
      state.copyWith(
        passwordRepeat: passwordRepeat,
        status: Formz.validate([
          state.email,
          passwordRepeat,
          state.password,
          state.acceptTerms,
        ]),
      ),
    );
  }

  void acceptTermsChanged(bool value) {
    final acceptTerms = CheckboxConfirmationForm.dirty(checkboxValue: value);
    emit(
      state.copyWith(
        acceptTerms: acceptTerms,
        status: Formz.validate([
          state.email,
          state.passwordRepeat,
          state.password,
          acceptTerms,
        ]),
      ),
    );
  }

  Future<void> signUpFormSubmitted() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final AuthDTO response = await authRepository.signUpWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );

      await _logUserInApp(response);
      DanaAnalyticsService.trackUserRegistered('email');

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}

Future<void> _logUserInApp(AuthDTO signInDTO) async {
  await PreferenceUtils.setString(PREF_USER_EMAIL, signInDTO.email);
}
