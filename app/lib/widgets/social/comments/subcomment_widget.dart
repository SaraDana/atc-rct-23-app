//IMPORT EXTERN APP
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

//IMPORT INTERN APP
import 'package:app/cubits/subcomments_number/subcomments_number_cubit.dart';
import 'package:app/models/comment_model.dart';
import 'package:app/models/publication_model.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/data/repositories/publication/firebase_publication_repository.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/comments/comments.utils.dart';
import 'package:app/widgets/social/comments/comment_widget.dart';
import 'package:app/widgets/social/comments/load_more_comments_widget.dart';

class SubcommentWidget extends StatefulWidget {
  final FirebasePublicationRepository _repository =
      FirebasePublicationRepository();
  final String _userId = FirebaseAuth.instance.currentUser!.uid;
  // ignore: non_constant_identifier_names
  final String EXPERT_COMMENTS = '2';
  final Publication publication;
  final Comment comment;
  SubcommentWidget({Key? key, required this.publication, required this.comment})
      : super(key: key);

  @override
  State<SubcommentWidget> createState() => _SubcommentWidgetState();
}

class _SubcommentWidgetState extends State<SubcommentWidget> {
  String? tagSelected;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SubcommentsNumberCubit>(
            create: (context) => SubcommentsNumberCubit(),
          ),
        ],
        child: BlocBuilder<SubcommentsNumberCubit, SubcommentsNumberState>(
          builder: (context, stateSubcommentsNumber) {
            return Column(
              children: [
                ListView.builder(
                  padding: const EdgeInsets.only(left: 40),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: (CommentsUtils()
                              .getSubcomments(
                                widget.publication,
                                widget.comment,
                              )
                              .length >
                          stateSubcommentsNumber.number)
                      ? stateSubcommentsNumber.number
                      : CommentsUtils()
                          .getSubcomments(
                            widget.publication,
                            widget.comment,
                          )
                          .length,
                  itemBuilder: (context, indexSub) {
                    return CommentWidget(
                      isSubcomment: true,
                      comment: CommentsUtils()
                          .getSubcomments(
                            widget.publication,
                            widget.comment,
                          )[indexSub]
                          .comment!,
                      publication: widget.publication,
                      onTapLike: () {
                        DanaAnalyticsService
                            .trackCommunityLikedPublicationComment(
                                widget.publication.id,
                                tagSelected == widget.EXPERT_COMMENTS,
                                widget.publication.type != 'POST');
                        widget._repository.toggleSubcommentLike(
                          publicationId: widget.publication.id,
                          subcommentId: CommentsUtils()
                              .getSubcomments(
                                widget.publication,
                                widget.comment,
                              )[indexSub]
                              .id,
                        );
                        CommentsUtils()
                            .getSubcomments(
                              widget.publication,
                              widget.comment,
                            )[indexSub]
                            .toogleLike(widget._userId);
                        setState(() {});
                      },
                    );
                  },
                ),
                LoadMoreCommentsWidget(
                  isSubcomment: true,
                  commentsNumber: CommentsUtils()
                      .getSubcomments(
                        widget.publication,
                        widget.comment,
                      )
                      .length,
                  stateCommentsNumber: stateSubcommentsNumber.number,
                  loadText: 'Ver más comentarios',
                  colorText: DanaTheme.paletteGreyTonesLightGrey60,
                  sizeText: 12,
                  onPressed: () {
                    BlocProvider.of<SubcommentsNumberCubit>(context)
                        .increment();
                  },
                )
              ],
            );
          },
        ));
  }
}
