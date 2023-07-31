import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/cubits/question_new_home/question_new_home_cubit.dart';
import 'package:app/cubits/questionnare/questionnare_cubit.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/deeplinks/app/cubits/deep_links/deeplink_cubit.dart';
import 'package:app/features/start_app/app/cubit/start_app_cubit.dart';
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/models/mood_question/action_model.dart';
import 'package:app/models/mood_question/question_model.dart';
import 'package:app/utils/question_type_extention.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'generic_questionnare_state.dart';
part 'generic_questionnare_cubit.freezed.dart';

class GenericQuestionnareCubit extends Cubit<GenericQuestionnareState> {
  GenericQuestionnareCubit() : super(const GenericQuestionnareState());

  // go next question
  Future addStep(
      {bool isOnboardingQuestionnare = false, ActionModel? actionModel}) async {
    emit(state.copyWith(currentStep: state.currentStep + 1));
  }

  // back question
  void removeStep() {
    if (state.currentStep == 0) return;

    emit(state.copyWith(currentStep: state.currentStep - 1));
  }

  //save questionnare {generally this using for multiple question}
  saveQuestionnaire(QuestionModel question) async {
    emit(state.copyWith(status: StatusCubit.LOADING));
    if (state.currentStep >=
        locator<QuestionnareCubit>().state.questionnaire!.questions!.length -
            1) {
      await locator<QuestionnareCubit>().saveQuestionnaire(true);
      if (locator<QuestionnareCubit>().state.questionnaire?.isFinished ??
          false) {
        DanaAnalyticsService.submitForm(
            locator<QuestionnareCubit>().state.questionnaire?.questionnaireId ??
                "",
            locator<QuestionnareCubit>()
                    .state
                    .questionnaire
                    ?.userQuestionnaireId ??
                "",
            locator<QuestionnareCubit>().state.statements ?? []);
        await tryEndQuestionnaire(
          true,
        );
      }
    }
    addStep(isOnboardingQuestionnare: true);
    emit(state.copyWith(status: StatusCubit.INITIAL));
  }

  //reset all questionnare on state
  resetOnboardingQuestionnare() async {
    emit(state.copyWith(currentStep: 0));
    await locator<QuestionnareCubit>().resetQuestionnare();
  }

  //answer single question
  answerQuestion(QuestionModel question, Object answer,
      {bool isNewQuestionnare = false,
      bool isOnboardingQuestionnare = false,
      ActionModel? actionModel}) async {
    emit(state.copyWith(status: StatusCubit.LOADING));

    if (locator<QuestionnareCubit>().state.questionnaire != null) {
      if (state.currentStep >=
          locator<QuestionnareCubit>().state.questionnaire!.questions!.length -
              1) {
        // if question is last one end the questionnare after answering
        await locator<QuestionnareCubit>()
            .answerQuestion(question, answer, true);
        if (locator<QuestionnareCubit>().state.questionnaire?.isFinished ??
            false) {
          DanaAnalyticsService.submitForm(
              locator<QuestionnareCubit>()
                      .state
                      .questionnaire
                      ?.questionnaireId ??
                  "",
              locator<QuestionnareCubit>()
                      .state
                      .questionnaire
                      ?.userQuestionnaireId ??
                  "",
              locator<QuestionnareCubit>().state.statements ?? []);
          await tryEndQuestionnaire(isOnboardingQuestionnare,
              questionModel: actionModel);
        }
      } else {
        await locator<QuestionnareCubit>()
            .answerQuestion(question, answer, false);
      }
    }
    // if this new questionnare its not add a new step. Its show new questionnare
    // if we are add new step questionnare will be end because this question is the last one
    if (!isNewQuestionnare) {
      await addStep(
          isOnboardingQuestionnare: isOnboardingQuestionnare,
          actionModel: actionModel);
    }
    emit(state.copyWith(status: StatusCubit.INITIAL));
  }

  //end questionanre if our question is last one and if we have not new quesition
  tryEndQuestionnaire(bool isOnboardingQuestionnare,
      {ActionModel? questionModel}) async {
    emit(state.copyWith(status: StatusCubit.LOADING));
    //  await locator<QuestionnareCubit>().endQuestionnaire();
    if (questionModel?.type == "OPEN_DIAL") {
      await launchUrlString("tel:${questionModel?.extraData}");
    }
    String? redirectUrl =
        await locator<QuestionnareCubit>().state.questionnaire?.redirectUrl;
    await resetOnboardingQuestionnare();
    if (redirectUrl != null) {
      goRouter.pop();
      await locator<DeeplinkCubit>().openLink(deeplink: Uri.parse(redirectUrl));
      return;
    }

    if (isOnboardingQuestionnare) {
      goRouter.goNamed(AppRoutes.onboardingQuestionnareSuccessPage.name);
    } else {
      if (questionModel?.type == "NEW_QUESTIONNAIRE") {
        //await locator<GenericQuestionnareCubit>().resetOnboardingQuestionnare();
        await locator<GenericQuestionnareCubit>()
            .startGenericQuestionnare(questionnareId: questionModel?.extraData);
      }
      if (questionModel?.type == "DEEPLINK") {
        goRouter.pop();
        await locator<DeeplinkCubit>()
            .openLink(deeplink: Uri.parse(questionModel!.extraData.toString()));
      } else {
        goRouter.pushNamed(AppRoutes.home.name);
      }
    }
    emit(state.copyWith(status: StatusCubit.INITIAL));
  }

  // When flow complated
  complateOnboardingQuestionnare() async {
    locator<QuestionNewHomeCubit>().changeShowProfileQuestion(false);
    await locator<InitialProfileCubit>().updateOnboardingComplete();
    goRouter.pushNamed(AppRoutes.home.name);
    locator<DeeplinkCubit>().checkPendingDynamicLink();
    await locator<InitialProfileCubit>().getUserByEmail();
    emit(state.copyWith(status: StatusCubit.SUCCESS));
  }

  // start brand new questioanre
  Future startGenericQuestionnare(
      {QuestionnareType? questionType,
      String? questionnareId,
      String? reason}) async {
    emit(state.copyWith(status: StatusCubit.LOADING));
    await locator<QuestionnareCubit>().startQuestionnare(
        questionnareType: questionType,
        questionnareId: questionnareId,
        forceUpdateState: true,
        reason: reason);
    locator<StartAppCubit>().setQuestionnaireId(questionnareId);
    emit(state.copyWith(status: StatusCubit.INITIAL, currentStep: 0));
  }

  trackShowQuestion(QuestionModel questionModel) {
    if (state.currentQuestionId != questionModel.questionId) {
      DanaAnalyticsService.trackShowQuestion(
          questionModel.questionId ?? "", questionModel.description ?? "");
    }

    emit(state.copyWith(currentQuestionId: questionModel.questionId));
  }
}
