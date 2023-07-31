import 'dart:async';

import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/interested_event_enum.dart';
import 'package:app/cubits/change_page/change_page_cubit.dart';
import 'package:app/cubits/interested_event/interested_event_cubit.dart';
import 'package:app/features/community/app/ui/pages/community_categories_page.dart';
import 'package:app/features/notifications/app/cubits/notification_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/screens/main/new_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/constants.dart';
import '../../styles/dana_theme.dart';
import '../../utils/images.dart';
import '../../utils/navigation.dart';
import 'program_page.dart';
import 'tracking_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> _pages = <Widget>[
    NewHomePage(),
    ProgramPage(),
    CommunityCategoriesPage(),
    TrackingPage(),
  ];
  late StreamSubscription<UserNavigationEvents> _subEvents;
  @override
  void initState() {
    super.initState();
    locator<NotificationCubit>().getUnreadNotifications();
  }

  @override
  void dispose() {
    _subEvents.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePageCubit, ChangePageState>(
      listener: (context, state) {
        _subEvents = NavigationUtils.getStream()!.stream.listen(
          (event) {
            if (event == UserNavigationEvents.MoodTrackerDialogReturnHome) {
              context.read<ChangePageCubit>().changeIndexPage(index: 0);
            } else if (event ==
                UserNavigationEvents.MoodTrackerDialogReturnTracking) {
              context.read<ChangePageCubit>().changeIndexPage(index: 3);
            } else if (event ==
                UserNavigationEvents.MoodTrackerDialogReturnCommunity) {
              context.read<ChangePageCubit>().changeIndexPage(index: 2);
            }
          },
        ) as StreamSubscription<UserNavigationEvents>;
      },
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: WillPopScope(
            onWillPop: () async {
              if (state.index == 0) {
                return true;
              } else {
                context.read<ChangePageCubit>().changeIndexPage(index: 0);
                return false;
              }
            },
            child: Center(
              child: _pages.elementAt(state.index),
            ),
          ),
          bottomNavigationBar: _buildBottomNavigationBar(context, state.index),
        );
      },
    );
  }

  String _pageNameForIndex(int index) {
    if (index == 0) return 'NewHome';
    if (index == 1) return 'Program';
    if (index == 2) return 'Social';
    if (index == 3) return 'Moodtracker';
    return '';
  }

  Widget _buildBottomNavigationBar(BuildContext context, int index) {
    return Container(
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: DanaTheme.paletteDarkBlue,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              _buildBottomNavigationBarItem(
                _pageNameForIndex(0),
                'home_icon.svg',
                'home_selected_icon.svg',
                'Inicio',
                20,
              ),
              _buildBottomNavigationBarItem(
                  _pageNameForIndex(1),
                  'program_icon.svg',
                  'program_selected_icon.svg',
                  'Programas',
                  20),
              _buildBottomNavigationBarItem(
                  _pageNameForIndex(2),
                  'community_icon.svg',
                  'community_selected_icon.svg',
                  'Comunidad',
                  20),
              _buildBottomNavigationBarItem(
                  _pageNameForIndex(3),
                  'moodtracker_icon.svg',
                  'moodtracker_selected_icon.svg',
                  S.of(context).screenTrackingBarTitle,
                  20),
            ],
            currentIndex: index,
            onTap: (index) {
              if (index == 2) {
                locator<InterestedEventCubit>().eventOfInterestHappened(
                    EventOfInterestedType.NAVIGATE_COMMUNITY, {});
              }
              if (index == 3) {
                locator<InterestedEventCubit>().eventOfInterestHappened(
                    EventOfInterestedType.NAVIGATE_MOODTRACKER, {});
              }

              context.read<ChangePageCubit>().changeIndexPage(index: index);
            },
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      String page, String iconSVG, String imageDVG, String text, double width) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          buildSvgImage(iconSVG, width),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 10, color: Color.fromRGBO(255, 255, 255, 0.4)),
          ),
        ],
      ),
      activeIcon: Column(
        children: [
          buildSvgImage(imageDVG, width),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 10, color: DanaTheme.whiteColor),
          ),
        ],
      ),
      label: '',
    );
  }
}
