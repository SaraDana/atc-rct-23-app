//IMPORT EXTERN APP
import 'dart:async';
import 'package:app/core/di/locator.dart';
import 'package:app/features/community/app/cubits/community_cubit.dart';
import 'package:app/features/in_app_review/app/cubits/in_app_review_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

//IMPORT INTERN APP
import 'package:app/cubits/publications/publications_state.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:app/cubits/publications/publications_cubit.dart';
import 'package:app/models/publication_model.dart';
import 'package:app/models/social_config_model.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/data/repositories/publication/firebase_publication_repository.dart';
import 'package:app/screens/content/publication_detail_page.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/globals.dart';
import 'package:app/widgets/shared/main_app_bar.dart';
import 'package:app/widgets/social/social_counters_widget.dart';
import 'package:app/widgets/social/social_poll_widget.dart';
import 'package:app/widgets/social/social_post_widget.dart';

import '../../generated/l10n.dart';

class SocialPage extends StatefulWidget {
  SocialPage({Key? key}) : super(key: key);

  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  late List<Publication> _publications;
  Filter? _filter;
  late bool _accumulative;
  int newLoadedCount = 0;

  @override
  void initState() {
    super.initState();
    _publications = [];
    _accumulative = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      this._getPublications(false);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DanaTheme.paletteWhite,
      body: _buildMainContent(),
    );
  }

  Widget _buildMainContent() {
    return Stack(
      children: [
        _loadPublications(),
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
                  showButtonBack: true,
                  title: "Comunidad",
                  backgroundColor: DanaTheme.lightGrayColor,
                  showBookmark: true,
                  showInformation: true,
                  automaticallyImplyLeading: false,
                  onBookmarkPressed: () async {
                    DanaAnalyticsService.trackHeaderBookmarkClick();
                    context.pushNamed(AppRoutes.socialBookmark.name);
                    _getPublications(false);
                  },
                  onProfilePressed: () {
                    DanaAnalyticsService.trackHeaderProfileClick();
                    context.pushNamed(AppRoutes.profile.name);
                  },
                  onInformationPressed: () {
                    DanaAnalyticsService.trackHeaderInfoClick();
                    DanaAnalyticsService.trackCommunityRulesSeen();
                    context.pushNamed(AppRoutes.communityRules.name);
                  },
                ),
                _buildFilters(),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _loadPublications() {
    final screenSize = MediaQuery.of(context).size;
    return BlocBuilder<PublicationsCubit, PublicationsState>(
      builder: (context, state) {
        if (state.status == StatusCubit.LOADING) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: DanaTheme.paletteDanaPink,
              color: DanaTheme.paletteFPink,
            ),
          );
        }
        if (state.status == StatusCubit.SUCCESS) {
          newLoadedCount = state.publications?.length ?? 0;
          _publications = _accumulative
              ? (_publications + state.publications!).toSet().toList()
              : state.publications ?? [];
        }
        if (state.status == StatusCubit.SUCCESS ||
            state.status == StatusCubit.LOADING_MORE) {
          bool loadingMore = state.status == StatusCubit.LOADING_MORE;
          return LazyLoadScrollView(
            onEndOfPage: () {
              if (newLoadedCount == pageSize && !loadingMore) {
                _getPublications(true);
              }
            },
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 90),
              shrinkWrap: true,
              itemCount: _publications.length + (loadingMore ? 1 : 0),
              itemBuilder: (_, index) {
                if (index == _publications.length) {
                  // last cell
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: _buildLoadMore(screenSize),
                  );
                } else {
                  final publication = _publications[index];
                  return _buildPublication(screenSize, publication, index == 0);
                }
              },
            ),
          );
        }

        if (state.status == StatusCubit.ERROR) {
          return Container(
            child: Center(child: Text(state.errorMessage!)),
          );
        }

        return Container();
      },
    );
  }

  void navigateToPublication(Publication publication) async {
    GoRouter.of(context).pushNamed(AppRoutes.publicationDetailPage.name,
        extra: PublicationDetailArguments(publication: publication));
  }

  Widget _buildLoadMore(Size screenSize) {
    return Container(
        margin: EdgeInsets.only(right: 12.0, bottom: 10.0, left: 12.0),
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: DanaTheme.paletteDanaPink,
            color: DanaTheme.paletteFPink,
          ),
        ));
  }

  Widget _buildPublication(
      Size screenSize, Publication publication, bool isFirstChild) {
    if (publication.type == 'POST') {
      return Container(
        margin: EdgeInsets.only(right: 12.0, bottom: 10.0, left: 12.0),
        child: Column(
          children: [
            if (isFirstChild)
              SizedBox(
                height: 220,
              ),
            GestureDetector(
              child: SocialPostWidget(
                publication: publication,
                isFirstChild: isFirstChild,
                isPinned: _isPinned(publication.id),
                isInList: true,
              ),
              onTap: () {
                navigateToPublication(publication);
              },
            ),
            SocialCountersWidget(
              publication: publication,
              onLikeTap: () {
                setState(() {});
              },
              onBookmarkTap: () {
                setState(() {});
              },
              onCommentTap: () => navigateToPublication(publication),
              isInList: true,
            ),
          ],
        ),
      );
    } else {
      return Column(
        children: [
          if (isFirstChild)
            SizedBox(
              height: 220,
            ),
          Card(
            margin: EdgeInsets.only(right: 12.0, bottom: 10.0, left: 12.0),
            color: DanaTheme.bgPollColor,
            shadowColor: DanaTheme.whiteColor.withOpacity(0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                GestureDetector(
                  child: SocialPollWidget(
                    publication: publication,
                    onSelectionTap: () {},
                    isFirstChild: isFirstChild,
                    isPinned: _isPinned(publication.id),
                  ),
                  onTap: () => navigateToPublication(publication),
                ),
                SocialCountersWidget(
                  publication: publication,
                  onLikeTap: () {
                    setState(() {});
                  },
                  onBookmarkTap: () {
                    setState(() {});
                  },
                  onCommentTap: () => navigateToPublication(publication),
                  isInList: true,
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  Widget _buildFilters() {
    return Container(
      width: double.maxFinite,
      height: 73,
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: BlocBuilder<CommunityCubit, CommunityState>(
        bloc: locator<CommunityCubit>(),
        builder: (context, state) {
          final filters = state.filters;
          if (filters.isEmpty) {
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
                  itemCount: filters.length,
                  itemBuilder: (_, index) {
                    final filter = filters[index];
                    return GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          color: DanaTheme.whiteColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            filter.tagName!,
                            style: filter.tagId == state.tagSelected
                                ? DanaTheme.bannerTitle2.copyWith(
                                    color: DanaTheme.paletteOrange,
                                    fontWeight: FontWeight.bold,
                                  )
                                : DanaTheme.bannerTitle2.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                          ),
                        ),
                      ),
                      onTap: () {
                        _publications = [];
                        if (filter.tagId == state.tagSelected) {
                          locator<CommunityCubit>().selectTag(null);
                        } else {
                          DanaAnalyticsService.trackTagFilterSelected(
                              FilterContentType.Social,
                              filter.tagId,
                              filter.tagName);
                          locator<CommunityCubit>().selectTag(filter.tagId);
                        }
                        _filterPublications();
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
  }

  Future<void> _getPublications(bool useLastDoc) async {
    _accumulative = useLastDoc;

    PublicationsCubit cubit = BlocProvider.of<PublicationsCubit>(context);

    cubit.getPublications(
        locator<CommunityCubit>().state.tagSelected, null, useLastDoc);
  }

  Future<void> _filterPublications() async {
    await _getPublications(false);
  }

  bool _isPinned(String? publicationId) {
    return _filter?.pinnedPublicationId == publicationId;
  }
}
