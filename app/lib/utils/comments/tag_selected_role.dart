import 'package:app/generated/l10n.dart';
import 'package:app/models/publication_model.dart';
import 'package:app/models/tag_model.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/widgets/social/social_tag_widget.dart';
import 'package:flutter/material.dart';

class TagSelectedRole extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String RECENT_COMMENTS = '1';
  // ignore: non_constant_identifier_names
  final String EXPERT_COMMENTS = '2';
  final Publication publication;
  const TagSelectedRole({Key? key, required this.publication})
      : super(key: key);

  @override
  State<TagSelectedRole> createState() => _TagSelectedRoleState();
}

class _TagSelectedRoleState extends State<TagSelectedRole> {
  String? tagSelected;
  @override
  Widget build(BuildContext context) {
    final List<Tag> tags = [
      Tag(
        id: widget.RECENT_COMMENTS,
        name: S.of(context).pagePublicationDetailsTagRecent,
        createdAt: DateTime.now(),
        createdBy: '',
        updatedAt: DateTime.now(),
        updatedBy: '',
      ),
      Tag(
        id: widget.EXPERT_COMMENTS,
        name: S.of(context).pagePublicationDetailsTagExpert,
        createdAt: DateTime.now(),
        createdBy: '',
        updatedAt: DateTime.now(),
        updatedBy: '',
      ),
    ];

    return SocialTagWidget(
        tags: tags,
        tagSelected: tags[0].id,
        onTap: (String? tagId) {
          DanaAnalyticsService.trackCommunityCommentSectionSelected(
              widget.publication.id,
              tagId == widget.RECENT_COMMENTS ? 'Mothers' : 'Specialists');
       
          tagSelected = tagId;
          setState(() {});
        });
  }
}
