import 'package:app/core/enums/status_cubit.dart';
import 'package:app/cubits/questionnare/questionnare_cubit.dart';
import 'package:app/cubits/questionnare/questionnare_state.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/generic_questionnare/cubit/onboarding_questionnare/generic_questionnare_cubit.dart';
import 'package:app/models/mood_question/question_statement_model.dart';
import 'package:app/utils/question_type_extention.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/ui/widgets/layouts/carrousel_layout.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/widgets/quesitons/action_question.dart';
import 'package:app/widgets/quesitons/invima_information_question.dart';
import 'package:app/widgets/quesitons/yes_no_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:app/features/generic_questionnare/widget/generic_questionnare_multiple_question_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenericQuestionnareHomePage extends StatelessWidget {
  const GenericQuestionnareHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: DanaTheme.paletteLightGrey,
          body: BlocBuilder<GenericQuestionnareCubit, GenericQuestionnareState>(
            bloc: locator<GenericQuestionnareCubit>(),
            buildWhen: (previous, current) =>
                previous.status != current.status ||
                previous.currentStep != current.currentStep,
            builder: (context, genericQuestionnareState) {
              if (genericQuestionnareState.status == StatusCubit.LOADING) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: CircularProgressIndicator(
                          color: DanaTheme.paletteFOrange,
                        ),
                      ),
                      16.h.verticalSpace,
                      Text(
                        S.of(context).loadingScreenText,
                        style: DanaTheme.bannerTitle1.copyWith(fontSize: 16.sp),
                      ),
                    ],
                  ),
                );
              }

              return BlocBuilder<QuestionnareCubit, QuestionnareState>(
                bloc: locator<QuestionnareCubit>(),
                builder: (context, state) {
                  if (state.questionnaire == null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: CircularProgressIndicator(
                              color: DanaTheme.paletteFOrange,
                            ),
                          ),
                          16.h.verticalSpace,
                          Text(
                            S.of(context).loadingScreenText,
                            style: DanaTheme.bannerTitle1
                                .copyWith(fontSize: 16.sp),
                          ),
                        ],
                      ),
                    );
                  }
                  // We need to handle Empty State
                  if (state.questionnaire!.questions == null) {
                    return Center(
                      child: Text("Questionnare is empty!"),
                    );
                  }

                  return CarouselLayout(
                    isOnboardingQuestionnare: false,
                    bgColor: DanaTheme.paletteLightGrey,
                    onTapBack: () =>
                        locator<GenericQuestionnareCubit>().removeStep(),
                    totalValue: state.questionnaire!.questions!
                        .where((e) => e.type == "YES_NO" || e.type == "MULTI")
                        .toList()
                        .length,
                    actualStep: genericQuestionnareState.currentStep,
                    content: state.questionnaire!.questions!.map((e) {
                      if (e.questionId ==
                          state
                              .questionnaire!
                              .questions?[genericQuestionnareState.currentStep]
                              .questionId) {
                        locator<GenericQuestionnareCubit>()
                            .trackShowQuestion(e);
                      }
                      if (e.type == QuestionTypeEnum.MULTI.name)
                        return WidgetWithCallback(
                            isStepQuestion: true,
                            title: e.title,
                            description: e.description,
                            widget: GenericQuestionnareMultiQuestionWidget(
                              question: e,
                            ),
                            validation:
                                state.statements?.firstWhereOrNull((element) {
                                      return element.questionId == e.questionId;
                                    }) !=
                                    null,
                            onTap: () async {
                              QuestionStatementModel? statement =
                                  state.statements?.firstWhereOrNull((element) {
                                return element.questionId == e.questionId;
                              });

                              if (statement != null) {
                                DanaAnalyticsService.submitQuestionAnswer(
                                    statement);
                              }
                              await locator<GenericQuestionnareCubit>()
                                  .saveQuestionnaire(e);
                            });

                      if (e.type == QuestionTypeEnum.YES_NO.name)
                        return WidgetWithCallback(
                            isStepQuestion: true,
                            title: e.title,
                            description: e.description,
                            widget: YesNoQuestionWidget(
                              question: e,
                            ),
                            validation:
                                state.statements?.firstWhereOrNull((element) {
                                      return element.questionId == e.questionId;
                                    }) !=
                                    null,
                            onTap: () async {
                              QuestionStatementModel? statement =
                                  state.statements?.firstWhereOrNull((element) {
                                return element.questionId == e.questionId;
                              });

                              if (statement != null) {
                                DanaAnalyticsService.submitQuestionAnswer(
                                    statement);
                              }

                              await locator<GenericQuestionnareCubit>()
                                  .saveQuestionnaire(e);
                            });

                      if (e.type == QuestionTypeEnum.ACTION.name)
                        return WidgetWithCallback(
                            title: e.title,
                            description: e.description,
                            isStepQuestion: false,
                            widget: ActionQuestionWidget(
                              question: e,
                            ),
                            validation:
                                state.statements?.firstWhereOrNull((element) {
                                      return element.questionId == e.questionId;
                                    }) !=
                                    null,
                            onTap: () async {});

                      if (e.type == QuestionTypeEnum.INVIMA_INFORMATION.name)
                        return WidgetWithCallback(
                            title: e.title,
                            description: e.description,
                            isStepQuestion: false,
                            widget: InvimaInformationQuestionWidget(
                              question: e,
                            ),
                            validation:
                                state.statements?.firstWhereOrNull((element) {
                                      return element.questionId == e.questionId;
                                    }) !=
                                    null,
                            onTap: () async {});

                      return WidgetWithCallback(
                          widget: Container(
                            child: Center(
                              child: Text(
                                "This type not implemented yet ${e.type}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.sp),
                              ),
                            ),
                          ),
                          validation: false);
                    }).toList(),
                    nextStepButtonText:
                        S.of(context).screenInitialProfilePagesButtonNext,
                    previousStepButtonText: '',
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
