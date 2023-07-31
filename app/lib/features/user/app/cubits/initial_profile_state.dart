import 'package:app/config/constants.dart';
import 'package:app/features/user/domain/enums/genre.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'initial_profile_state.freezed.dart';

@freezed
class InitialProfileState with _$InitialProfileState {
  const factory InitialProfileState({
    @Default("") String id,
    String? name,
    String? email,
    String? birthday,
    @Default("") String? location,
    @Default(1) int pregnantWeeks,
    Genre? genre,
    InitialProfileMotherExperience? initialProfileMotherExperience,
    @Default(1) int initialProfileMotherMonths,
    InitialProfileMoment? initialProfileMoment,
    @Default([]) List<InitialProfileHelp> selectedItemsProfileHelp,
    @Default([])
        List<InitialProfileContentType> selectedItemsProfileContentType,
    @Default([]) List<InitialProfileEmotions> selectedItemsProfileEmotions,
    @Default(InitialProfilePsychologicalTherapy.YES_CURRENTLY)
        InitialProfilePsychologicalTherapy initialProfilePsychologicalTherapy,
    @Default(InitialProfileSupportGroup.YES_CURRENTLY)
        InitialProfileSupportGroup initialProfileSupportGroup,
    @Default(false) bool showPregnantWeeks,
    @Default(false) bool showMotherMonths,
    DateTime? lastPeriod,
    DateTime? childBirthDate,
    bool? isPremiumGroupB,
    int? homePageTutorialSeenCount,
    String? oneSignalId,
  }) = _InitialProfileState;
}
