import 'package:app/core/enums/status_cubit.dart';
import 'package:app/data/repositories/ask_for_info/firebase_ask_for_info_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'midwife_state.dart';
part 'midwife_cubit.freezed.dart';

class MidWifeCubit extends Cubit<MidWifeState> {
  MidWifeCubit() : super(const MidWifeState());

  setNumber(number) {
    emit(state.copyWith(phoneNumber: number));
  }

  resetState() {
    emit(state.copyWith(phoneNumber: null, status: StatusCubit.INITIAL));
  }

  savePhoneNumber(String option) async {
    emit(state.copyWith(status: StatusCubit.LOADING));
    try {
      if (state.phoneNumber != null) {
        bool isOk = await FirebaseAskForInfoRepository().savePhoneNumber(
            phoneNumber: state.phoneNumber!,
            courseName: "MIDWIFE_COURSE",
            extraData: {"option": option});
        if (isOk) {
          emit(state.copyWith(status: StatusCubit.SUCCESS));
        } else {
          emit(state.copyWith(status: StatusCubit.CHARGE_ERROR));
        }
      }
    } catch (e) {
      emit(state.copyWith(status: StatusCubit.ERROR));
    }
  }
}
