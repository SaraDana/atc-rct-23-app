import 'package:app/core/forms/user/user_form.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(EmailForm.pure()) EmailForm email,
    @Default(PasswordForm.pure()) PasswordForm password,
    @Default(ConfirmedPasswordForm.pure()) ConfirmedPasswordForm passwordRepeat,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(CheckboxConfirmationForm.pure())
        CheckboxConfirmationForm acceptTerms,
    String? errorMessage,
  }) = _Initial;
}
