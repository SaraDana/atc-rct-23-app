import 'package:app/config/constants.dart';
import 'package:app/core/enums/interested_event_enum.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/cubits/interested_event/interested_event_cubit.dart';
import 'package:app/cubits/user_premium/user_premium_cubit.dart';
import 'package:app/cubits/user_premium/user_premium_state.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/notifications/app/cubits/notification_cubit.dart';
import 'package:app/models/purchases/premium_type.dart';
import 'package:app/screens/info/moodtracker_info_page.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainAppBar extends StatelessWidget {
  final String? title;
  final bool showBookmark;
  final bool showInformation;
  final Color backgroundColor;
  final Function()? onBookmarkPressed;
  final Function()? onInformationPressed;
  final Function()? onProfilePressed;
  final bool showButtonBack;
  final bool automaticallyImplyLeading;

  const MainAppBar({
    Key? key,
    this.title,
    required this.backgroundColor,
    required this.showBookmark,
    required this.showInformation,
    this.onBookmarkPressed,
    this.onInformationPressed,
    this.onProfilePressed,
    this.showButtonBack = false,
    this.automaticallyImplyLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        iconTheme: IconThemeData(color: DanaTheme.paletteDarkBlue),
        // set the color of the leading icon
        leading: showButtonBack
            ? IconButton(
                icon: buildSvgImage('ic_back_button.svg', 22),
                color: DanaTheme.paletteDarkBlue,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
        shadowColor: backgroundColor,
        elevation: 0,
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: (title != null)
            ? Text(
                title!,
                style: DanaTheme.titleAppbar,
              )
            : Container(),
        actions: [
          if (showInformation == true)
            TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(40, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.center),
                onPressed: onInformationPressed,
                child: Container(
                  height: 24,
                  width: 24,
                  child: buildSvgImage("information_appbar_icon.svg", 22),
                )),
          if (showBookmark == true)
            TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size(40, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.center),
              onPressed: onBookmarkPressed,
              child: Icon(
                Icons.bookmark,
                color: DanaTheme.paletteDarkBlue,
                size: 25,
              ),
            ),
          gapW8,
          Center(child: NotificationBell()),
          gapW24,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
            child: _ProfileSection(
              onPressed: onProfilePressed,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  final Function()? onPressed;

  const _ProfileSection({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userIconButton = SvgPicture.asset(
      '$ASSETS_IMAGES/user_no_premium_icon.svg',
    );
    final userPremiumIconButton = SvgPicture.asset(
      '$ASSETS_IMAGES/user_premium_icon.svg',
    );
    return BlocSelector<UserPremiumCubit, UserPremiumState, PremiumType>(
        bloc: locator<UserPremiumCubit>(),
        selector: (state) => state.premiumType,
        builder: (context, premiumType) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () async {
                await locator<InterestedEventCubit>().eventOfInterestHappened(
                    EventOfInterestedType.NAVIGATE_PROFILE, {});
                onPressed!();
              },
              child: premiumType == PremiumType.none
                  ? userIconButton
                  : userPremiumIconButton,
            ),
          );
        });
  }
}

class NotificationBell extends StatelessWidget {
  const NotificationBell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      bloc: locator<NotificationCubit>(),
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            await locator<InterestedEventCubit>().eventOfInterestHappened(
                EventOfInterestedType.NAVIGATE_NOTIFICATION, {});
            context.goNamed(AppRoutes.notificationCenter.name);
          },
          child: Badge(
            backgroundColor: DanaTheme.palleteRed,
            isLabelVisible: state.numberUnread > 0,
            label: Text(
              state.numberUnread.toString(),
              style: DanaTheme.textSuperSmallTextBold(Colors.white),
            ),
            child: SvgPicture.asset(
              '$ASSETS_IMAGES/bell.svg',
            ),
          ),
        );
      },
    );
  }
}
