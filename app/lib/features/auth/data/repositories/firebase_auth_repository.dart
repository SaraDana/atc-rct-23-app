import 'dart:convert';
import 'dart:math';

import 'package:app/core/exceptions/exceptions.dart';
import 'package:app/data/services/firebase_crachlytics_manager.dart';
import 'package:app/features/auth/index.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  @override
  Future<void> recoverPasswordByEmail({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _codeToException(e.code);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<AuthDTO> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((user) => AuthDTO.fromFirebaseUser(user));
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _codeToException(e.code);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<AuthDTO> signInWithApple() async {
    try {
      final rawNonce = _generateNonce();
      final nonce = _sha256ofString(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential =
          firebase_auth.OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      return await _firebaseAuth
          .signInWithCredential(oauthCredential)
          .then((UserCredential user) => AuthDTO.fromFirebaseUser(user));
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _codeToException(e.code);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<AuthDTO> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _firebaseAuth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((user) => AuthDTO.fromFirebaseUser(user));
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _codeToException(e.code);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<AuthDTO> signInWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;

      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await _firebaseAuth
          .signInWithCredential(credential)
          .then((user) => AuthDTO.fromFirebaseUser(user));
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _codeToException(e.code);
    } catch (e) {
      throw e;
    }
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  String _generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  @override
  Future<AuthDTO> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.accessToken == null) throw Exception();

      final OAuthCredential credential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      return await _firebaseAuth
          .signInWithCredential(credential)
          .then((user) => AuthDTO.fromFirebaseUser(user));
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _codeToException(e.code);
    } catch (e) {
      throw e;
    }
  }

  _codeToException(String code) {
    switch (code) {
      case "user-not-found":
        return AppException.userNotFound();
      case "wrong-password":
        return AppException.wrongPassword();
      case "email-already-in-use":
        return AppException.emailAlreadyInUse();
      case "weak-password":
        return AppException.weakPassword();
      case "invalid-credentials":
        return AppException.invalidCredential();
      case "account-exists-with-different-credential":
        return AppException.emailAlreadyInUse();
      default:
        FirebaseCrashyticsManager().loginUnknownError(code);
        return AppException.unknown();
    }
  }
}
