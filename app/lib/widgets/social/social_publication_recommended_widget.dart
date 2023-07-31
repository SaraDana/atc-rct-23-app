//IMPORT EXTERN APP
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/models/publication_model.dart';
import 'package:app/widgets/social/social_counters_widget.dart';
import 'package:app/widgets/social/social_post_widget.dart';

class SocialPublicationRecommendedWidget extends StatelessWidget {
  final Publication publication;
  final Function() onLikeTap;
  final Function() onBookmarkTap;
  final Function() onCommentTap;
  final Function() onPublicationSelected;

  const SocialPublicationRecommendedWidget(
      {Key? key,
      required this.publication,
      required this.onLikeTap,
      required this.onBookmarkTap,
      required this.onCommentTap,
      required this.onPublicationSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DanaAnalyticsService.trackHomeShowRecommendedCommunityPublication(
        publication.id!, false);

    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          GestureDetector(
            child: SocialPostWidget(
              publication: publication,
              isFirstChild: true,
              isPinned: false,
              isInList: true,
              isDarkFilter: true,
            ),
            onTap: () {
              onPublicationSelected();
            },
          ),
          SocialCountersWidget(
            publication: publication,
            onLikeTap: () {
              onLikeTap();
            },
            onBookmarkTap: () {
              onBookmarkTap();
            },
            onCommentTap: () {
              onCommentTap();
            },
            isInList: true,
          ),
        ],
      ),
    );
  }
}
