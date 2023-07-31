//IMPORT EXTERN APP
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//IMPORT INTERN APP
import 'package:app/models/user_delete_model.dart';
import 'package:app/data/repositories/user_delete/firebase_user_delete_repository.dart';

part 'delete_user_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  DeleteUserCubit() : super(DeleteUserState.initial());

  void setDeleteUser(
      {required String userId, required String? userEmail}) async {
    await FirebaseUserDeleteRepository().setDeleteUserFirebase(
      userEmail: userEmail,
      userId: userId,
    );
  }

  void getDeleteUser() async {
    DanaAnalyticsService.trackDeleteAccount();

    final UserDeleteModel userDeleteModel =
        await FirebaseUserDeleteRepository().getDeleteUserFirebase();
    if (userDeleteModel.userId == null || userDeleteModel.userId == '') {
      _notCanDeleteUser();
    } else {
      _canDeleteUser();
    }
  }

  void _canDeleteUser() {
    final newState = state.copyWith(deleteUser: true);
    emit(newState);
  }

  void _notCanDeleteUser() {
    final newState = state.copyWith(deleteUser: false);
    emit(newState);
  }
}
