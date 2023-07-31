import 'package:app/core/enums/interested_event_enum.dart';
import 'package:app/core/enums/questionare_enum.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:app/core/error/failures.dart';
import 'package:app/cubits/questionnare/questionnare_state.dart';
import 'package:app/data/repositories/interest_event/interest_event_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InterestedEventCubit extends Cubit<QuestionnareState> {
  InterestedEventCubit() : super(QuestionnareState());

  eventOfInterestHappened(EventOfInterestedType eventOfInterestedType,
      Map<String, String> details) async {
    print("eventOfInterestHappened called ${eventOfInterestedType.nameOfType}");
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    String? email = FirebaseAuth.instance.currentUser?.email;

    Either<Failure, bool> eventOfInterestHappenedFold =
        await InterestedEventRepositoryImpl().eventOfInterestHappened(
            userId, email, eventOfInterestedType, details);

    eventOfInterestHappenedFold.fold((Failure l) {
      emit(
        state.copyWith(
            status: StatusCubit.ERROR,
            questionnareEnum: QuestionareEnum.ERROR,
            errorMessage: l.toString()),
      );
    }, (bool r) {
      emit(
        state.copyWith(
          questionnareEnum: QuestionareEnum.INITIAL,
        ),
      );
    });
  }
}
