import 'package:app/models/recommended_post_model.dart';
import 'package:app/models/recommended_program_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/vital_moment_recommended_post_model.dart';

part 'recommended_programs_state.dart';

class RecommendedProgramsCubit extends Cubit<RecommendedProgramsState> {
  RecommendedProgramsCubit() : super(RecommendedProgramsState.initial());

  void addListRecommendedPrograms(
      {required List<RecommendedProgramModel> newPrograms}) {
    final newState = state.copyWith(recommendedPrograms: newPrograms);
    emit(newState);
  }

  void addRecommendedProgram({required RecommendedProgramModel newProgram}) {
    List<RecommendedProgramModel>? recommendedPrograms =
        state.recommendedPrograms;
    recommendedPrograms.add(newProgram);

    final newState = state.copyWith(recommendedPrograms: recommendedPrograms);
    emit(newState);
  }

  void removeRecommendedProgram({required RecommendedProgramModel newProgram}) {
    List<RecommendedProgramModel>? recommendedPrograms =
        state.recommendedPrograms;
    recommendedPrograms.remove(newProgram);

    final newState = state.copyWith(recommendedPrograms: recommendedPrograms);
    emit(newState);
  }

  void addTodayRecommendedProgram(
      {required RecommendedProgramModel newProgram}) {
    final newState = state.copyWith(todayRecommendedProgram: newProgram);
    emit(newState);
  }

  void addTodayRecommendedPost({required RecommendedPostModel newPost}) {
    final newState = state.copyWith(todayRecommendedPost: newPost);
    emit(newState);
  }

  void addMotherRecommendedPost({required VitalMomentRecommendedPostModel newPost}) {
    final newState = state.copyWith(motherRecommendedPost: newPost);
    emit(newState);
  }

  void removeMotherRecommendedPost(){
    final newState = state.copyWithoutMotherRecommendedPost();
    emit(newState);
  }

  void addPregnancyRecommendedPost({required VitalMomentRecommendedPostModel newPost}) {
    final newState = state.copyWith(pregnancyRecommendedPost: newPost);
    emit(newState);
  }

  void removePregnancyRecommendedPost(){
    final newState = state.copyWithoutPregnancyRecommendedPost();
    emit(newState);
  }

  void userStartedPrograms() {
    final newState = state.copyWith(
        statusRecommendedPrograms:
            StatusRecommendedPrograms.USER_STARTED_PROGRAMS);
    emit(newState);
  }

  void userEndPrograms() {
    final newState = state.copyWith(
        statusRecommendedPrograms: StatusRecommendedPrograms.USER_END_PROGRAMS);
    emit(newState);
  }
}
