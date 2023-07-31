import 'package:flutter/material.dart';

import '../../models/tag_model.dart';
import '../../styles/dana_theme.dart';

class SocialTagWidget extends StatefulWidget {
  final List<Tag> tags;
  final Function(String?) onTap;
  String? tagSelected;

  SocialTagWidget({
    Key? key,
    required this.tags,
    required this.onTap,
    this.tagSelected = '',
  }) : super(key: key);

  @override
  State<SocialTagWidget> createState() => _SocialTagWidgetState();
}

class _SocialTagWidgetState extends State<SocialTagWidget> {
  String? tagSelected;

  @override
  void initState() {
    super.initState();
    tagSelected = widget.tagSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 80,
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.tags.length,
        itemBuilder: (_, index) {
          final tag = widget.tags[index];
          return GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Center(
                child: Text(
                  tag.name!,
                  style: tag.id == tagSelected
                      ? DanaTheme.bannerTitle2
                          .copyWith(color: DanaTheme.paletteWhite)
                      : DanaTheme.bannerTitle2,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(98),
                color: tag.id == tagSelected
                    ? DanaTheme.paletteDanaPink
                    : DanaTheme.grayColor,
              ),
            ),
            onTap: () {
              tagSelected = tag.id;
              setState(() {});
              widget.onTap(tagSelected);
            },
          );
        },
      ),
    );
  }
}
