import 'package:flutter/material.dart';

import '../../models/collection_model.dart';
import '../program/program_item_widget.dart';

class CollectionItemWidgetContent extends StatelessWidget {
  final CollectionModel collection;
  final Axis scrollDirection;
  final String? tagFilter;

  CollectionItemWidgetContent({
    Key? key,
    required this.collection,
    required this.tagFilter,
    this.scrollDirection = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 380.h,
      width: double.infinity,
      child: SingleChildScrollView(
        key: UniqueKey(),
        physics: BouncingScrollPhysics(),
        scrollDirection: scrollDirection,
        child: Row(children: [
          Container(width: 10), // Simulate initial padding
          ...collection.programsPaths!.asMap().entries.map(
            (e) {
              final index = e.key;

              return ProgramItemWidget(
                isWeekProgram: false,
                contextPage: context,
                programPath: collection.programsPaths![index],
                programId: collection.programsIds![index],
                position: index,
                tagFilter: tagFilter,
              );
            },
          ).toList(),
          Container(width: 10), // Simulate end padding
        ]),
      ),
    );
  }
}
