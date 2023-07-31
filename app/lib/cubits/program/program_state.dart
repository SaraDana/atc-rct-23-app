import 'package:app/models/program_model.dart';
import 'package:app/models/unit_model.dart';
import 'package:app/models/user_units_model.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:app/utils/programs.utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'program_state.freezed.dart';

@freezed
class ProgramState with _$ProgramState {
  const factory ProgramState({
    @Default(StatusCubit.INITIAL) StatusCubit status,
    @Default(StatusProgram.INITIAL) StatusProgram statusProgram,
    String? errorMessage,
    Program? program,
    String? imageUrl,
    List<Unit>? units,
    List<UserUnits>? userUnits,
    int? rate,
  }) = _ProgramState;
}
