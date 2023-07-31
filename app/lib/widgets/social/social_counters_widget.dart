//IMPORT EXTERN APP
import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/interested_event_enum.dart';
import 'package:app/cubits/interested_event/interested_event_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//IMPORT INTERN APP
import 'package:app/styles/dana_theme.dart';
import 'package:app/models/publication_model.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/data/repositories/publication/firebase_publication_repository.dart';

class SocialCountersWidget extends StatelessWidget {
  final FirebasePublicationRepository _repository =
      FirebasePublicationRepository();
  final String _userId = FirebaseAuth.instance.currentUser!.uid;
  final Publication publication;
  final Function() onLikeTap;
  final Function() onBookmarkTap;
  final Function() onCommentTap;
  final bool isInList;

  SocialCountersWidget(
      {Key? key,
      required this.publication,
      required this.onLikeTap,
      required this.onBookmarkTap,
      required this.onCommentTap,
      this.isInList = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color barColor = DanaTheme.paletteDarkBlue;

    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: 42,
      decoration: BoxDecoration(
        color: DanaTheme.paletteWhite,
        border: Border.all(color: DanaTheme.palleteGreyComment),
        borderRadius: this.isInList
            ? BorderRadius.only(
                topRight: Radius.circular(0.0),
                topLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              )
            : BorderRadius.all(Radius.circular(0.0)),
        // boxShadow: [
        //   BoxShadow(
        //     color: DanaTheme.paletteGreyShadow.withOpacity(0.2),
        //     spreadRadius: 1,
        //     blurRadius: 5,
        //     offset: Offset(0.0, 0.75), // changes position of shadow
        //   ),
        // ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              _repository.togglePublicationLike(publication.id);
              publication.toogleLike(_userId);
              DanaAnalyticsService.trackCommunityLikedPublication(
                  publication.id,
                  publication.isLiked(_userId),
                  publication.type != 'POST');

              if (publication.isLiked(_userId)) {
                locator<InterestedEventCubit>().eventOfInterestHappened(
                    EventOfInterestedType.LIKED_PUBLICATION, {
                  "publicationId": publication.id ?? "",
                });
              }

              onLikeTap(); // Parent widget is the resposible to update the UI
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  publication.isLiked(_userId)
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  color: barColor,
                ),
                SizedBox(width: 4),
                Text(
                  publication.numLikes.toString(),
                  style: DanaTheme.subtitle2.copyWith(color: barColor),
                )
              ],
            ),
          ),

          //COMENT SECTION
          TextButton(
            onPressed: () {
              onCommentTap();
            },
            child: Row(
              children: [
                Icon(
                  Icons.comment,
                  color: barColor,
                ),
                SizedBox(width: 4),
                Text(
                 // (publication.numComments + publication.numSubcomments)
                 publication.commentsCount
                      .toString(),
                  style: DanaTheme.subtitle2.copyWith(color: barColor),
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),

          TextButton(
            onPressed: () {
              _repository.togglePublicationBookmark(publication.id);
              publication.toogleBookmark(_userId);
              DanaAnalyticsService.trackCommunityBookmarkedPublication(
                  publication.id, publication.isBookmarked(_userId));
              onBookmarkTap(); // Parent widget is the resposible to update the UI
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  publication.isBookmarked(_userId)
                      ? Icons.bookmark
                      : Icons.bookmark_outline_outlined,
                  color: barColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
