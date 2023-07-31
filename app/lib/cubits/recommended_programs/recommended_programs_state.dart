part of 'recommended_programs_cubit.dart';

enum StatusRecommendedPrograms {
  USER_STARTED_PROGRAMS,
  USER_NOT_STARTED_PROGRAMS,
  USER_END_PROGRAMS
}

class RecommendedProgramsState {
  final List<RecommendedProgramModel> recommendedPrograms;
  final RecommendedProgramModel todayRecommendedProgram;
  final RecommendedPostModel todayRecommendedPost;
  final StatusRecommendedPrograms statusRecommendedPrograms;
  final VitalMomentRecommendedPostModel? pregnancyRecommendedPost;
  final VitalMomentRecommendedPostModel? motherRecommendedPost;

  RecommendedProgramsState(
      {required this.recommendedPrograms,
      required this.todayRecommendedProgram,
      required this.todayRecommendedPost,
      required this.statusRecommendedPrograms,
      this.pregnancyRecommendedPost,
      this.motherRecommendedPost});

  factory RecommendedProgramsState.initial() {
    return RecommendedProgramsState(
      recommendedPrograms: [],
      todayRecommendedProgram: RecommendedProgramModel(),
      todayRecommendedPost: RecommendedPostModel(),
      statusRecommendedPrograms:
          StatusRecommendedPrograms.USER_NOT_STARTED_PROGRAMS,
    );
  }

  RecommendedProgramsState copyWith({
    List<RecommendedProgramModel>? recommendedPrograms,
    RecommendedProgramModel? todayRecommendedProgram,
    RecommendedPostModel? todayRecommendedPost,
    StatusRecommendedPrograms? statusRecommendedPrograms,
    VitalMomentRecommendedPostModel? pregnancyRecommendedPost,
    VitalMomentRecommendedPostModel? motherRecommendedPost,
  }) {
    return RecommendedProgramsState(
      recommendedPrograms: recommendedPrograms ?? this.recommendedPrograms,
      todayRecommendedProgram:
          todayRecommendedProgram ?? this.todayRecommendedProgram,
      todayRecommendedPost: todayRecommendedPost ?? this.todayRecommendedPost,
      statusRecommendedPrograms:
          statusRecommendedPrograms ?? this.statusRecommendedPrograms,
      pregnancyRecommendedPost:
          pregnancyRecommendedPost ?? this.pregnancyRecommendedPost,
      motherRecommendedPost:
          motherRecommendedPost ?? this.motherRecommendedPost,
    );
  }

  RecommendedProgramsState copyWithoutPregnancyRecommendedPost(){
    return RecommendedProgramsState(
      recommendedPrograms: recommendedPrograms,
      todayRecommendedProgram:
      todayRecommendedProgram ,
      todayRecommendedPost: todayRecommendedPost ,
      statusRecommendedPrograms:
      statusRecommendedPrograms,
      pregnancyRecommendedPost:
      null ,
      motherRecommendedPost:
      motherRecommendedPost,
    );
  }

  RecommendedProgramsState copyWithoutMotherRecommendedPost(){
    return RecommendedProgramsState(
      recommendedPrograms: recommendedPrograms,
      todayRecommendedProgram:
      todayRecommendedProgram ,
      todayRecommendedPost: todayRecommendedPost ,
      statusRecommendedPrograms:
      statusRecommendedPrograms,
      pregnancyRecommendedPost:
      pregnancyRecommendedPost ,
      motherRecommendedPost:
      null,
    );
  }
}
