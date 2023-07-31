import 'package:app/config/constants.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/unit_bookmarked.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/bookmarks.dart';
import 'package:app/widgets/content/favourites_content_widget.dart';
import 'package:app/widgets/content/no_favourites_content_widget.dart';
import 'package:flutter/material.dart';

import 'package:app/data/services/dana_analytics_service.dart';

import 'package:app/utils/globals.dart';

import 'package:app/widgets/shared/social_app_bar.dart';

class MyFavouritesPage extends StatefulWidget {
  const MyFavouritesPage({
    Key? key,
  }) : super(key: key);

  @override
  _MyFavouritesPageState createState() => _MyFavouritesPageState();
}

class _MyFavouritesPageState extends State<MyFavouritesPage> with RouteAware {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPush() {
    DanaAnalyticsService.trackViewLinkContentPage(ProfileLinks.MY_FAVOURITES);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DanaTheme.paletteWhite,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 155),
                child: MyFavouriteContent(),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: 50,
                color: DanaTheme.bgAppbar,
              ),
              SocialAppBar(
                title: S.of(context).profilePageFavorites,
                bgColor: DanaTheme.bgAppbar,
                showBackButton: true,
                showLogo: false,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MyFavouriteContent extends StatelessWidget {
  const MyFavouriteContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (unitBookmarkController != null) {
      return StreamBuilder<List<UnitWithImage?>?>(
        stream: unitBookmarkController!.stream,
        builder: (_, snapshot) {
          List<UnitWithImage?> unitsWithImage = snapshot.data ?? [];

          if (unitsWithImage.isEmpty) {
            unitsWithImage = getUnitsForUser()!;
          }

          if (unitsWithImage.isEmpty) {
            return NoFavouritesContentWidget();
          }
          return FavourtiesContentWidget(
            unitWithImages: unitsWithImage,
          );
        },
      );
    }
    return Container(
      child: Text('No data fuera en el stream'),
    );
  }
}
