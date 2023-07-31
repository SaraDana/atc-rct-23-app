import 'package:flutter_bloc/flutter_bloc.dart';

part 'question_new_home_state.dart';

class QuestionNewHomeCubit extends Cubit<QuestionNewHomeState> {
  QuestionNewHomeCubit() : super(QuestionNewHomeState.initial());

  void changeInitialProfile(bool initialProfile) {
    final newState = state.copyWith(initialProfile: initialProfile);
    emit(newState);
  }

  void changeShowProfileQuestion(bool showProfileQuestion) {
    final newState = state.copyWith(showProfileQuestion: showProfileQuestion);
    emit(newState);
  }

  void changeShowMoodQuestion(bool showMoodQuestion) {
    final newState = state.copyWith(showMoodQuestion: showMoodQuestion);
    emit(newState);
  }
}
