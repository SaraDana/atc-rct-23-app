import 'package:app/core/forms/user/user_form.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'recover_password_state.freezed.dart';

@freezed
class RecoverPasswordState with _$RecoverPasswordState {
  const factory RecoverPasswordState({
    @Default(EmailForm.pure()) EmailForm email,
    @Default(FormzStatus.pure) FormzStatus status,
    String? errorMessage,
  }) = _RecoverPasswordState;
}
