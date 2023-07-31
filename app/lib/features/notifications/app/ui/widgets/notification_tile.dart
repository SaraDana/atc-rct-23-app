import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/interested_event_enum.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/core/utils/date_time_utils.dart';
import 'package:app/cubits/interested_event/interested_event_cubit.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/deeplinks/app/cubits/deep_links/deeplink_cubit.dart';
import 'package:app/features/notifications/domain/models/notification.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;
  const NotificationTile({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
          await locator<InterestedEventCubit>()
          .eventOfInterestHappened(EventOfInterestedType.OPEN_NOTIFICATION, {
        "notificationID": notification.id.toString(),
      });
        locator<DeeplinkCubit>().openLink(deeplink:Uri.parse(notification.url));
       DanaAnalyticsService.trackNotificationCenterNotificationClicked(notification.id, notification.type.name);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Avatar(notification: notification),
            gapW16,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(notification.message)),
                gapH12,
                Row(
                  children: [
                    Text(
                        timeStampToDateTime(notification.creationDate.toInt())
                            .getTimePassed(),
                        style: DanaTheme.textSuperSmallTextPremium(
                            DanaTheme.paletteGreyMedium)),
                    gapW24,
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/reply.svg'),
                        gapW8,
                        Text(
                          'Responder',
                          style: DanaTheme.textSuperSmallTextPremium(
                              DanaTheme.paletteGreyMedium),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final NotificationModel notification;
  const _Avatar({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return notification.multipleUsersNotification
        ? SizedBox(
            height: 50,
            width: 50,
            child: Stack(
              children: [
                Positioned(
                  right: 10,
                  bottom:
                      10, // Lo posicionamos en la parte inferior del primer CircleAvatar
                  child: CircleAvatar(
                    backgroundColor: DanaTheme.paletteDarkBlue,
                  ),
                ),
                Center(
                  child: CircleAvatar(
                    radius: 21,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: DanaTheme.paletteDarkBlue,
                      child: Text(
                        notification.userName.substring(0, 1),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : CircleAvatar(
            backgroundColor: DanaTheme.paletteDarkBlue,
            child: Text(
              notification.userName.substring(0, 1),
              style: TextStyle(color: Colors.white),
            ),
          );
  }
}
