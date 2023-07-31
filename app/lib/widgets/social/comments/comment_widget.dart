import 'package:app/cubits/complete_comment/complete_comment_cubit.dart';
import 'package:app/features/deeplinks/app/cubits/deep_links/deeplink_cubit.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/core/di/locator.dart';
import 'package:flutter/material.dart';

import 'package:app/cubits/change_subcomment/change_comment_cubit.dart';
import 'package:app/cubits/toggle_answer_subcomment/toggle_answer_subcomment_cubit.dart';
import 'package:app/models/comment_model.dart';
import 'package:app/models/publication_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/comments/comments.utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentWidget extends StatelessWidget {
  final Comment comment;
  final Publication publication;
  final String _userId = FirebaseAuth.instance.currentUser!.uid;
  final Function() onTapLike;
  final bool isSubcomment;
  CommentWidget({
    Key? key,
    required this.comment,
    required this.publication,
    required this.onTapLike,
    required this.isSubcomment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CompleteCommentCubit>(
          create: (context) => CompleteCommentCubit(),
        ),
      ],
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.account_circle,
              color: DanaTheme.palleteGreyIcon,
              size: 28,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 12),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    decoration: BoxDecoration(
                      color: DanaTheme.whiteColor,
                      border: Border.all(color: DanaTheme.palleteGreyComment),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                        BlocBuilder<CompleteCommentCubit, CompleteCommentState>(
                      builder: (context, stateCompleteComment) {
                        // Build the textspan
                        var span = TextSpan(
                          style: DanaTheme.textCommentText(
                              DanaTheme.paletteDarkBlue),
                          text: comment.text!,
                        );

                        // Use a textpainter to determine if it will exceed max lines
                        var tp = TextPainter(
                          maxLines: 3,
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          text: span,
                        );
                        tp.layout(minWidth: 0.0, maxWidth: 350);

                        // whether the text overflowed or not
                        var exceeded = tp.didExceedMaxLines;

                        return Stack(
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          comment.userName,
                                          style: DanaTheme.textCommentUserName(
                                            DanaTheme.paletteDarkBlue,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Row(
                                        children: [
                                          if (comment.userSpecialistRole != '')
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 2),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xFF528A4F),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                'Experto',
                                                style: TextStyle(
                                                  color: Color(0xFF528A4F),
                                                ),
                                              ),
                                            ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          if (isSubcomment == false)
                                            GestureDetector(
                                              child: Icon(Icons.more_horiz),
                                              onTap: () {
                                                CommentsUtils()
                                                    .showReportCommentDialog(
                                                  context,
                                                  comment: comment,
                                                  publication: publication,
                                                );
                                              },
                                            ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                if (comment.userSpecialistRole != '') ...[
                                  SizedBox(height: 6),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      comment.userSpecialistRole,
                                      style: DanaTheme
                                          .textCommentUserSpecialistRole(
                                              DanaTheme.paletteDarkBlue),
                                    ),
                                  ),
                                ],
                                SizedBox(height: 6),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: (exceeded == true &&
                                          stateCompleteComment
                                                  .showCompleteComment ==
                                              false)
                                      ? Html(
                                          data: comment.text!,
                                          style: {
                                            'body': Style(
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w400,
                                              fontSize: FontSize(16),
                                              maxLines: 3,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                            ),
                                          },
                                        )
                                      : Html(
                                          data: comment.text!,
                                          style: {
                                            'body': Style(
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w400,
                                              fontSize: FontSize(16),
                                            ),
                                          },
                                          onLinkTap: (url, _, __, ___) async {
                                            //TODO
                                            //<a href='https://www.dana.health/programs/Sc3RPsK7V1FHEwzqTiK9'>El mejor programa con www</a>
                                            //<a href="https/dana/publications/pRJo5lmKh9uCKScKlzbA"> abrir publicación. </a>
                                            //<a href="https/dana/programs/Sc3RPsK7V1FHEwzqTiK9"> abrir programa test. </a>
                                            //<a href="https/dana/programs/Sc3RPsK7V1FHEwzqTiK9?show=true"> abrir programa test true. </a>
                                            //<a href="https/dana/programs/Sc3RPsK7V1FHEwzqTiK9?show=false"> abrir programa test false. </a>
                                            DanaAnalyticsService
                                                .trackClickLinkFromCommunity(
                                                    url);
                                            locator<DeeplinkCubit>().openLink(
                                                deeplink: Uri.parse(url ?? ''));
                                          },
                                        ),
                                ),
                                (exceeded == true &&
                                        stateCompleteComment
                                                .showCompleteComment ==
                                            false)
                                    ? SizedBox(
                                        height: 50,
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            timeago.format(comment.date!,
                                                locale: 'es'),
                                            style: DanaTheme.textCommentDate(
                                              DanaTheme.palleteGreyDate,
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(),
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              foregroundColor:
                                                  DanaTheme.whiteColor,
                                              backgroundColor:
                                                  DanaTheme.whiteColor,
                                              disabledForegroundColor: DanaTheme
                                                  .whiteColor
                                                  .withOpacity(0.38),
                                            ),
                                            onPressed: onTapLike,
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: DanaTheme.whiteColor,
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    comment.isLiked(_userId)
                                                        ? Icons.favorite
                                                        : Icons
                                                            .favorite_outline,
                                                    color: comment
                                                            .isLiked(_userId)
                                                        ? DanaTheme.palleteRed
                                                        : DanaTheme
                                                            .paletteDarkBlue,
                                                    size: 14,
                                                  ),
                                                  SizedBox(width: 4),
                                                  Text(
                                                    comment.numLikes
                                                            .toString() +
                                                        " Me gusta",
                                                    style: DanaTheme
                                                        .textCommentText(
                                                      DanaTheme.palleteGreyDate,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(),
                                          ),
                                          if (isSubcomment == false)
                                            TextButton(
                                              onPressed: () {
                                                BlocProvider.of<
                                                            ChangeCommentCubit>(
                                                        context)
                                                    .answerComment(
                                                        selectComment: comment);

                                                BlocProvider.of<
                                                            ToggleAnswerSubcommentCubit>(
                                                        context)
                                                    .canAnswer();
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.reply_outlined,
                                                    size: 20,
                                                    color: DanaTheme
                                                        .palleteGreyDate,
                                                  ),
                                                  SizedBox(width: 4),
                                                  Container(
                                                    height: 20,
                                                    child: Center(
                                                      child: Text(
                                                        'Responder',
                                                        style: DanaTheme
                                                            .textCommentText(
                                                          DanaTheme
                                                              .palleteGreyDate,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                              ],
                            ),
                            if (exceeded == true &&
                                stateCompleteComment.showCompleteComment ==
                                    false)
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                top: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        DanaTheme.whiteColor,
                                        Colors.white10,
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 3,
                                              width: 20,
                                              color: DanaTheme.paletteDarkBlue,
                                            ),
                                            Text(
                                              'Ver comentario completo',
                                              style: TextStyle(
                                                color:
                                                    DanaTheme.paletteDarkBlue,
                                              ),
                                            ),
                                            Container(
                                              height: 3,
                                              width: 20,
                                              color: DanaTheme.paletteDarkBlue,
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          BlocProvider.of<CompleteCommentCubit>(
                                                  context)
                                              .showComment();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
