import 'package:app/models/user_delete_model.dart';

abstract class UserDeleteRepository {
  Future<void> setDeleteUserFirebase(
      {required String userId, required String? userEmail});
  Future<UserDeleteModel> getDeleteUserFirebase();
}
