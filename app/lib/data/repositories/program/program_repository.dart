//IMPORT INTERN APP
import 'package:app/models/program_model.dart';
import 'package:app/models/unit_model.dart';

abstract class ProgramRepository {
  Future<List<Program>> getAllPrograms();
  Future<Program> getProgram(String ref);
  Future<Program?> getProgramById(String programId);
  Future<List<Unit>> getUnitsByProgramId(String programId);
  Future<Unit> getUnitById(String id);
  Future<void> setRateProgramById(
      {required String programId, required int rate});
  Future<void> createUserProgramByProgramId({required String programId});
  Future<String> getImageUrl({required String poster});
}
