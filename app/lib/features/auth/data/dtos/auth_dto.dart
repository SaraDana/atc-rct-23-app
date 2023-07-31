import 'package:firebase_auth/firebase_auth.dart';

class AuthDTO {
  AuthDTO({
    required this.success,
    required this.idUser,
    required this.token,
    required this.email,
    required this.isNewUser,
  });
  final bool success;
  final String idUser;
  final String token;
  final String email;
  final bool isNewUser;

  factory AuthDTO.fromJson(
    Map<String, dynamic> map,
  ) {
    return AuthDTO(
        success: map['success'] as bool,
        idUser: map['data']['id_user'] as String,
        token: map['data']['token'] as String,
        email: map['data']['email'] as String,
        isNewUser: map['data']['is_new_user'] as bool);
  }

  factory AuthDTO.fromFirebaseUser(UserCredential firebaseUser) {
    final String idUser = firebaseUser.user?.uid ?? '';
    final String token = firebaseUser.credential?.accessToken ?? '';
    final String email = firebaseUser.user?.email ?? '';
    final bool isNewUser = firebaseUser.additionalUserInfo?.isNewUser ?? false;

    return AuthDTO(
        success: true,
        idUser: idUser,
        token: token,
        email: email,
        isNewUser: isNewUser);
  }
}
