import 'package:app/models/user_programs_model.dart';

abstract class UserProgramsRepository {
  Future<UserPrograms> getUserProgramsByProgramId(String programId);
}
