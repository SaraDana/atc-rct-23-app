import 'package:app/cubits/questionnare/questionnare_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/mood_question/questionnaires_model.dart';
import 'package:app/widgets/quesitons/generic_question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/di/locator.dart';
import '../../cubits/user_mood/user_mood_cubit.dart';
import '../../styles/dana_theme.dart';
import '../../utils/images.dart';
import '../../utils/screen_size.dart';

class TextQuestionWidget extends GenericQuestionWidget {
  late TextEditingController commentController;

  TextQuestionWidget({super.key, super.question, super.statement});

  @override
  Widget build(BuildContext context) {
    if (question == null) return Container();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        transform: Matrix4.translationValues(0.0, -20.0, 0.0),
        child: Text(
          (question?.title ?? "").toString(),
          style: DanaTheme.textSubHeadlineBold(DanaTheme.paletteDarkBlue),
          textAlign: TextAlign.left,
        ),
      ),
      TextFormField(
        initialValue: statement?.value,
        validator: (String? value) {
          if (value!.isEmpty) {
            return S.of(context).moodTrackerDialogWidgetWriteSomething;
          }
          return null;
        },
        onChanged: (val) {
          if (question != null)
            locator<QuestionnareCubit>()
                .onTextFiledChanged(question!, val);
        },
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        maxLength: 1000,
        decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: DanaTheme.formFieldBorderColor,
                  width: DanaTheme.formFieldBorderWidth),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: DanaTheme.formFieldFocusedBorderColor,
                  width: DanaTheme.formFieldBorderWidth),
            ),
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: question?.description),
      ),
    ]);
  }
}
