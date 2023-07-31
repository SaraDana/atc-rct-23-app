import 'package:app/models/unit_model.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'unit_program_state.freezed.dart';

@freezed
class UnitProgramState with _$UnitProgramState {
  const factory UnitProgramState({
    @Default(StatusCubit.INITIAL) StatusCubit status,
    String? errorMessage,
    Unit? unit,
    @Default(true) bool isRead,
  }) = _UnitProgramState;
}
