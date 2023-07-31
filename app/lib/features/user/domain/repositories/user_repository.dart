import 'package:app/features/user/domain/models/new_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Future<NewUserModel?> getUserByEmail();
  Future<NewUserModel?> getUserById(String? userId);
  String getUserId();
  Future<void> setUserByEmail({required Map<String, dynamic> data});
  Future<void> createNewUser(User user);
  Future<void> editUser();
  Future<void> addOneSignalID(String oneSignalID);
  Future<void> removeOneSignalID(String oneSignalID);
  Future<void> logout();
}
