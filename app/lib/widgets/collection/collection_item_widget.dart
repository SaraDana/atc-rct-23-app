//IMPORT EXTERN APP
import 'package:app/cubits/collection_tags_list/collection_tags_list_cubit.dart';
//IMPORT INTERN APP
import 'package:app/models/collection_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/widgets/collection/collection_item_widget_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectionItemWidget extends StatelessWidget {
  final CollectionModel collection;
  final String? tagFilter;
  final bool isFirstChild;
  // final VoidCallback onPressed;
  final Axis scrollDirection;

  const CollectionItemWidget({
    Key? key,
    required this.collection,
    required this.tagFilter,
    this.isFirstChild = false,
    // this.onPressed,
    this.scrollDirection = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CollectionTagsListCubit>(
      create: (context) => CollectionTagsListCubit(collection: collection),
      child: BlocBuilder<CollectionTagsListCubit, CollectionTagsListState>(
          builder: (context, state) {
        if (tagFilter != null &&
            tagFilter!.length > 0 &&
            !state.flatList.contains(tagFilter)) {
          return SizedBox.shrink();
        } else {
          return Container(
            margin: EdgeInsets.only(bottom: 10.h),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: .9.sw,
                    margin: EdgeInsets.only(
                        left: DanaTheme.bodyPadding,
                        top: isFirstChild ? 0 : 30.h),
                    child: Text(
                      collection.title!,
                      style: DanaTheme.textSubHeadlineBold(
                          DanaTheme.paletteDarkBlue),
                    ),
                  ),
                ),
                Container(height: 18.h),
                CollectionItemWidgetContent(
                  collection: collection,
                  scrollDirection: scrollDirection,
                  tagFilter: tagFilter,
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
