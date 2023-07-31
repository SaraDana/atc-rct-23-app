//IMPORT EXTERN APP
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//IMPORT INTERN APP
import 'package:app/cubits/toggle_show_answer/toggle_show_answer_cubit.dart';
import 'package:app/data/repositories/publication/firebase_publication_repository.dart';
import 'package:app/utils/images.dart';
import 'package:app/models/answer_model.dart';
import 'package:app/models/publication_model.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/widgets/social/social_pin_widget.dart';

class SocialPollWidget extends StatelessWidget {
  final FirebasePublicationRepository _repository =
      FirebasePublicationRepository();
  final String _userId = FirebaseAuth.instance.currentUser!.uid;
  final Publication publication;
  final Function() onSelectionTap;
  final bool isFirstChild;
  final bool isPinned;

  SocialPollWidget({
    Key? key,
    required this.publication,
    required this.onSelectionTap,
    this.isFirstChild = false,
    this.isPinned = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocProvider<ToggleShowAnswerCubit>(
      create: (context) => ToggleShowAnswerCubit(),
      child: BlocBuilder<ToggleShowAnswerCubit, ToggleShowAnswerState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.only(left: 24, right: 24, bottom: 20, top: 20),
            child: Column(
              children: [
                if (isPinned) SocialPinWidget(),
                _buildPollQuestion(
                  context,
                  text: publication.title!,
                  showAnswer: state.showAnswer,
                ),
                SizedBox(height: 10),
                ..._buildPollAnswers(context,
                    screenSize: screenSize, showAnswer: state.showAnswer),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPollQuestion(
    BuildContext context, {
    required String text,
    required bool showAnswer,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text,
            style: DanaTheme.textBodyBold(DanaTheme.paletteDarkBlue),
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        (publication.isSelected(_userId))
            ? Container(
                height: 26,
                width: 30,
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                    color: DanaTheme.lightGrayColor,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: buildSvgImage('eye_open_icon.svg'),
              )
            : GestureDetector(
                onTap: () {
                  DanaAnalyticsService.trackPublicationSpyEyeClick(
                      publication.id!, !showAnswer);
                  context.read<ToggleShowAnswerCubit>().toggleAnswer();
                },
                child: Container(
                  height: 26,
                  width: 30,
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: DanaTheme.lightGrayColor,
                      ),
                      color: DanaTheme.lightGrayColor,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: (showAnswer == true)
                      ? buildSvgImage('eye_open_icon.svg')
                      : buildSvgImage('eye_close_icon.svg'),
                ),
              ),
      ],
    );
  }

  List<Widget> _buildPollAnswers(
    BuildContext context, {
    required Size screenSize,
    required bool showAnswer,
  }) {
    List<Widget> widgets = [];

    if (publication.isSelected(_userId) || (showAnswer == true)) {
      for (final answer in publication.answers)
        widgets.add(_buildAnswerResult(
            screenSize: screenSize,
            publication: publication,
            answer: answer,
            showAnswer: showAnswer));
    } else {
      for (final answer in publication.answers)
        widgets
            .add(_buildAnswerOption(context, screenSize, publication, answer));
    }

    return widgets;
  }

  Widget _buildAnswerResult({
    required Size screenSize,
    required Publication publication,
    required Answer answer,
    required bool showAnswer,
  }) {
    return Container(
      width: screenSize.width,
      constraints: BoxConstraints(
        minHeight: 54,
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: DanaTheme.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: DanaTheme.paletteGreyShadow.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 15,
            offset: Offset(0.0, 0.75), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          if (publication.isSelected(_userId) || (showAnswer == true))
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 3,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(80)),
                  child: LinearProgressIndicator(
                    backgroundColor: DanaTheme.paletteGreyTonesLightGrey20,
                    valueColor: AlwaysStoppedAnimation(
                      publication.selection(_userId) == answer.id
                          ? DanaTheme.paletteOrange
                          : DanaTheme.paletteFOrange,
                    ),
                    value: (publication.percentages[answer.id] != null)
                        ? (publication.percentages[answer.id]! / 100).toDouble()
                        : 0.0,
                  ),
                ),
              ),
            ),
          Container(
            constraints: BoxConstraints(
              minHeight: 54,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    answer.text!,
                    maxLines: null,
                    style: DanaTheme.bannerTitle2
                        .copyWith(fontWeight: FontWeight.bold),

                    //DanaTheme.textBodyBold(DanaTheme.paletteDarkBlue),
                  ),
                ),
                Container(
                  width: 8,
                ),
                if (publication.isSelected(_userId) || (showAnswer == true))
                  CircleAvatar(
                    backgroundColor: publication.selection(_userId) == answer.id
                        ? DanaTheme.paletteOrange
                        : DanaTheme.paletteFOrange,
                    child: Text(
                      '${publication.percentages[answer.id]}%',
                      style: DanaTheme.textPercent,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerOption(BuildContext context, Size screenSize,
      Publication publication, Answer answer) {
    return Container(
      width: screenSize.width,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.only(left: 14, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: DanaTheme.paletteWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: DanaTheme.paletteGreyShadow.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0.0, 0.75), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              answer.text!,
              maxLines: null,
              style:
                  DanaTheme.bannerTitle2.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Radio<String?>(
            activeColor: DanaTheme.paletteDanaPink,
            groupValue: publication.id,
            value: answer.id,
            onChanged: (String? answerId) async {
              DanaAnalyticsService.trackCommunityPollAnswered(publication.id);
              final selection =
                  await _repository.setSelection(publication.id, answerId);
              answer.selections.add(selection);
              publication.refreshPercentages();
              onSelectionTap();
              context.read<ToggleShowAnswerCubit>().toggleAnswer();
            },
          ),
        ],
      ),
    );
  }
}
