//IMPORT EXTERN APP

import 'package:app/config/constants.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/core/enums/status_cubit.dart';
//IMPORT INTERN APP
import 'package:app/core/routing/app_router.dart';
import 'package:app/cubits/change_page/change_page_cubit.dart';
import 'package:app/cubits/publications/publications_cubit.dart';
import 'package:app/cubits/user_premium/user_premium_cubit.dart';
import 'package:app/cubits/user_premium/user_premium_state.dart';
import 'package:app/features/deeplinks/app/cubits/deep_links/deeplink_cubit.dart';
import 'package:app/features/deeplinks/app/cubits/deep_links/deeplink_state.dart';
import 'package:app/features/deeplinks/domain/enums/deep_link_type.dart';
import 'package:app/models/banner_model.dart';
import 'package:app/models/publication_model.dart';
import 'package:app/screens/content/program_detail_page.dart';
import 'package:app/screens/content/publication_detail_page.dart';
import 'package:app/screens/main/main_page.dart';
import 'package:app/utils/banner.dart';
import 'package:app/utils/modal.dart';
import 'package:app/widgets/banner/banner_widget.dart';
import 'package:app/widgets/dialogs/finish_programs_pack_dialog.dart';
import 'package:app/widgets/dialogs/finish_subcription_plan_dialog.dart';
import 'package:app/widgets/dialogs/no_credit_dialog.dart';
import 'package:app/widgets/dialogs/unlocked_program_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/services/dana_analytics_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<DeeplinkCubit, DeeplinkState>(
            bloc: locator<DeeplinkCubit>()..init(),
            listenWhen: ((previous, current) {
              return current.deeplink != null && current.status.isSuccess;
            }),
            listener: (context, state) async {
              bool isPublicationAndNotNull =
                  state.deepLinkType == DeepLinkType.PUBLICATION &&
                      state.deeplink == "";

              bool isNotHomePageAndHasForceNaviagete =
                  !goRouter.location.contains(AppRoutes.home.name) ||
                      state.forceNavigate;
              bool isProgramDeepLink =
                  state.deepLinkType == DeepLinkType.PROGRAM;
              bool isDeepLinkNotNull =
                  state.deeplink == null || state.deeplink == "";

              bool isNotProgramDetailPageAndHasForceNaviagete = !goRouter
                      .location
                      .contains(AppRoutes.programDetailPage.name) ||
                  state.forceNavigate;
              bool isPublicationDeepLink =
                  state.deepLinkType == DeepLinkType.PUBLICATION;

              bool isNotPublicationDetailPageAndHasForeceNavigate =
                  !goRouter.location.contains(
                        AppRoutes.publicationDetailPage.name,
                      ) ||
                      state.forceNavigate;

              bool isMyProgressDeepLink =
                  state.deepLinkType == DeepLinkType.MY_PROGRESS;

              bool isConsultationDeepLink =
                  state.deepLinkType == DeepLinkType.CONSULTATION;

              bool isMyProgressDeepLinkAndForceNavigate =
                  !goRouter.location.contains(
                        AppRoutes.myProgresPage.name,
                      ) ||
                      state.forceNavigate;

              bool isMoodTrackerDeepLink =
                  state.deepLinkType == DeepLinkType.MOODTRACKER;

              if (isMoodTrackerDeepLink) {
                // if deep link types equal to isMoodTrackerDeepLink
                print("// if deep link types equal to isMoodTrackerDeepLink");
                context.read<ChangePageCubit>().changeIndexPage(index: 3);
              } else if (isPublicationAndNotNull) {
                // if deep link types equal to PUBLICATION and deep links not null
                print(
                    "// if deep link types equal to PUBLICATION and deep links not null");
                GoRouter.of(context).replaceNamed(AppRoutes.home.name);
                context.read<ChangePageCubit>().changeIndexPage(index: 2);
              } else if (isProgramDeepLink) {
                // if deep link types equal to PROGRAM
                print("  // if deep link types equal to PROGRAM");
                if (isDeepLinkNotNull) {
                  // if deep links not null
                  print("// if deep links not null");
                  context.read<ChangePageCubit>().changeIndexPage(index: 1);
                  if (isNotHomePageAndHasForceNaviagete) {
                    // if go router location dont contains home or state force navigater true
                    print(
                        "// if go router location dont contains home or state force navigater true");
                    context.goNamed(AppRoutes.home.name);
                  }
                  return;
                }
                if (isNotProgramDetailPageAndHasForceNaviagete) {
                  // if go router location dont contains program detail or state force navigater true
                  print(
                      "// if go router location dont contains program detail or state force navigater true");
                  goRouter.pushNamed(
                    AppRoutes.programDetailPage.name,
                    queryParams: {'programId': state.deeplink},
                    extra: ProgramDetailArguments(
                      programId: state.deeplink,
                      onBackPressed: () {},
                    ),
                  );
                }
              } else if (isPublicationDeepLink) {
                // if deep link types equal to PUBLICATION
                print("// if deep link types equal to PUBLICATION");

                if (isNotPublicationDetailPageAndHasForeceNavigate) {
                  // if go router location dont contains PUBLICATION page or state force navigater true
                  print(
                      "/ if go router location dont contains PUBLICATION page or state force navigater true");
                  await context
                      .read<PublicationsCubit>()
                      .getPublication(id: state.deeplink);
                  Publication? newPublication =
                      context.read<PublicationsCubit>().state.publication;
                  if (newPublication != null) {
                    GoRouter.of(context).pushNamed(
                      AppRoutes.publicationDetailPage.name,
                      queryParams: {
                        'publication_id': newPublication.id,
                        'publication_title': newPublication.title
                      },
                      extra: PublicationDetailArguments(
                        publication: newPublication,
                      ),
                    );
                  } else {
                    context.read<ChangePageCubit>().changeIndexPage(index: 2);
                  }
                }
              } else if (isConsultationDeepLink) {
                // if deep link types equal to CONSULTATION
                print("// if deep link types equal to CONSULTATION");

                context.pushNamed(
                  AppRoutes.consultationChatPage.name,
                );
              } else if (isMyProgressDeepLink) {
                // if deep link types equal to MYPROGRESS
                print("// if deep link types equal to MYPROGRESS");

                if (isMyProgressDeepLinkAndForceNavigate) {
                  // if go router location dont contains MYPROGRESS detail page or state force navigater true
                  print(
                      "/ if go router location dont contains MYPROGRESS detail page or state force navigater true");
                  context.pushNamed(
                    AppRoutes.linkContent.name,
                    queryParams: {
                      "name": ProfileLinks.MY_PROGRESS.name,
                      "tabId": state.deeplink ?? "enProgreso"
                    },
                    extra: ProfileLinks.MY_PROGRESS,
                  );
                }
              } else {
                print("Those conditions not equalt any contions");
              }
            },
          ),
          BlocListener<UserPremiumCubit, UserPremiumState>(
            bloc: locator<UserPremiumCubit>(),
            listener: (context, state) {
              if (state.showPremiumModal) {
                context.pushNamed(
                  AppRoutes.premiumDialog.name,
                  queryParams: {'programId': state.programToBuy!.id},
                );
              } else if (state.showBuyProgramModal) {
                DanaAnalyticsService.trackPlan3m5pUnblock(
                    state.programToBuy?.id);
                ShowModal.showBottomSheet(
                    context: context,
                    widget: UnlockedProgramDialog(
                      program: state.programToBuy!,
                    ));
              } else if (state.showBuyCreditsModal) {
                DanaAnalyticsService.trackPlan3m5pNoCreditLeft();
                ShowModal.showBottomSheet(
                    context: context, widget: NoCreditDialog());
              } else if (state.showFinish5PackModal) {
                ShowModal.showBottomSheet(
                    context: context, widget: FinishProgramsPackDialog());
              } else if (state.showFinishSubscriptionModal) {
                ShowModal.showBottomSheet(
                    context: context, widget: FinishSubscriptionPlanDialog());
              }
            },
          ),
        ],
        child: Stack(
          children: [
            MainPage(),
            StreamBuilder<CustomBanner?>(
              stream: BannerUtils.getStream()!.stream,
              builder: (context, snapshot) {
                final banner = snapshot.data ?? null;
                return Visibility(
                  visible: banner != null,
                  child: BannerWidget(banner: banner),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
