enum StatusCubit {
  INITIAL,
  LOADING,
  LOADING_MORE,
  SUCCESS,
  ERROR,
  CHARGE_ERROR
}

enum QuestionnareType {
  VITALITY_TRACKER,
  ONBOARDING_QUESTIONNAIRE,
}

extension CheckStatus on StatusCubit {
  bool get isLoading => this == StatusCubit.LOADING;
  bool get isInitial => this == StatusCubit.INITIAL;
  bool get isSuccess => this == StatusCubit.SUCCESS;
  bool get isError => this == StatusCubit.ERROR;
  bool get isChargeError => this == StatusCubit.CHARGE_ERROR;
  bool get isLoadingMore => this == StatusCubit.LOADING_MORE;
}
