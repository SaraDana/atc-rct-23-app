import 'package:app/core/di/locator.dart';
import 'package:app/cubits/user_mood/user_mood_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/cubits/change_page/change_page_cubit.dart';
import 'package:app/cubits/collections/collections_cubit.dart';
import 'package:app/cubits/delete_user/delete_user_cubit.dart';
import 'package:app/cubits/premium_dialog/premium_dialog_cubit.dart';
import 'package:app/cubits/publications/publications_cubit.dart';
import 'package:app/cubits/question_new_home/question_new_home_cubit.dart';
import 'package:app/cubits/recommended_programs/recommended_programs_cubit.dart';

class BlocDependency {
  static setBlocs() {
    return <BlocProvider>[
      BlocProvider<PublicationsCubit>(
        create: (context) => PublicationsCubit(),
      ),
      BlocProvider<ChangePageCubit>(
        create: (context) => ChangePageCubit(),
      ),
      BlocProvider<RecommendedProgramsCubit>(
        create: (context) => RecommendedProgramsCubit(),
      ),
      BlocProvider<PremiumDialogCubit>(
        create: (context) => PremiumDialogCubit(),
      ),
      BlocProvider<DeleteUserCubit>(
        create: (context) => DeleteUserCubit(),
      ),
      BlocProvider<QuestionNewHomeCubit>(
        create: (context) => QuestionNewHomeCubit(),
      ),
      BlocProvider<CollectionsCubit>(
        create: (context) => CollectionsCubit(),
      ),
       BlocProvider<UserMoodCubit>(
        create: (context) => locator<UserMoodCubit>()..userMoodInit(isTrackerTutorialSeenInc:true),
      ),
    ];
  }
}
