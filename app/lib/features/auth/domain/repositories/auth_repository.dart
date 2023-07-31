import 'package:app/features/auth/index.dart';

abstract class AuthRepository {
  Future<AuthDTO> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<AuthDTO> signInWithGoogle();
  Future<AuthDTO> signInWithApple();
  Future<AuthDTO> signInWithFacebook();
  Future<void> recoverPasswordByEmail({required String email});
  Future<AuthDTO> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
}
