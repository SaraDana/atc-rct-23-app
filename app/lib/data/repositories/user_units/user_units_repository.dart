import 'package:app/models/user_units_model.dart';

abstract class UserUnitsRepository {
  Future<List<UserUnits>> getAllUserUnitsByProgramId(String programId);
  Future<List<UserUnits>> getAllUserUnits({String? userId});
  Future<List<UserUnits>> getAllUserUnitsByProgramIdAndUnitId(String unitId);
  Future<void> setUserUnitByUnitId(
      {required Map<String, dynamic> data, required String unitId});
}
