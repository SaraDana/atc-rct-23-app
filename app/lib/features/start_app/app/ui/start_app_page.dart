import 'package:app/core/routing/app_router.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/features/start_app/app/cubit/start_app_cubit.dart';
import 'package:app/features/start_app/app/cubit/start_app_state.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/styles/styles.dart';
import 'package:app/utils/modal.dart';
import 'package:app/utils/screen_size.dart';
import 'package:app/widgets/dialogs/need_update_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class StartAppPage extends StatelessWidget {
  const StartAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StartAppCubit, StartAppState>(
      bloc: locator<StartAppCubit>()..init(),
      listener: (context, state) {
        if (state.appVersionConfig != null &&
            state.appVersionConfig!.needShowUpdate) {
          DanaAnalyticsService.trackForceUpdateShown();
          return ShowModal.showBottomSheet(
              isDismissible: false,
              context: context,
              widget: Material(child: NeedUpdateDialog()));
        }
        if (state.error) {
          return context.goNamed(AppRoutes.welcome.name);
        }
        if (state.isLogged != true) {
          return context.goNamed(AppRoutes.welcome.name);
        }
        if (state.showOnboarding == true) {
          DanaAnalyticsService.trackVisitPage(
              'initial_profile_page_onboarding');
          return context.goNamed(AppRoutes.initialProfileOnboarding.name);
        }

        return context.goNamed(AppRoutes.home.name);
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            color: DanaTheme.paletteDarkBlue,
            width: getScreenWidth(context),
            child: Column(
              children: [
                Expanded(
                  flex: 20,
                  child: Stack(
                    children: [
                      Container(color: DanaTheme.paletteLightGrey),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(flex: 10, child: Container(height: 0)),
                          Expanded(
                            flex: 4,
                            child: Container(
                              width: double.infinity,
                              child: SvgPicture.asset('assets/images/logo.svg',
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                          Expanded(
                            flex: 40,
                            child: Container(
                              //rotate image 180 grades
                              child: SvgPicture.asset(
                                  'assets/images/dana_register_success.svg',
                                  width: getScreenWidth(context),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.bottomRight),
                            ),
                          ),
                          //offset 1%
                          Expanded(
                            flex: 20,
                            child: Container(
                              transform: Matrix4.translationValues(0, -0.5, 0),
                              color: DanaTheme.paletteDarkBlue,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: ProgressBarAnimation(
                                      duration: const Duration(seconds: 10),
                                      color: DanaTheme.paletteDanaPink,
                                      backgroundColor: DanaTheme.paletteFPink,
                                    ),
                                  ),
                                  gapH24,
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      S.current.loadingSession,
                                      textAlign: TextAlign.center,
                                      style: kBodyStyleOnboarding,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
