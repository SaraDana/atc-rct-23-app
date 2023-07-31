//IMPORT EXTERN APP
import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/interested_event_enum.dart';
import 'package:app/cubits/interested_event/interested_event_cubit.dart';
import 'package:app/cubits/publications/publications_cubit.dart';
import 'package:app/features/in_app_review/app/cubits/in_app_review_cubit.dart';
import 'package:app/utils/publications.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//IMPORT LOCAL APP
import 'package:app/features/user/data/repositories/firebase_user_repository.dart';
import 'package:app/models/comment_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/models/publication_model.dart';
import 'package:app/data/repositories/publication/firebase_publication_repository.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/widgets/social/social_post_widget.dart';
import 'package:app/widgets/social/social_poll_widget.dart';
import 'package:app/widgets/social/social_counters_widget.dart';
import 'package:app/widgets/shared/social_app_bar.dart';
import 'package:app/cubits/change_subcomment/change_comment_cubit.dart';
import 'package:app/cubits/comments_number/comments_number_cubit.dart';
import 'package:app/cubits/toggle_answer_subcomment/toggle_answer_subcomment_cubit.dart';
import 'package:app/models/subcomment_model.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/utils/comments/comments.utils.dart';
import 'package:app/utils/modal.dart';
import 'package:app/widgets/social/comments/comment_widget.dart';
import 'package:app/widgets/social/comments/load_more_comments_widget.dart';
import 'package:app/widgets/social/comments/send_comment_widget.dart';
import 'package:app/widgets/social/comments/subcomment_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PublicationDetailArguments {
  final Publication? publication;

  const PublicationDetailArguments({this.publication});
}

class PublicationDetailPage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String RECENT_COMMENTS = '1';
  // ignore: non_constant_identifier_names
  final String EXPERT_COMMENTS = '2';

  final FirebasePublicationRepository _repository =
      FirebasePublicationRepository();
  final String _userId = FirebaseUserRepository().getUserId();
  final PublicationDetailArguments arguments;
  PublicationDetailPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  State<PublicationDetailPage> createState() => _PublicationDetailPageState();
}

class _PublicationDetailPageState extends State<PublicationDetailPage> {
  String? tagSelected;
  TextEditingController? commentController;
  List<Comment>? resultOfComents;

  bool _publicationEnhanced = false;
  @override
  void initState() {
    super.initState();
    enhancePublication();
    tagSelected = widget.RECENT_COMMENTS;
    commentController = TextEditingController();
  }

  @override
  void dispose() {
    commentController?.dispose();
    super.dispose();
  }

  enhancePublication() async {
    Publication? enhancedPublication = await locator<PublicationsCubit>()
        .enhancePublication(widget.arguments.publication);
    if (enhancedPublication != null)
      resultOfComents = CommentsUtils().getComments(enhancedPublication);
    _publicationEnhanced = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DanaTheme.paletteWhite,
        body: MultiBlocProvider(
          providers: [
            BlocProvider<CommentsNumberCubit>(
              create: (context) => CommentsNumberCubit(),
            ),
            BlocProvider<ToggleAnswerSubcommentCubit>(
              create: (context) => ToggleAnswerSubcommentCubit(),
            ),
            BlocProvider<ChangeCommentCubit>(
              create: (context) => ChangeCommentCubit(),
            )
          ],
          child: !_publicationEnhanced
              ? PublicationDetailShimmer()
              : _buildMainContent(),
        ));
  }

  Widget _buildMainContent() {
    return BlocBuilder<ToggleAnswerSubcommentCubit,
        ToggleAnswerSubcommentState>(builder: (context, stateToggleAnswer) {
      return BlocBuilder<ChangeCommentCubit, ChangeCommentState>(
        builder: (context, stateChangeComment) {
          return Column(
            children: [
              Container(
                height: 50,
                color: DanaTheme.bgAppbar,
              ),
              SocialAppBar(
                title: S.of(context).pagePublicationDetailsTitle,
                bgColor: DanaTheme.bgAppbar,
                showBackButton: true,
                showLogo: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      widget.arguments.publication!.type ==
                              PublicationType.POST.firebaseName
                          ? SocialPostWidget(
                              publication: widget.arguments.publication!)
                          : SocialPollWidget(
                              publication: widget.arguments.publication!,
                              onSelectionTap: () {
                                setState(() {});
                              },
                            ),
                      SocialCountersWidget(
                        publication: widget.arguments.publication!,
                        onLikeTap: () {
                          setState(() {});
                        },
                        onBookmarkTap: () {
                          setState(() {});
                        },
                        onCommentTap: () {},
                      ),
                      // _buildTags(),
                      _buildComments(),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  if (stateToggleAnswer.answerSubcomment == true)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      color: DanaTheme.palleteGrayBorder,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Estás respondiendo a ${stateChangeComment.comment.userName}",
                            style: TextStyle(
                              color: DanaTheme.palleteDarkGray,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<ToggleAnswerSubcommentCubit>(
                                      context)
                                  .notCanAnswer();
                            },
                            icon: Icon(Icons.close),
                          )
                        ],
                      ),
                    ),
                  (stateToggleAnswer.answerSubcomment == false)
                      ? SendCommentWidget(
                          commentController: commentController,
                          onTap: () async {
                            if (commentController != null) {
                              if (commentController!.text.isNotEmpty) {
                                ModalUtils().showModal(
                                  context,
                                  title: S
                                      .of(context)
                                      .pagePublicationDetailsTitleConfirm,
                                  confirmText: S
                                      .of(context)
                                      .pagePublicationDetailsPublish,
                                  cancelText:
                                      S.of(context).pagePublicationDetailsEdit,
                                  onEditTap: () async {
                                    Navigator.pop(context);
                                  },
                                  onPostTap: () async {
                                    if (commentController!.text.isNotEmpty) {
                                      String _result = commentController!.text;
                                      commentController!.clear();
                                      if (widget.arguments.publication !=
                                          null) {
                                        await widget._repository
                                            .increaseCommentCount(widget
                                                .arguments.publication!.id
                                                .toString());
                                        final Comment comment =
                                            await widget._repository.setComment(
                                                widget
                                                    .arguments.publication!.id,
                                                _result);

                                        await widget._repository
                                            .increaseCommentCount(widget
                                                .arguments.publication!.id
                                                .toString());

                                        DanaAnalyticsService
                                            .trackCommunityCommentedPublication(
                                                widget
                                                    .arguments.publication!.id,
                                                widget.arguments.publication!
                                                        .type !=
                                                    PublicationType
                                                        .POST.firebaseName,
                                                false);
                                        locator<InterestedEventCubit>()
                                            .eventOfInterestHappened(
                                                EventOfInterestedType
                                                    .COMMENTED_PUBLICATION,
                                                {
                                              "publicationId": widget.arguments
                                                      .publication!.id ??
                                                  "",
                                            });
                                        widget.arguments.publication!.comments!
                                            .insert(0, comment);
                                        setState(() {});
                                        print("comment: ${comment.id}");

                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        Navigator.pop(context);
                                        locator<InAppReviewCubit>()
                                            .requestReview();
                                      }
                                    }
                                  },
                                );
                              }
                            }
                            // update bool
                          },
                        )
                      : SendCommentWidget(
                          commentController: commentController,
                          onTap: () async {
                            if (commentController!.text.isNotEmpty) {
                              ModalUtils().showModal(
                                context,
                                title: S
                                    .of(context)
                                    .pagePublicationDetailsTitleConfirm,
                                confirmText:
                                    S.of(context).pagePublicationDetailsPublish,
                                cancelText:
                                    S.of(context).pagePublicationDetailsEdit,
                                onEditTap: () async {
                                  Navigator.pop(context);
                                },
                                onPostTap: () async {
                                  await widget._repository.increaseCommentCount(
                                      widget.arguments.publication!.id
                                          .toString());
                                  if (commentController!.text.isNotEmpty) {
                                    String _result = commentController!.text;
                                    commentController!.clear();
                                    final Subcomment subcomment =
                                        await widget._repository.setSubcomment(
                                            widget.arguments.publication!.id,
                                            stateChangeComment.comment.id,
                                            _result);
                                    DanaAnalyticsService
                                        .trackCommunityCommentedPublication(
                                            widget.arguments.publication!.id,
                                            widget.arguments.publication!
                                                    .type !=
                                                PublicationType
                                                    .POST.firebaseName,
                                            true);
                                    locator<InterestedEventCubit>()
                                        .eventOfInterestHappened(
                                            EventOfInterestedType
                                                .COMMENTED_PUBLICATION,
                                            {
                                          "publicationId": widget
                                                  .arguments.publication!.id ??
                                              "",
                                        });
                                    widget.arguments.publication!.subcomments!
                                        .insert(0, subcomment);
                                    setState(() {});

                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    Navigator.pop(context);
                                    BlocProvider.of<
                                                ToggleAnswerSubcommentCubit>(
                                            context)
                                        .notCanAnswer();
                                    locator<InAppReviewCubit>().requestReview();
                                  }
                                },
                              );
                            }
                          },
                        ),
                ],
              ),
            ],
          );
        },
      );
    });
  }

  Widget _buildComments() {
    return BlocBuilder<CommentsNumberCubit, CommentsNumberState>(
      builder: (context, stateCommentsNumber) {
        return Column(
          children: [
            ListView.builder(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: (widget.arguments.publication?.comments != null &&
                      widget.arguments.publication!.comments!.length >
                          stateCommentsNumber.number)
                  ? stateCommentsNumber.number
                  : widget.arguments.publication!.comments?.length ?? 0,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    if (resultOfComents != null &&
                        resultOfComents!.isNotEmpty) ...[
                      CommentWidget(
                        isSubcomment: false,
                        comment: resultOfComents![index],
                        publication: widget.arguments.publication!,
                        onTapLike: () {
                          DanaAnalyticsService
                              .trackCommunityLikedPublicationComment(
                                  widget.arguments.publication!.id,
                                  tagSelected == widget.EXPERT_COMMENTS,
                                  widget.arguments.publication!.type !=
                                      PublicationType.POST.firebaseName);

                          widget._repository.toggleCommentLike(
                              widget.arguments.publication!.id,
                              resultOfComents![index].id);
                          bool isLiked = resultOfComents![index]
                              .toogleLike(widget._userId);
                          if (isLiked) {
                            locator<InterestedEventCubit>()
                                .eventOfInterestHappened(
                                    EventOfInterestedType.LIKED_COMMENT, {
                              "publicationId":
                                  widget.arguments.publication!.id ?? "",
                              "commentId": resultOfComents![index].id ?? "",
                            });
                          }

                          setState(() {});
                        },
                      ),
                      SubcommentWidget(
                        publication: widget.arguments.publication!,
                        comment: resultOfComents![index],
                      ),
                    ]
                  ],
                );
              },
            ),
            LoadMoreCommentsWidget(
              isSubcomment: false,
              commentsNumber: resultOfComents!.length,
              stateCommentsNumber: stateCommentsNumber.number,
              loadText: 'Ver más comentarios',
              colorText: DanaTheme.paletteOrange,
              sizeText: 18,
              onPressed: () {
                BlocProvider.of<CommentsNumberCubit>(context).increment();
              },
            )
          ],
        );
      },
    );
  }
}

class PublicationDetailShimmer extends StatelessWidget {
  const PublicationDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 50.h,
            color: DanaTheme.bgAppbar,
          ),
          SocialAppBar(
            title: S.of(context).pagePublicationDetailsTitle,
            bgColor: DanaTheme.bgAppbar,
            showBackButton: true,
            showLogo: false,
          ),
          _makeShimmer(
            Container(
              width: 1.sw,
              height: 200.h,
              color: Colors.white,
            ),
          ),
          Container(
            width: 1.sw,
            height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      _makeShimmer(
                        Container(
                          color: Colors.white,
                          width: 80.w,
                          height: 30.h,
                        ),
                      ),
                      16.w.horizontalSpace,
                      _makeShimmer(
                        Container(
                          color: Colors.white,
                          width: 80.w,
                          height: 30.h,
                        ),
                      ),
                    ],
                  ),
                ),
                _makeShimmer(
                  Container(
                    color: Colors.white,
                    width: 80.w,
                    height: 30.h,
                  ),
                ),
              ],
            ),
          ),
          16.h.verticalSpace,
          ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: 10,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _makeShimmer(
                        Container(
                          margin: EdgeInsets.only(left: 30.w, bottom: 10.h),
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      16.w.horizontalSpace,
                      _makeShimmer(
                        Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          width: .7.sw,
                          height: 200.h,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }

  _makeShimmer(Widget widget) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(.2),
      highlightColor: Colors.grey.withOpacity(.1),
      child: widget,
    );
  }
}
