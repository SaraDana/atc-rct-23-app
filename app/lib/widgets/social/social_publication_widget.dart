//IMPORT EXTERN APP
import 'package:app/core/routing/app_router.dart';
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/models/publication_model.dart';
import 'package:app/screens/content/publication_detail_page.dart';
import 'package:app/widgets/social/social_counters_widget.dart';
import 'package:app/widgets/social/social_poll_widget.dart';
import 'package:app/widgets/social/social_post_widget.dart';
import 'package:go_router/go_router.dart';

class SocialPublicationWidget extends StatelessWidget {
  final Publication publication;
  final Function() refreshFn;

  const SocialPublicationWidget({
    Key? key,
    required this.publication,
    required this.refreshFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (publication.type == 'POST')
      return Column(
        children: [
          GestureDetector(
            child: SocialPostWidget(publication: publication),
            onTap: () {
              GoRouter.of(context).pushNamed(
                  queryParams: {'publication_id': publication.id,
                    'publication_title' : publication.title
                  },
                  AppRoutes.publicationDetailPage.name,
                  extra: PublicationDetailArguments(publication: publication));
            },
          ),
          SocialCountersWidget(
            publication: publication,
            onLikeTap: () => refreshFn(),
            onBookmarkTap: () => refreshFn(),
            onCommentTap: () {},
          ),
        ],
      );
    else
      return Column(
        children: [
          GestureDetector(
            child: SocialPollWidget(
              publication: publication,
              onSelectionTap: () => refreshFn(),
            ),
            onTap: () {
              GoRouter.of(context).pushNamed(
                  queryParams: {'publication_id': publication.id,
                    'publication_title' : publication.title
                  },
                  AppRoutes.publicationDetailPage.name,
                  extra: PublicationDetailArguments(publication: publication));
            },
          ),
          SocialCountersWidget(
            publication: publication,
            onLikeTap: () => refreshFn(),
            onBookmarkTap: () => refreshFn(),
            onCommentTap: () {},
          ),
        ],
      );
  }
}
