import 'package:app/config/constants.dart';
import 'package:app/core/forms/user/user_form.dart';
import 'package:app/features/edit_profile/domain/models/edit_profile_data.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app/core/enums/status_cubit.dart';
part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    EditProfileData? editProfileData,
    @Default(StatusCubit.INITIAL) StatusCubit status,
    @Default(FormzStatus.pure) FormzStatus formzStatus,
    String? errorMessage,
    @Default(BirthDateForm.pure()) BirthDateForm birthdate,
    @Default(FirstNameForm.pure()) FirstNameForm name,
    @Default(GenreForm.pure()) GenreForm genre,
    String? city,
    int? pregnantWeeks,
    int? motherMonths,
    InitialProfileMoment? profileMoment,
    @Default(false) bool showPregnantWeeks,
    @Default(false) bool showMotherMonths,
    @Default(BirthDateForm.pure()) BirthDateForm lastPeriod,
    @Default(BirthDateForm.pure()) BirthDateForm childBirthDate,
  }) = _EditProfileState;
}
