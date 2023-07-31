//IMPORT EXTERN APP
import 'package:app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//IMPORT LOCAL APP
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/data/services/dana_analytics_service.dart';
import 'package:app/config/constants.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/core/di/locator.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/account.utils.dart';
import 'package:app/utils/screen_size.dart';
import 'package:app/widgets/account/buttons/footer_buttons_profile_9_widget.dart';
import 'package:app/widgets/shared/progress_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:app/features/user/app/cubits/initial_profile_state.dart';

class InitialProfilePage9 extends StatefulWidget {
  @override
  _InitialProfilePage9State createState() => _InitialProfilePage9State();
}

class _InitialProfilePage9State extends State<InitialProfilePage9> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _validate = false;

  @override
  void initState() {
    locator<InitialProfileCubit>().getUserByEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: ProgressAppBar(
            appBarType: AppBarType.ONLY_CLOSE,
            bgColor: DanaTheme.paletteFPink,
            currentValue: 9,
            totalValue: 9,
            horizontalPadding: 15),
        body: _screenPage9());
  }

  Widget _screenPage9() {
    return BlocBuilder<InitialProfileCubit, InitialProfileState>(
      bloc: locator<InitialProfileCubit>(),
      builder: (context, stateInitialProfile) {
        return Container(
          width: getScreenWidth(context),
          height: double.infinity,
          color: DanaTheme.paletteFPink,
          child: Column(
            children: [
              Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: EdgeInsets.only(
                              bottom: 9,
                              left: DanaTheme.bodyPadding,
                              right: DanaTheme.bodyPadding),
                          child: Text(
                              S.of(context).screenInitialProfilePage9Title,
                              style: DanaTheme.textHeadlineSmall(
                                  DanaTheme.paletteDarkBlue)))),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 25,
                          left: DanaTheme.bodyPadding,
                          right: DanaTheme.bodyPadding),
                      child: Text(
                        S.of(context).screenInitialProfilePage9SubTitle,
                        style: DanaTheme.textBody(
                          DanaTheme.paletteDarkBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 23,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          bottom: 100,
                          left: DanaTheme.bodyPadding,
                          right: DanaTheme.bodyPadding),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          AccountUtils().getOptionProfileInformation9(
                            context,
                            onTap: () => _setSupportGroup(
                                InitialProfileSupportGroup
                                    .NEVER_AND_NOT_INTERESTED),
                            supportGroup: InitialProfileSupportGroup
                                .NEVER_AND_NOT_INTERESTED,
                            supportGroupSelected:
                                stateInitialProfile.initialProfileSupportGroup,
                            text: S
                                .of(context)
                                .screenInitialProfilePage9NeverAndNotInterested,
                          ),
                          Container(height: 10),
                          AccountUtils().getOptionProfileInformation9(
                            context,
                            onTap: () => _setSupportGroup(
                                InitialProfileSupportGroup.NO_AND_INTERESTED),
                            supportGroup:
                                InitialProfileSupportGroup.NO_AND_INTERESTED,
                            supportGroupSelected:
                                stateInitialProfile.initialProfileSupportGroup,
                            text: S
                                .of(context)
                                .screenInitialProfilePage9NoAndInterested,
                          ),
                          Container(height: 10),
                          AccountUtils().getOptionProfileInformation9(
                            context,
                            onTap: () => _setSupportGroup(
                                InitialProfileSupportGroup.YES_PREVIOUSLY),
                            supportGroup:
                                InitialProfileSupportGroup.YES_PREVIOUSLY,
                            supportGroupSelected:
                                stateInitialProfile.initialProfileSupportGroup,
                            text: S
                                .of(context)
                                .screenInitialProfilePage9YesPreviously,
                          ),
                          Container(height: 10),
                          AccountUtils().getOptionProfileInformation9(
                            context,
                            onTap: () => _setSupportGroup(
                                InitialProfileSupportGroup.YES_CURRENTLY),
                            supportGroup:
                                InitialProfileSupportGroup.YES_CURRENTLY,
                            supportGroupSelected:
                                stateInitialProfile.initialProfileSupportGroup,
                            text: S
                                .of(context)
                                .screenInitialProfilePage9YesCurrently,
                          ),
                          Container(height: 50),
                        ],
                      ),
                    ),
                    FooterButtonsProfile9Widget(
                      onNextTap: () => _onNextClick(
                        initialProfileSupportGroup:
                            stateInitialProfile.initialProfileSupportGroup,
                      ),
                      onPreviousTap: () => _onPreviousClick(),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _onPreviousClick() {
    context.goNamed(AppRoutes.initialProfile8.name);
  }

  _onNextClick(
      {required InitialProfileSupportGroup initialProfileSupportGroup}) {
    locator<InitialProfileCubit>().setUserByEmail(data: {
      'updatedAt': Timestamp.now(),
      'profileSupportGroup':
          initialProfileSupportGroupToString(initialProfileSupportGroup),
    });
    DanaAnalyticsService.trackOnboardingComplete();
    //TODO : Check this line.
    context.goNamed(AppRoutes.succesDialogPage1.name);
  }

  _setSupportGroup(InitialProfileSupportGroup supportGroup) {
    locator<InitialProfileCubit>().changeInitialProfileSupportGroup(
        initialProfileSupportGroup: supportGroup);
  }
}
