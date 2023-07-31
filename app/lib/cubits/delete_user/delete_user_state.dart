part of 'delete_user_cubit.dart';

class DeleteUserState {
  final bool deleteUser;
  const DeleteUserState({
    required this.deleteUser,
  });
  factory DeleteUserState.initial() {
    return DeleteUserState(deleteUser: false);
  }

  DeleteUserState copyWith({bool? deleteUser}) {
    return DeleteUserState(
      deleteUser: deleteUser ?? this.deleteUser,
    );
  }
}
