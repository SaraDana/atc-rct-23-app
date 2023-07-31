//IMPORT EXTERN APP
import 'dart:developer';

import 'package:app/cubits/questionnare/questionnare_cubit.dart';
import 'package:app/features/edit_profile/data/dto/update_user_dto.dart';
import 'package:app/features/edit_profile/domain/models/edit_profile_data.dart';
import 'package:app/features/user/app/cubits/initial_profile_state.dart';
import 'package:app/features/user/domain/enums/genre.dart';
import 'package:app/features/user/domain/models/new_user_model.dart';
import 'package:app/features/user/data/repositories/firebase_user_repository.dart';
import 'package:app/models/mood_question/question_model.dart';
import 'package:bloc/bloc.dart';

//IMPORT INTERN APP
import 'package:app/config/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/di/locator.dart';
import '../../../../cubits/purchases/purchases_cubit.dart';
import '../../../../data/services/dana_analytics_service.dart';
import '../../../../data/services/push_notifications.dart';

class InitialProfileCubit extends Cubit<InitialProfileState> {
  InitialProfileCubit() : super(InitialProfileState()) {
    checkTipsComplated();
  }

  Future<NewUserModel?> getUserByEmail() async {
    final NewUserModel? newUserModel =
        await FirebaseUserRepository().getUserByEmail();
    if (newUserModel == null) return null;
    if (newUserModel.id != null) {
      changeId(id: newUserModel.id!);
    }
    if (newUserModel.premiumGroupB != null) {
      emit(state.copyWith(isPremiumGroupB: newUserModel.premiumGroupB!));
    }
    if (newUserModel.name != null) {
      changeName(name: newUserModel.name!);
    }
    if (newUserModel.email != null) {
      changeEmail(email: newUserModel.email!);
    }
    try {
      if (newUserModel.profileContentType != null) {
        List helps = List.from(newUserModel.profileContentType!);
        List<InitialProfileContentType> selectedItemsProfileContentType = [];

        helps.forEach((element) {
          selectedItemsProfileContentType
              .add(stringToInitialProfileContentType(element['value']));
        });
        changeSelectedItemsProfileContentType(
            selectedItemsProfileContentType: selectedItemsProfileContentType);
      }
    } catch (e) {
      log('$e');
    }
    if (newUserModel.birthday != null) {
      changeBirthday(birthday: newUserModel.birthday!);
    }

    if (newUserModel.location != null) {
      changeLocation(location: newUserModel.location!);
    }
    if (newUserModel.genre != null) {
      changeGenre(genre: stringToGenre(newUserModel.genre));
    }

    if (newUserModel.profileMotherExperience != null) {
      changeInitialProfileMotherExperience(
          initialProfileMotherExperience:
              stringToInitialProfileMotherExperience(
                  newUserModel.profileMotherExperience!));
    }

    if (newUserModel.childBirthDate != null) {
      if (newUserModel.childBirthDate != null) {
        final int childMonths = newUserModel.calculateChildMonths();
        changeInitialProfileMotherMonths(
            initialProfileMotherMonths: childMonths,
            childBirthDate: newUserModel.childBirthDate);
      } else {
        changeInitialProfileMotherMonths(
            initialProfileMotherMonths:
                stringToInitialMotherMonts(newUserModel.motherMonths));
      }
    }

    if (newUserModel.pregnantWeeks != null || newUserModel.lastPeriod != null) {
      if (newUserModel.lastPeriod != null) {
        final int pregnantWeeks = newUserModel.calculateWeeksPregnant();
        changePregnantWeeks(
            pregnantWeeks: pregnantWeeks, lastPeriod: newUserModel.lastPeriod);
      } else {
        changePregnantWeeks(pregnantWeeks: newUserModel.pregnantWeeks!);
      }
    }

    if (newUserModel.profileMoment != null) {
      changeInitialProfileMoment(
          initialProfileMoment:
              stringToInitialProfileMoment(newUserModel.profileMoment));
      if (newUserModel.profileMoment == 'I_AM_PREGNANT') {
        changeShowMotherMonths(showMotherMonths: false);
        changeShowPregnantWeeks(showPregnantWeeks: true);
      } else {
        changeShowPregnantWeeks(showPregnantWeeks: false);
      }

      if (newUserModel.profileMoment == 'I_AM_ALREADY_MOTHER') {
        changeShowMotherMonths(showMotherMonths: true);
        changeShowPregnantWeeks(showPregnantWeeks: false);
      } else {
        changeShowMotherMonths(showMotherMonths: false);
      }
    }
    try {
      if (newUserModel.profileHelp != null) {
        List helps = List.from(newUserModel.profileHelp!);
        List<InitialProfileHelp> selectedItemsProfileHelp = [];
        helps.forEach((element) {
          selectedItemsProfileHelp
              .add(stringToInitialProfileHelp(element['value']));
        });
        changeSelectedItemsProfileHelp(
            selectedItemsProfileHelp: selectedItemsProfileHelp);
      }
    } catch (e) {
      log('$e');
    }

    try {
      if (newUserModel.profileEmotions != null) {
        List helps = List.from(newUserModel.profileEmotions!);
        List<InitialProfileEmotions> selectedItemsProfileEmotions = [];
        helps.forEach((element) {
          selectedItemsProfileEmotions
              .add(stringToInitialProfileEmotions(element['value']));
        });
        changeSelectedItemsProfileEmotions(
            selectedItemsProfileEmotions: selectedItemsProfileEmotions);
      }
    } catch (e) {}

    if (newUserModel.profilePsychologicalTherapy != null) {
      changeInitialProfilePsychologicalTherapy(
          initialProfilePsychologicalTherapy:
              stringToInitialPsychologicalTherapy(
                  newUserModel.profilePsychologicalTherapy));
    }

    if (newUserModel.profileSupportGroup != null) {
      changeInitialProfileSupportGroup(
          initialProfileSupportGroup:
              stringToInitialSupportGroup(newUserModel.profileSupportGroup));
    }

    return newUserModel;
  }

  void changeId({required String id}) => emit(state.copyWith(id: id));

  void changeName({required String name}) => emit(state.copyWith(name: name));
  void editName({required String name}) => emit(state.copyWith(name: name));
  void changeEmail({required String email}) =>
      emit(state.copyWith(email: email));

  void changeBirthday({required String birthday}) =>
      emit(state.copyWith(birthday: birthday));

  void changeLocation({required String location}) =>
      emit(state.copyWith(location: location));

  void editLocation({required String location}) =>
      emit(state.copyWith(location: location));

  void changeInitialProfileMotherExperience(
          {required InitialProfileMotherExperience
              initialProfileMotherExperience}) =>
      emit(state.copyWith(
          initialProfileMotherExperience: initialProfileMotherExperience));

  void changePregnantWeeks(
          {required int pregnantWeeks, DateTime? lastPeriod}) =>
      emit(
          state.copyWith(pregnantWeeks: pregnantWeeks, lastPeriod: lastPeriod));

  void changeGenre({required Genre genre}) =>
      emit(state.copyWith(genre: genre));
  void changeInitialProfileMotherMonths(
          {required int initialProfileMotherMonths,
          DateTime? childBirthDate}) =>
      emit(state.copyWith(
          initialProfileMotherMonths: initialProfileMotherMonths,
          childBirthDate: childBirthDate));

  void changeInitialProfileMoment(
          {required InitialProfileMoment initialProfileMoment}) =>
      emit(state.copyWith(initialProfileMoment: initialProfileMoment));

  void changeSelectedItemsProfileHelp(
          {required List<InitialProfileHelp> selectedItemsProfileHelp}) =>
      emit(state.copyWith(selectedItemsProfileHelp: selectedItemsProfileHelp));

  void changeSelectedItemsProfileContentType(
          {required List<InitialProfileContentType>
              selectedItemsProfileContentType}) =>
      emit(state.copyWith(
          selectedItemsProfileContentType: selectedItemsProfileContentType));

  void changeSelectedItemsProfileEmotions(
          {required List<InitialProfileEmotions>
              selectedItemsProfileEmotions}) =>
      emit(state.copyWith(
          selectedItemsProfileEmotions: selectedItemsProfileEmotions));

  void changeInitialProfilePsychologicalTherapy(
          {required InitialProfilePsychologicalTherapy
              initialProfilePsychologicalTherapy}) =>
      emit(state.copyWith(
          initialProfilePsychologicalTherapy:
              initialProfilePsychologicalTherapy));

  void changeInitialProfileSupportGroup(
          {required InitialProfileSupportGroup initialProfileSupportGroup}) =>
      emit(state.copyWith(
          initialProfileSupportGroup: initialProfileSupportGroup));

  void changeShowPregnantWeeks({required bool showPregnantWeeks}) =>
      emit(state.copyWith(showPregnantWeeks: showPregnantWeeks));

  void changeShowMotherMonths({required bool showMotherMonths}) =>
      emit(state.copyWith(showMotherMonths: showMotherMonths));

  Future<void> setUserByEmail({required Map<String, dynamic> data}) async {
    await FirebaseUserRepository().setUserByEmail(data: data);
    DanaAnalyticsService.trackUserProfileUpdated();
    if (state.email != null) {
      DanaAnalyticsService.updateUserInfo(state.email!);
      PushNotificationService.updateUserInfo(
          PushNotificationUserInfo(state.id, state.name));
      locator<PurchasesCubit>().updateUserInfo();
    }
  }

  Future<void> updateOnboardingComplete() async {
    await FirebaseUserRepository().setUserByEmail(data: {
      'completedOnboarding': true,
    });
  }

  Future<void> updateProfile2(EditProfileData editProfileData) async {
    final UpdateUserDTO updateUserDTO = UpdateUserDTO(
      name: editProfileData.name,
      location: editProfileData.location,
      genre: editProfileData.genre?.name,
      birthday: editProfileData.birthday,
      profileMoment: editProfileData.profileMoment,
      lastPeriod: editProfileData.lastPeriod,
      childBirthDate: editProfileData.childBirthDate,
      updatedAt: Timestamp.now(),
    );
//TODO MOVE TO REPOSITORY  locator<InitialProfileCubit>().setUserByEmail(data: {
//                         'updatedAt': Timestamp.now(),
//                         'name': stateInitialProfile.name,
//                       });
    await FirebaseUserRepository()
        .setUserByEmail(data: updateUserDTO.toJson(updateUserDTO));
    DanaAnalyticsService.trackUserProfileUpdated();
    if (state.email != null) {
      DanaAnalyticsService.updateUserInfo(state.email!);
      PushNotificationService.updateUserInfo(
          PushNotificationUserInfo(state.id, state.name));
      locator<PurchasesCubit>().updateUserInfo();
    }
    await getUserByEmail();
  }

  Future<void> logout() async {
//      await Purchases.logOut();

    await locator<QuestionnareCubit>().resetQuestionnare();
    await removeOneSignalId();
    return await FirebaseUserRepository().logout();
  }

  bool isPremiumGroupB(bool? isPremiumProgram) {
    if (isPremiumProgram == null || !isPremiumProgram) {
      return false;
    }
    return state.isPremiumGroupB ?? false;
  }

  bool isPremiumGroupA(bool? isPremiumProgram) {
    if (isPremiumProgram == null || !isPremiumProgram) {
      return false;
    }
    return state.isPremiumGroupB == null || (!(state.isPremiumGroupB!));
  }

  bool isPremium(bool? premiumGroupA, bool? premiumGroupB) {
    return isPremiumGroupB(premiumGroupB) || isPremiumGroupA(premiumGroupA);
  }

  void updateOneSignalId({required String oneSignalId}) async {
    emit(state.copyWith(oneSignalId: oneSignalId));
    await setOneSignalIdToLoggedUser();
  }

  Future<void> setOneSignalIdToLoggedUser() async {
    var oneSignalId = state.oneSignalId;
    if (oneSignalId != null && oneSignalId.length > 0) {
      await FirebaseUserRepository().addOneSignalID(oneSignalId);
    }
  }

  Future<void> removeOneSignalId() async {
    var oneSignalId = state.oneSignalId;
    if (oneSignalId != null && oneSignalId.length > 0) {
      await FirebaseUserRepository().removeOneSignalID(oneSignalId);
    }
  }

  setTipsComplated() async {
    int count = await gethomePageTutorialSeenCount();
    sethomePageTutorialSeenCount(count);
    emit(
      state.copyWith(homePageTutorialSeenCount: count + 1),
    );
    DanaAnalyticsService.trackTutorialPageVisited('home');
  }

  checkTipsComplated() async {
    int count = await gethomePageTutorialSeenCount();
    if (count == 1) {
      sethomePageTutorialSeenCount(count);
    } else {
      emit(state.copyWith(homePageTutorialSeenCount: count));
    }
  }

  Future<int> gethomePageTutorialSeenCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getInt("homePageTutorialSeenCount") ?? 0;
  }

  sethomePageTutorialSeenCount(count) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("homePageTutorialSeenCount", count + 1);
  }

  Future<void> reset() async {
    var oneSignalId = state.oneSignalId;
    emit(InitialProfileState().copyWith(oneSignalId: oneSignalId));
  }
}
