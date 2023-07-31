import 'package:app/config/constants.dart';
import 'package:app/core/forms/user/user_form.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/features/edit_profile/app/cubits/edit_profile_state.dart';
import 'package:app/features/user/domain/enums/genre.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/date_time_utils.dart';
import '../../domain/models/edit_profile_data.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(const EditProfileState());

  init() async {
    emit(state.copyWith(status: StatusCubit.LOADING));
    final InitialProfileCubit initialProfileCubit =
        locator<InitialProfileCubit>();
    try {
      emit(state.copyWith(
        editProfileData: EditProfileData(
          name: initialProfileCubit.state.name,
          genre: initialProfileCubit.state.genre,
          birthday: initialProfileCubit.state.birthday,
          location: initialProfileCubit.state.location,
          lastPeriod: initialProfileCubit.state.lastPeriod,
          childBirthDate: initialProfileCubit.state.childBirthDate,
          profileMoment: initialProfileMomentToString(
              initialProfileCubit.state.initialProfileMoment),
        ),
        status: StatusCubit.SUCCESS,
        name: FirstNameForm.dirty(initialProfileCubit.state.name ?? ''),
        city: initialProfileCubit.state.location,
        genre: GenreForm.dirty(initialProfileCubit.state.genre?.name ?? ''),
        birthdate: BirthDateForm.dirty(initialProfileCubit.state.birthday ?? ''),
        showMotherMonths: initialProfileCubit.state.showMotherMonths,
        showPregnantWeeks: initialProfileCubit.state.showPregnantWeeks,
        //TODO USE ONE ENUM
        motherMonths: initialProfileCubit.state.initialProfileMotherMonths,
        pregnantWeeks: initialProfileCubit.state.pregnantWeeks,
        profileMoment: initialProfileCubit.state.initialProfileMoment,
      ));
    } catch (e) {
    }
  }

  void updateName(String name) {
    final value = FirstNameForm.dirty(name);

    emit(
      state.copyWith(
        editProfileData: state.editProfileData?.copyWith(name: name),
        name: value,
        formzStatus: Formz.validate(
          [
            value,
            state.genre,
            state.birthdate,
          ],
        ),
      ),
    );
  }

  void updateBirthdate(String birthdate) {
    final value = BirthDateForm.dirty(birthdate);

    emit(
      state.copyWith(
        editProfileData: state.editProfileData?.copyWith(birthday: birthdate),
        birthdate: value,
        formzStatus: Formz.validate(
          [
            value,
            state.genre,
            state.name,
          ],
        ),
      ),
    );
  }

  void updateGenre(String genre) {
    final value = GenreForm.dirty(genre);

    emit(
      state.copyWith(
        editProfileData:
            state.editProfileData?.copyWith(genre: stringToGenre(genre)),
        genre: value,
        formzStatus: Formz.validate(
          [
            value,
            state.birthdate,
            state.name,
          ],
        ),
      ),
    );
  }

  void updateCity(String city) {
    emit(
      state.copyWith(
        editProfileData: state.editProfileData?.copyWith(location: city),
        city: city,
      ),
    );
  }

  void updateLastPeriodDate(String lastPeriodDate) {
    DateFormat formatter = DateFormat("dd-MM-yyyy");
    final value = BirthDateForm.dirty(lastPeriodDate);
    emit(
      state.copyWith(
        editProfileData: state.editProfileData
            ?.copyWith(lastPeriod: formatter.parse(lastPeriodDate)),
        lastPeriod: value,
        pregnantWeeks: calculateWeeksBetweenDate(
            fromTime: formatter.parse(
              lastPeriodDate,
            ),
            toTime: DateTime.now()),

        formzStatus: Formz.validate(
          [
            value,
            state.birthdate,
            state.name,
            state.genre,
          ],
        ),
      ),
    );
  }

  void updateChildBirthDate(String birthDate) {
    DateFormat formatter = DateFormat("dd-MM-yyyy");
    final value = BirthDateForm.dirty(birthDate);
    emit(
      state.copyWith(
        editProfileData: state.editProfileData
            ?.copyWith(childBirthDate: formatter.parse(birthDate)),
        childBirthDate: value,
        motherMonths: calculateMonthsBetweenDate(
            toTime: DateTime.now(), fromTime: formatter.parse(birthDate)),
        formzStatus: Formz.validate(
          [
            value,
          ],
        ),
      ),
    );
  }

  updateProfileMoment(InitialProfileMoment profileMoment) {
    emit(
      state.copyWith(
        editProfileData:
            state.editProfileData?.copyWith(profileMoment: profileMoment.name),
        profileMoment: profileMoment,
        showMotherMonths:
            profileMoment == InitialProfileMoment.I_AM_ALREADY_MOTHER,
        showPregnantWeeks: profileMoment == InitialProfileMoment.I_AM_PREGNANT,
      ),
    );
  }

  Future<void> updateEditProfileData() async {
    try {
      emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
      await locator<InitialProfileCubit>()
          .updateProfile2(state.editProfileData!);
      emit(state.copyWith(formzStatus: FormzStatus.submissionSuccess));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: e.toString(),
        formzStatus: FormzStatus.submissionFailure,
      ));
    }
  }

  Future<void> reset() async {
    emit(EditProfileState());
  }

  // here add all conditions to update
  bool get iCanUpdated => true; //state.formzStatus.isValid;
}
