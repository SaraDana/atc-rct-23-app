import 'package:app/core/forms/user/user_form.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(EmailForm.pure()) EmailForm email,
    @Default(PasswordForm.pure()) PasswordForm password,
    @Default(FormzStatus.pure) FormzStatus status,
    String? errorMessage,
  }) = _Initial;
}
