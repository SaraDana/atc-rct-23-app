import 'package:app/config/constants.dart';
import 'package:app/core/exceptions/exceptions.dart';
import 'package:app/core/forms/user/user_form.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/auth/index.dart';
import 'package:app/features/start_app/app/cubit/start_app_cubit.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/features/user/domain/repositories/user_repository.dart';
import 'package:app/utils/preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:app/core/di/locator.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required this.userRepository,
    required this.authRepository,
  }) : super(const SignInState());

  final AuthRepository authRepository;
  final UserRepository userRepository;

  void resetState() {
    emit(SignInState());
  }

  void emailChanged(String value) {
    final email = EmailForm.dirty(value);
    
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = PasswordForm.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> sigInWithCredentials() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      final AuthDTO userLogged =
          await authRepository.signInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      DanaAnalyticsService.trackUserLoggedIn('email');

      await _logUserInApp(userLogged, issSocialLogin:true);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (e) {
      _checkError(e);

    }
  }

  Future<void> signInWithGoogle() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final AuthDTO response = await authRepository.signInWithGoogle();
      //  DanaAnalyticsService.trackUserLoggedIn('google');
      DanaAnalyticsService.trackSocialAuth(
          provider: 'google', isNewUser: response.isNewUser);
      await _logUserInApp(response, issSocialLogin:true);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (e) {
      _checkError(e);

      }


  }

  Future<void> signInWithFacebook() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final AuthDTO response = await authRepository.signInWithFacebook();
      //DanaAnalyticsService.trackUserLoggedIn('facebook');
      DanaAnalyticsService.trackSocialAuth(
          provider: 'facebook', isNewUser: response.isNewUser);
      await _logUserInApp(response, issSocialLogin:true);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (e) {
      _checkError(e);
    }
  }

  Future<void> signInWithApple() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final AuthDTO response = await authRepository.signInWithApple();
      // DanaAnalyticsService.trackUserLoggedIn('apple');
      DanaAnalyticsService.trackSocialAuth(
          provider: 'apple', isNewUser: response.isNewUser);
      await _logUserInApp(response, issSocialLogin: true);

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (e) {
      _checkError(e);

    }
  }

  Future<void> _logUserInApp(AuthDTO signInDTO,
      {required bool issSocialLogin}) async {
    await PreferenceUtils.setString(PREF_USER_EMAIL, signInDTO.email);
    userRepository.editUser();
    await resetUserInfoCubits();
    if (issSocialLogin) locator<StartAppCubit>().init();
    locator<InitialProfileCubit>().setOneSignalIdToLoggedUser();
  }
  void _checkError(e) {
    if (e is AppException) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage: e.details.message));
    } else {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage: 'Login cancelado'));
    }
  }
}

