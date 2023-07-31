import 'dart:io';

import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/interested_event_enum.dart';
import 'package:app/core/enums/questionare_enum.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:app/core/error/failures.dart';
import 'package:app/cubits/interested_event/interested_event_cubit.dart';
import 'package:app/cubits/questionnare/questionnare_state.dart';
import 'package:app/data/repositories/question/question_repository_impl.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/models/mood_question/question_model.dart';
import 'package:app/models/mood_question/question_statement_model.dart';
import 'package:app/models/mood_question/questionnaires_model.dart';
import 'package:app/models/show_questionnare_model.dart';
import 'package:app/utils/question_type_extention.dart';
import 'package:country_codes/country_codes.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';

class QuestionnareCubit extends Cubit<QuestionnareState> {
  QuestionnareCubit() : super(QuestionnareState());

  // this method reset the ıur stuation. When the questionanare complated,
  //it will be succes. After that it will be initial.
  setInitial() {
    emit(
      state.copyWith(
          status: StatusCubit.INITIAL,
          questionnareEnum: QuestionareEnum.INITIAL,
          questionnareComplated: false,
          saveButtonIsActive: false),
    );
  }

  resetQuestionnare() {
    emit(state.copyWith(
      status: StatusCubit.INITIAL,
      saveButtonIsActive: false,
      questionnareComplated: false,
      errorMessage: null,
      questionnaire: null,
      statements: null,
      questionnareEnum: null,
    ));
  }

  Future<ShowQuestionnareModel?> getQustionnareIdToShow() async {
    Either<Failure, ShowQuestionnareModel> getQuestionnaireIdToShowFold =
        await QuestionRepositoryImpl().getQuestionnaireIdToShow(
      FirebaseAuth.instance.currentUser?.uid,
      FirebaseAuth.instance.currentUser?.email,
    );

    return getQuestionnaireIdToShowFold.fold((Failure l) {
      emit(
        state.copyWith(
            status: StatusCubit.ERROR,
            questionnareEnum: QuestionareEnum.ERROR,
            errorMessage: l.toString()),
      );
    }, (ShowQuestionnareModel r) {
      return r;
    });
  }

  Future<String?> getCountryCode() async {
    try {
      await CountryCodes.init();
      final Locale? deviceLocale = CountryCodes.getDeviceLocale();
      return deviceLocale?.countryCode;
    } catch (e) {
      print('Failed to get SIM country code: $e');
      return null;
    }
  }

  // this function will be call startQuestionnare api.
  startQuestionnare(
      {QuestionnairesModel? questionnairesModel,
      QuestionnareType? questionnareType,
      String? questionnareId,
      bool forceUpdateState = false,
      String? reason}) async {
    try {
      //if our questionnaire is null then call api
      if ((state.questionnaire == null && questionnairesModel == null) ||
          forceUpdateState) {
        print("questionnaire is null and its getting start new questionnaire");
        emit(
          state.copyWith(
              status: StatusCubit.LOADING,
              questionnareEnum: QuestionareEnum.LOADING,
              saveButtonIsActive: false),
        );
        String? countryCode = await getCountryCode();

        print("Country Code:  $countryCode");
        Either<Failure, QuestionnairesModel> startQuestionnareFold =
            await QuestionRepositoryImpl().startQuestionnare(
                FirebaseAuth.instance.currentUser?.uid,
                FirebaseAuth.instance.currentUser?.email,
                countryCode ?? "",
                questionnareId: questionnareId,
                questionnaireCode: questionnareType?.name,
                reason: reason);

        print("startQuestionnare bitti ve foldlanacak");

        startQuestionnareFold.fold((Failure l) {
          emit(
            state.copyWith(
                status: StatusCubit.ERROR,
                questionnareEnum: QuestionareEnum.ERROR,
                errorMessage: l.toString()),
          );
        }, (r) {
          print("startQuestionnare bitti ve foldlandı");
          DanaAnalyticsService.trackShowForm(
              r.questionnaireId ?? "", r.userQuestionnaireId ?? "");
          emit(
            state.copyWith(
              questionnareEnum: QuestionareEnum.INITIAL,
              questionnaire: r,
            ),
          );
        });
      } else {
        print("questionnaire is not null and its use same questionnaire");

        if (questionnairesModel != null) {
          DanaAnalyticsService.trackShowForm(
              questionnairesModel.questionnaireId ?? "",
              questionnairesModel.userQuestionnaireId ?? "");

          emit(
            state.copyWith(
                questionnaire: questionnairesModel,
                statements: questionnairesModel.statements,
                saveButtonIsActive: false),
          );
        }
        // We have already has a questionnare on our state
      }
    } catch (e) {
      print("UserMoodCubit / startQuestionnare $e");
    }
  }

  answerQuestion(
      QuestionModel question, Object answer, bool tryEndQuestionnaire) async {
    emit(
      state.copyWith(
        questionnareEnum: QuestionareEnum.LOADING,
      ),
    );

    QuestionStatementModel statement = QuestionStatementModel(
      questionId: question.questionId,
      value: answer,
    );

    DanaAnalyticsService.submitQuestionAnswer(statement);

    List<QuestionStatementModel> statements = [];
    statements.add(statement);

    await _sendQuestionToApi(statements, question.type != "MOOD",
        question: question, tryEndQuestionnaire: tryEndQuestionnaire);
  }

  Future _sendQuestionToApi(
    List<QuestionStatementModel> statement,
    bool isCameFromSaveButton, {
    QuestionModel? question,
    required bool tryEndQuestionnaire,
  }) async {
    print("_sendQuestionToApi Çalişti.....");
    Either<Failure, QuestionnairesModel> answerFold =
        await _request(statement, tryEndQuestionnaire);

    if (question != null && question.type == "MOOD" && !isCameFromSaveButton) {
      answerFold.fold((Failure moodQuestionLeftData) {},
          (QuestionnairesModel moodQuestionRightData) async {
        final List<QuestionStatementModel> list = [];

        QuestionStatementModel? questionStatementModel = state.statements
            ?.firstWhereOrNull((element) => element.value is String);
        if (questionStatementModel != null) {
          list.add(questionStatementModel);
        }

        emit(
          state.copyWith(
              questionnaire: moodQuestionRightData,
              statements: list,
              saveButtonIsActive: false,
              questionnareEnum: QuestionareEnum.INITIAL,
              status: StatusCubit.SUCCESS),
        );
      });
    } else {
      if (isCameFromSaveButton) {
        answerFold.fold((l) {
          emit(
            state.copyWith(
                status: StatusCubit.ERROR,
                questionnareEnum: QuestionareEnum.ERROR,
                errorMessage: l.toString()),
          );
        }, (r) {
          emit(
            state.copyWith(
                status: StatusCubit.SUCCESS,
                questionnareEnum: QuestionareEnum.SUCCESS,
                questionnareComplated: true,
                questionnaire: r),
          );
        });
      }
    }
  }

  Future<Either<Failure, QuestionnairesModel>> _request(
      List<QuestionStatementModel?> statements,
      bool tryEndQuestionnaire) async {
    return await QuestionRepositoryImpl().answerQuestion(
        state.questionnaire?.userQuestionnaireId,
        FirebaseAuth.instance.currentUser?.uid,
        FirebaseAuth.instance.currentUser?.email,
        statement: statements,
        tryEndQuestionnaire: tryEndQuestionnaire);
  }

  saveQuestionnaire(tryEndQuestionnaire) async {
    if (!isQuestionnaireCompleted()) {
      emit(
        state.copyWith(
          status: StatusCubit.CHARGE_ERROR,
          errorMessage: "¡Por favor, no deje un área vacía!",
          questionnareEnum: QuestionareEnum.INITIAL,
        ),
      );
      emit(
        state.copyWith(
          status: StatusCubit.INITIAL,
          errorMessage: null,
          questionnareEnum: QuestionareEnum.INITIAL,
        ),
      );
      return;
    }
    await _answerQuestionnaireOnSaveButtonPressed(true, tryEndQuestionnaire);
  }

  _answerQuestionnaireOnSaveButtonPressed(
      bool isCameFromSaveButton, tryEndQuestionnaire) async {
    try {
      // lets start to answer
      emit(
        state.copyWith(
          status: StatusCubit.LOADING,
          questionnareEnum: QuestionareEnum.LOADING,
        ),
      );
      // answer all the questions

      await _sendQuestionToApi(state.statements!, isCameFromSaveButton,
          tryEndQuestionnaire: tryEndQuestionnaire);
    } catch (e) {
      print("UserMoodCubit / _answerQuestionnaireOnSaveButtonPressed $e");
      emit(
        state.copyWith(
          status: StatusCubit.ERROR,
          questionnareEnum: QuestionareEnum.ERROR,
        ),
      );
    }
  }

  isQuestionnaireCompleted() {
    // quesitionnare is null then return true
    if (state.questionnaire?.questions == null) return false;
    // else look for all questions
    for (QuestionModel question in state.questionnaire!.questions!) {
      QuestionStatementModel? relatedAnswer = state.statements
          ?.firstWhereOrNull(
              (element) => element.questionId == question.questionId);
      if (!isQuestionAnsweredOrOptional(question, relatedAnswer)) return false;
    }
    return true;
  }

  bool isQuestionAnsweredOrOptional(
      QuestionModel question, QuestionStatementModel? answer) {
    if (question.isOptional ??
        false ||
            question.type?.convertQuestionTypeToEnum() !=
                QuestionTypeEnum.MULTI) {
      return true;
    }
    return isQuestionAnswered(question, answer);
  }

  bool isQuestionAnswered(
      QuestionModel question, QuestionStatementModel? answer) {
    if (answer == null) {
      return false;
    }
    if (question.type?.convertQuestionTypeToEnum() == QuestionTypeEnum.MULTI) {
      int answers = answer.innerStatements
              ?.where((element) => element.value == true)
              .length ??
          0;
      if (question.max != null && answers > question.max!) return false;
      if (question.min != null && answers < question.min!) return false;
    }
    return answer.value != null;
  }

  updateStateHomeMoodtrackerButtonIsActive() {
    if (isQuestionnaireCompleted()) {
      emit(
        state.copyWith(saveButtonIsActive: true),
      );
    } else {
      emit(
        state.copyWith(saveButtonIsActive: false),
      );
    }
  }

  onYesNoQuestionSelected(QuestionModel? question, bool value) {
    final List<QuestionStatementModel> list =
        state.statements == null ? [] : [...state.statements!];

    QuestionStatementModel? questionStatement = list.firstWhereOrNull(
      (element) => element.questionId == question!.questionId,
    );

    if (questionStatement != null) {
      list.remove(questionStatement);
    }

    list.add(
        QuestionStatementModel(questionId: question!.questionId, value: value));

    emit(state.copyWith(statements: list));
  }

  onInnerStatementSelected(
      QuestionModel? question, String selectedInnerQuestionId) {
    final List<QuestionStatementModel> list =
        state.statements == null ? [] : [...state.statements!];

    QuestionStatementModel? questionStatement = list.firstWhereOrNull(
        (element) => element.questionId == question!.questionId);

    // if there is a  statement for this user
    if (questionStatement != null) {
      QuestionStatementModel? innerQuestionStatement =
          questionStatement.innerStatements!.firstWhereOrNull(
              (element) => element.questionId == selectedInnerQuestionId);

      if (innerQuestionStatement != null) {
        list.removeWhere(
            (element) => element.questionId == questionStatement.questionId);

        QuestionStatementModel questionStatementModel = QuestionStatementModel(
          questionId: questionStatement.questionId,
          value: true,
          innerStatements: questionStatement.innerStatements,
        );

        questionStatementModel.innerStatements!.removeWhere((element) =>
            element.questionId == innerQuestionStatement.questionId);
        list.add(questionStatementModel);
      } else {
        list.removeWhere(
            (element) => element.questionId == questionStatement.questionId);

        QuestionStatementModel questionStatementModel = QuestionStatementModel(
          questionId: questionStatement.questionId,
          value: true,
          innerStatements: questionStatement.innerStatements,
        );

        if (question!.max != null &&
            questionStatementModel.innerStatements!.length >= question.max!) {
          if (question.max != 1) return false;

          if (question.max == 1) {
            questionStatementModel.innerStatements!.clear();
          }
        }

        questionStatementModel.innerStatements!.add(QuestionStatementModel(
            questionId: selectedInnerQuestionId, value: true));
        list.add(questionStatementModel);
      }
    }
    // else there is no any statement for this user
    else {
      list.add(
        QuestionStatementModel(
          questionId: question!.questionId,
          value: true,
          innerStatements: [
            QuestionStatementModel(
                questionId: selectedInnerQuestionId, value: true)
          ],
        ),
      );
    }

    emit(state.copyWith(statements: list));

    updateStateHomeMoodtrackerButtonIsActive();
  }

  bool isInnerQuestionPositive(QuestionModel question, String innerQuestionId) {
    if (state.statements != null) {
      QuestionStatementModel? questionStatement =
          state.statements!.firstWhereOrNull(
        (element) => element.questionId == question.questionId,
      );

      if (questionStatement != null) {
        QuestionStatementModel? innerQuestionStatement =
            questionStatement.innerStatements!.firstWhereOrNull(
                (element) => element.questionId == innerQuestionId);

        if (innerQuestionStatement != null) {
          return true;
        }
        return false;
      }
    }
    return false;
  }

  onTextFiledChanged(
    QuestionModel question,
    String answer,
  ) {
    final List<QuestionStatementModel> list =
        state.statements == null ? [] : [...state.statements!];
    QuestionStatementModel? questionStatement = list.firstWhereOrNull(
        (element) => element.questionId == question.questionId);

    // if there is a  statement for this user
    if (questionStatement != null) {
      list.removeWhere(
          (element) => element.questionId == questionStatement.questionId);

      QuestionStatementModel questionStatementModel = QuestionStatementModel(
        questionId: questionStatement.questionId,
        value: answer,
      );

      list.add(questionStatementModel);
    } else {
      list.add(
        QuestionStatementModel(
          questionId: question.questionId,
          value: answer,
        ),
      );
    }

    print("Will be emit");
    emit(state.copyWith(statements: list));
  }

  /* endQuestionnaire() async {
    try {
      Either<Failure, QuestionnairesModel?> endQuestionnareFold =
          await QuestionRepositoryImpl().endQuestionnaire(
              state.questionnaire?.userQuestionnaireId,
              FirebaseAuth.instance.currentUser?.uid);

      endQuestionnareFold.fold((Failure l) {
        emit(
          state.copyWith(
              status: StatusCubit.ERROR,
              questionnareEnum: QuestionareEnum.ERROR,
              errorMessage: l.toString()),
        );
      }, (r) {
        emit(
          state.copyWith(questionnaire: r),
        );
        print("Questionnare ending succesfully");
      });
    } catch (e) {
      print("UserMoodCubit / endQuestionnaire $e");
    }
  }*/
}
