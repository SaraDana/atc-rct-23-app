import 'package:app/core/di/locator.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/features/community/app/cubits/community_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CommunityCategoriesPage extends StatelessWidget {
  const CommunityCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DanaTheme.lightGrayColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Text(
              S.current.socialCategoryTitle,
              style: DanaTheme.textHeadlineSmall(DanaTheme.paletteDarkBlue),
            ),
            gapH12,
            Text(
              S.current.socialCategoryDescription,
              style: DanaTheme.textBody(DanaTheme.paletteDarkBlue),
            ),
            Expanded(child: CategoryList()),
          ],
        ),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  CategoryList({Key? key}) : super(key: key);

  final _backgroundColors = [
    DanaTheme.paletteDanaPink,
    DanaTheme.paletteLightBlue,
    DanaTheme.paletteDarkBlue,
    DanaTheme.paletteFBrown,
    DanaTheme.paletteOrange,
    DanaTheme.paletteGreen,
  ];

  final _textColors = [
    DanaTheme.paletteDarkBlue,
    DanaTheme.paletteOrange,
    DanaTheme.paletteFBrown,
    DanaTheme.paletteDarkBlue,
    DanaTheme.paletteFPink,
    DanaTheme.paletteDarkBlue,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityCubit, CommunityState>(
      bloc: locator<CommunityCubit>()..init(),
      builder: (context, state) {
        if (state.filters.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
          ),
          itemCount: state.filters.length,
          itemBuilder: (context, index) {
            final filter = state.filters[index];
            return GestureDetector(
              onTap: () {
                locator<CommunityCubit>().selectTag(filter.tagId!);
                context.pushNamed(AppRoutes.socialPage.name,
                    queryParams: {'tag_id': filter.tagId});
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _backgroundColors[index % _backgroundColors.length],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    filter.tagName ?? '',
                    style: DanaTheme.textSmallTextBold(
                        _textColors[index % _textColors.length]),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
