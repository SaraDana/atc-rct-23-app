import 'package:app/core/enums/status_cubit.dart';
import 'package:app/data/repositories/user_units/firebase_user_units_repository.dart';
import 'package:app/models/user_units_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_units_state.dart';
part 'user_units_cubit.freezed.dart';

class UserUnitsCubit extends Cubit<UserUnitsState> {
  UserUnitsCubit() : super(const UserUnitsState());

// Si no esta vacio es que ya esta vista la unidad.
  void getUserUnits(String unitId) async {
    List<UserUnits> units = await FirebaseUserUnitsRepository()
        .getAllUserUnitsByProgramIdAndUnitId(unitId);
    if (units.isNotEmpty) {
      emit(state.copyWith(isCompleted: true));
    }
  }
}
