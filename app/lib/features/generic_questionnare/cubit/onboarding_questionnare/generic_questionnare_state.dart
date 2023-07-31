part of 'generic_questionnare_cubit.dart';

@freezed
class GenericQuestionnareState with _$GenericQuestionnareState {
  const factory GenericQuestionnareState({
    @Default(StatusCubit.INITIAL) StatusCubit status,
    @Default(0) int currentStep,
    String? currentQuestionId,
  }) = _GenericQuestionnareState;
}
