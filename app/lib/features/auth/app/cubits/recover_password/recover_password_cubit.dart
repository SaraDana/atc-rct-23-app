import 'package:app/core/forms/user/user_form.dart';
import 'package:app/features/auth/index.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';

class RecoverPasswordCubit extends Cubit<RecoverPasswordState> {
  RecoverPasswordCubit({required this.authRepository})
      : super(const RecoverPasswordState());

  final AuthRepository authRepository;

  void emailChanged(String value) {
    final email = EmailForm.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email]),
      ),
    );
  }

  Future<void> recoverPasswordByEmail() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await authRepository.recoverPasswordByEmail(email: state.email.value);
      emit(
        state.copyWith(status: FormzStatus.submissionSuccess),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
        ),
      );
    }
  }
}
