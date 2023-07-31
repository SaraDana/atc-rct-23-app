//IMPORT EXTERN APP
import 'package:flutter/cupertino.dart';
//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/models/comment_model.dart';
import 'package:app/models/publication_model.dart';
import 'package:app/models/subcomment_model.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/data/repositories/publication/firebase_publication_repository.dart';

class CommentsUtils {
  final FirebasePublicationRepository _repository =
      FirebasePublicationRepository();
  void showReportCommentDialog(
    BuildContext context, {
    required Publication publication,
    required Comment comment,
  }) {
    showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text(
                '${S.of(context).pageCommunityPublicationCommentReportAction}'),
            onPressed: () {
              Navigator.pop(context, 'report');
            },
            isDestructiveAction: true,
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text(
              '${S.of(context).pageCommunityPublicationCommentCancelAction}'),
          onPressed: () {
            Navigator.pop(context, 'cancel');
          },
        ),
      ),
    ).then<void>((String? value) {
      if (value == 'report') {
        DanaAnalyticsService.trackCommunityReportedComment(
            publication.id, comment.id);
        _reportComment(publication, comment);
      }
    });
  }

  _reportComment(Publication publication, Comment comment) {
    _repository.reportComment(publication.id, comment.id);
  }

  List<Comment> getComments(Publication publication) {
    if (publication.comments
            ?.where((element) => element.userSpecialistRole != '')
            .isNotEmpty ??
        false) {
      Comment firstSpeccialistComment = publication.comments!
          .where((element) => element.userSpecialistRole != '')
          .last;
      List<Comment> finalComments = publication.comments!;

      finalComments.remove(firstSpeccialistComment);

      finalComments.insert(0, firstSpeccialistComment);

      return finalComments;
    } else {
      return [];
    }
    // if (tagSelected == widget.RECENT_COMMENTS) {

    //       .where((comment) => comment.userSpecialistRole == '')
    //       .toList();
    // } else {
    //   return publication.comments
    //       .where((comment) => comment.userSpecialistRole != '')
    //       .toList();
    // }
  }

  List<Subcomment> getSubcomments(Publication publication, Comment comment) {
    return publication.subcomments!
        .where((Subcomment subcomment) => subcomment.idComment == comment.id)
        .toList();
  }
}
