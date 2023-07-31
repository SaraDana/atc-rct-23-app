import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/status_cubit.dart';
import 'package:app/core/utils/date_time_utils.dart';
import 'package:app/features/notifications/app/cubits/notification_cubit.dart';
import 'package:app/features/notifications/app/ui/widgets/header_divider.dart';
import 'package:app/features/notifications/app/ui/widgets/notification_tile.dart';
import 'package:app/features/notifications/domain/enums/separator_type.dart';
import 'package:app/features/notifications/domain/models/notification.dart'
    as noti;
import 'package:app/features/notifications/domain/models/notification.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/images.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

SeparatorType _lastSeparatorType = SeparatorType.DEFAULT;

class NotificationCenterPage extends StatelessWidget {
  const NotificationCenterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: IconButton(
            icon: buildSvgImage('ic_back_button.svg', 22),
            color: DanaTheme.paletteDarkBlue,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          S.current.notifications,
          style: DanaTheme.textBodyBold(DanaTheme.paletteDarkBlue),
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<NotificationCubit, NotificationState>(
        bloc: locator<NotificationCubit>()..refreshNotifications(),
        builder: (context, state) {
          if (state.status == StatusCubit.LOADING &&
              state.notifications.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: DanaTheme.paletteFPink,
              ),
            );
          }
          if (state.notifications.isNotEmpty) {
            return InfiniteList(
              isLoading: state.status == StatusCubit.LOADING,
              itemCount: state.notifications.length,
              itemBuilder: (context, index) {
                final notification = state.notifications[index];
                SeparatorType currentSeparatorType =
                    _calculateSeparatorType(notification);
                if (currentSeparatorType != _lastSeparatorType || index == 0) {
                  _lastSeparatorType = currentSeparatorType;
                  return Column(
                    children: [
                      HeaderDivider(
                        separatorType: currentSeparatorType,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: NotificationTile(
                          notification: notification,
                        ),
                      )
                    ],
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: NotificationTile(
                      notification: notification,
                    ),
                  );
                }
              },
              onFetchData: () =>
                  locator<NotificationCubit>().fetchMoreNotifications(),
              loadingBuilder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: DanaTheme.paletteFPink,
                ),
              ),
            );
          }
          return Center(
            child: Text(S.current.notifications_empty),
          );
        },
      ),
    );
  }

  SeparatorType _calculateSeparatorType(NotificationModel notification) {
    final DateTime itemDate = _getItemDate(notification);
    SeparatorType currentSeparatorType = SeparatorType.DEFAULT;
    if (itemDate.isToday() || itemDate.isYesterday() || itemDate.isThisWeek()) {
      currentSeparatorType = SeparatorType.ACTUAL;
    } else {
      currentSeparatorType = SeparatorType.OLD;
    }
    return currentSeparatorType;
  }
}

_getItemDate(noti.NotificationModel notification) {
  return timeStampToDateTime(notification.creationDate.toInt());
}
