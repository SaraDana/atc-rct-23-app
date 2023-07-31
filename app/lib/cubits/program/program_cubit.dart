//IMPORT EXTERN APP
import 'package:app/core/enums/status_cubit.dart';
//IMPORT INTERN APP
import 'package:app/cubits/program/program_state.dart';
import 'package:app/data/repositories/program/firebase_program_repository.dart';
import 'package:app/data/repositories/user_units/firebase_user_units_repository.dart';
import 'package:app/models/program_model.dart';
import 'package:app/models/unit_model.dart';
import 'package:app/models/user_units_model.dart';
import 'package:app/utils/programs.utils.dart';
import 'package:bloc/bloc.dart';

class ProgramCubit extends Cubit<ProgramState> {
  ProgramCubit() : super(ProgramState());

  chargeProgram() {
    emit(state.copyWith(
      status: StatusCubit.INITIAL,
    ));
  }

  changeRating({required int rate}) {
    emit(state.copyWith(
      rate: rate,
      statusProgram: StatusProgram.RATE_SELECTED,
    ));
  }

  finishProgram(String programId) async {
    await getProgram(programId);
    emit(
      state.copyWith(statusProgram: StatusProgram.FINISHED),
    );
  }

  updateUserUnits(List<UserUnits>? userUnits) {
    emit(state.copyWith(
      userUnits: userUnits,
    ));
  }

  Future<void> getProgram(String programId) async {
    emit(state.copyWith(
      status: StatusCubit.LOADING,
    ));
    try {
      final Program? program =
          await FirebaseProgramRepository().getProgramById(programId);
      final List<Unit> units =
          await FirebaseProgramRepository().getUnitsByProgramId(programId);
      final List<UserUnits> userUnits = await FirebaseUserUnitsRepository()
          .getAllUserUnitsByProgramId(programId);

      if (program != null && program.poster != null) {
        await _getDownloadImageUrl(program.poster!);
      }

      if (program == null) {
        emit(state.copyWith(
          status: StatusCubit.CHARGE_ERROR,
          errorMessage: 'Program null',
        ));
      } else {
        emit(state.copyWith(
          program: program,
          units: units,
          userUnits: userUnits,
          status: StatusCubit.SUCCESS,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: StatusCubit.ERROR,
        errorMessage: 'Error en la carga de datos',
      ));
    }
  }

  Future<void> _getDownloadImageUrl(String poster) async {
    try {
      String url =
          await FirebaseProgramRepository().getImageUrl(poster: poster);

      emit(state.copyWith(
        imageUrl: url,
      ));
    } catch (e) {}
  }
}
