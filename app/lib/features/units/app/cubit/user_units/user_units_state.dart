part of 'user_units_cubit.dart';

@freezed
class UserUnitsState with _$UserUnitsState {
  const factory UserUnitsState({
    @Default(StatusCubit.INITIAL) StatusCubit status,
    String? errorMessage,
    @Default([]) List<UserUnits> units,
    @Default( false) bool isCompleted,
  }) = _UserUnitsState;
}
