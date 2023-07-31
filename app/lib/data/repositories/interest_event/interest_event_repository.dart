import 'package:app/core/enums/interested_event_enum.dart';
import 'package:app/core/error/failures.dart';
import 'package:app/models/mood_question/inner_question_statement_model.dart';
import 'package:app/models/mood_question/question_statement_model.dart';
import 'package:app/models/mood_question/questionnaires_model.dart';
import 'package:dartz/dartz.dart';

abstract class InterestedEventRepository {
  Future<Either<Failure, bool>> eventOfInterestHappened(
      String? userId,
      String? email,
      EventOfInterestedType eventOfInterestedType,
      Map<String, String> details);
}
