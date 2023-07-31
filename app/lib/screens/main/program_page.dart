//IMPORT EXTERN APP
import 'dart:async';

import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/cubits/collections/collections_cubit.dart';
import 'package:app/cubits/collections/collections_state.dart';
import 'package:app/data/repositories/home_config/firebase_home_config_repository.dart';
import 'package:app/data/repositories/tag/firebase_tag_repository.dart';
import 'package:app/data/services/dana_analytics_service.dart';
//IMPORT INTERN APP
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/features/user/app/cubits/initial_profile_state.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/tag_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/banner.dart';
import 'package:app/widgets/collection/collection_item_widget.dart';
import 'package:app/widgets/shared/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProgramPage extends StatefulWidget {
  @override
  _ProgramPageState createState() => _ProgramPageState();
}

class _ProgramPageState extends State<ProgramPage> {
  final FirebaseHomeConfigRepository _homeConfigRepository =
      FirebaseHomeConfigRepository(
    tagRepository: FirebaseTagRepository(),
  );

  StreamController<List<Tag>>? _tagController;

  @override
  void didPush() {
    DanaAnalyticsService.trackVisitPage('programs_page');
  }

  @override
  void initState() {
    super.initState();
    _tagController = StreamController<List<Tag>>.broadcast();
    this._getTags();

    locator<InitialProfileCubit>().getUserByEmail();

    BannerUtils.checkVisibility('home');
  }

  @override
  void dispose() {
    _tagController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitialProfileCubit, InitialProfileState>(
      bloc: locator<InitialProfileCubit>(),
      builder: (context, initialProfileState) {
        return Scaffold(
          backgroundColor: DanaTheme.paletteWhite,
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: BlocBuilder<CollectionsCubit, CollectionsState>(
                  builder: (context, state) {
                    if (state.status == StatusCubit.LOADING) {
                      return Padding(
                        padding: EdgeInsets.all(100),
                        child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: DanaTheme.paletteDanaPink,
                            color: DanaTheme.paletteFPink,
                          ),
                        ),
                      );
                    }
                    if (state.status == StatusCubit.SUCCESS) {
                      return Container(
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: state.collections!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  if (index == 0)
                                    SizedBox(
                                      height: 200,
                                    ),
                                  CollectionItemWidget(
                                    isFirstChild: index == 0,
                                    collection: state.collections![index],
                                    tagFilter: state.tagSelected,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 160,
                        color: DanaTheme.lightGrayColor,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/bg_grey_header.png',
                          alignment: Alignment.bottomRight,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      MainAppBar(
                        title: "Programas",
                        backgroundColor: DanaTheme.lightGrayColor,
                        showBookmark: true,
                        showInformation: false,
                        automaticallyImplyLeading: false,
                        onBookmarkPressed: () async {
                          DanaAnalyticsService.trackHeaderBookmarkClick();
                          context.pushNamed(
                            AppRoutes.favourites.name,
                          );
                        },
                        onProfilePressed: () {
                          DanaAnalyticsService.trackHeaderProfileClick();
                          context.pushNamed(AppRoutes.profile.name);
                        },
                      ),
                      _sectionsFilters(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _getTags() async {
    List<Tag> tags = await _homeConfigRepository.getAllTags();
    _tagController!.sink.add(tags);
  }

  _sectionsFilters() {
    const Color? backgroundColor = null;
    const Color defaultTagBackgroundColor = DanaTheme.grayColor;
    const Color selectedTagTextColor = DanaTheme.paletteOrange;
    const Color? defaultTagTextColor = null;

    return BlocBuilder<CollectionsCubit, CollectionsState>(
      builder: (context, collectionsState) {
        return Container(
          width: double.maxFinite,
          height: 73,
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          color: backgroundColor,
          child: StreamBuilder<List<Tag?>>(
            stream: _tagController!.stream,
            builder: (_, snapshot) {
              final tags = snapshot.data ?? null;
              if (tags == null) {
                return Container();
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 14),
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      S.of(context).tagSelectorTitle,
                      style: DanaTheme.bannerTitle2,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: tags.length,
                      itemBuilder: (_, index) {
                        final tag = tags[index]!;
                        return GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: DanaTheme.whiteColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                tag.name!,
                                style: tag.id == collectionsState.tagSelected
                                    ? selectedTagTextColor != null
                                        ? DanaTheme.bannerTitle2.copyWith(
                                            color: selectedTagTextColor,
                                            fontWeight: FontWeight.bold,
                                          )
                                        : DanaTheme.bannerTitle2
                                    : selectedTagTextColor != null
                                        ? DanaTheme.bannerTitle2.copyWith(
                                            color: defaultTagTextColor,
                                            fontWeight: FontWeight.bold,
                                          )
                                        : DanaTheme.bannerTitle2,
                              ),
                            ),
                          ),
                          onTap: () {
                            if (context
                                    .read<CollectionsCubit>()
                                    .state
                                    .tagSelected !=
                                tag.id) {
                              DanaAnalyticsService.trackTagFilterSelected(
                                  FilterContentType.Programs, tag.id, tag.name);
                            }

                            context
                                .read<CollectionsCubit>()
                                .changeTagId(tagId: tag.id!);
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
