import 'package:app/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
class AppException with _$AppException {
  // Auth
  const factory AppException.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AppException.weakPassword() = WeakPassword;
  const factory AppException.wrongPassword() = WrongPassword;
  const factory AppException.userNotFound() = UserNotFound;
  const factory AppException.invalidCredential() = InvalidCredential;
  const factory AppException.unknown() = Unknown;
}

class AppExceptionData {
  AppExceptionData(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => 'AppExceptionData(code: $code, message: $message)';
}

extension AppExceptionDetails on AppException {
  AppExceptionData get details {
    return when(
      // Auth
      emailAlreadyInUse: () => AppExceptionData(
        'email-already-in-use',
        S.current.emailExist,
      ),
      weakPassword: () => AppExceptionData(
        'weak-password',
        S.current.weakPassword,
      ),
      wrongPassword: () => AppExceptionData(
        'wrong-password',
        S.current.wrongPassword,
      ),
      userNotFound: () => AppExceptionData(
        'user-not-found',
        S.current.userNotFound,
      ),
      invalidCredential: () => AppExceptionData(
        'invalid-credential',
        S.current.invalidCredentials,
      ),
      unknown: () => AppExceptionData(
        'unknown',
        S.current.unknown,
      ),
    );
  }
}
