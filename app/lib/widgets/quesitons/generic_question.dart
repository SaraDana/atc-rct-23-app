import 'package:app/generated/l10n.dart';
import 'package:app/models/mood_question/question_model.dart';
import 'package:app/models/mood_question/questionnaires_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/di/locator.dart';
import '../../cubits/user_mood/user_mood_cubit.dart';
import '../../models/mood_question/question_statement_model.dart';
import '../../styles/dana_theme.dart';
import '../../utils/images.dart';
import '../../utils/screen_size.dart';

abstract class GenericQuestionWidget extends StatelessWidget {

  QuestionModel? question;
  QuestionStatementModel? statement;

  GenericQuestionWidget({
    super.key,
    this.question,
    this.statement
  });
}