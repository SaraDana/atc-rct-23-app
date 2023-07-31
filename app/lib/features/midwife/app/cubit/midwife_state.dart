part of 'midwife_cubit.dart';

@freezed
class MidWifeState with _$MidWifeState {
  const factory MidWifeState({
    @Default(StatusCubit.INITIAL) StatusCubit status,
    String? phoneNumber,
  }) = _MidWifeState;
}
