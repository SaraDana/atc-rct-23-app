//IMPORT EXTERN APP
import 'package:app/core/routing/app_router.dart';
import 'package:app/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//IMPORT LOCAL APP
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/config/constants.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/account.utils.dart';
import 'package:app/utils/screen_size.dart';
import 'package:app/widgets/account/buttons/footer_buttons_profile_8_widget.dart';
import 'package:app/widgets/shared/progress_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:app/features/user/app/cubits/initial_profile_state.dart';

class InitialProfilePage8 extends StatefulWidget {
  @override
  _InitialProfilePage8State createState() => _InitialProfilePage8State();
}

class _InitialProfilePage8State extends State<InitialProfilePage8> {
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
        currentValue: 8,
        totalValue: 9,
        horizontalPadding: 15,
      ),
      body: _screenPage8(),
    );
  }

  Widget _screenPage8() {
    return BlocBuilder<InitialProfileCubit, InitialProfileState>(
      bloc: locator<InitialProfileCubit>(),
      builder: (context, stateInitialProfile) {
        return Container(
          width: getScreenWidth(context),
          height: double.infinity,
          color: DanaTheme.paletteFPink,
          child: Stack(
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
                        S.of(context).screenInitialProfilePage8Title,
                        style: DanaTheme.textHeadlineSmall(
                            DanaTheme.paletteDarkBlue),
                      ),
                    ),
                  ),
                  Container(height: 10),
                  Container(
                    padding: EdgeInsets.only(
                        bottom: 130,
                        left: DanaTheme.bodyPadding,
                        right: DanaTheme.bodyPadding),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        AccountUtils().getOptionProfileInformation8(
                          context,
                          onTap: () => _setPsychologicalTherapy(
                            InitialProfilePsychologicalTherapy
                                .NEVER_AND_NOT_INTERESTED,
                          ),
                          psychologicalTherapySelected: stateInitialProfile
                              .initialProfilePsychologicalTherapy,
                          therapy: InitialProfilePsychologicalTherapy
                              .NEVER_AND_NOT_INTERESTED,
                          text: S
                              .of(context)
                              .screenInitialProfilePage8NeverAndNotInterested,
                        ),
                        Container(height: 10),
                        AccountUtils().getOptionProfileInformation8(
                          context,
                          onTap: () => _setPsychologicalTherapy(
                            InitialProfilePsychologicalTherapy
                                .NO_AND_INTERESTED,
                          ),
                          psychologicalTherapySelected: stateInitialProfile
                              .initialProfilePsychologicalTherapy,
                          therapy: InitialProfilePsychologicalTherapy
                              .NO_AND_INTERESTED,
                          text: S
                              .of(context)
                              .screenInitialProfilePage8NoAndInterested,
                        ),
                        Container(height: 10),
                        AccountUtils().getOptionProfileInformation8(
                          context,
                          onTap: () => _setPsychologicalTherapy(
                            InitialProfilePsychologicalTherapy.YES_PREVIOUSLY,
                          ),
                          psychologicalTherapySelected: stateInitialProfile
                              .initialProfilePsychologicalTherapy,
                          therapy:
                              InitialProfilePsychologicalTherapy.YES_PREVIOUSLY,
                          text: S
                              .of(context)
                              .screenInitialProfilePage8YesPreviously,
                        ),
                        Container(height: 10),
                        AccountUtils().getOptionProfileInformation8(
                          context,
                          onTap: () => _setPsychologicalTherapy(
                            InitialProfilePsychologicalTherapy.YES_CURRENTLY,
                          ),
                          psychologicalTherapySelected: stateInitialProfile
                              .initialProfilePsychologicalTherapy,
                          therapy:
                              InitialProfilePsychologicalTherapy.YES_CURRENTLY,
                          text: S
                              .of(context)
                              .screenInitialProfilePage8YesCurrently,
                        ),
                        Container(height: 50),
                      ],
                    ),
                  ),
                ],
              ),
              FooterButtonsProfile8Widget(
                onPreviousTap: () => _onPreviousClick(),
                onNextTap: () => _onNextClick(
                    initialProfilePsychologicalTherapy:
                        stateInitialProfile.initialProfilePsychologicalTherapy),
              ),
            ],
          ),
        );
      },
    );
  }

  _onPreviousClick() {
    context.goNamed(AppRoutes.initialProfile7.name);
  }

  _onNextClick(
      {required InitialProfilePsychologicalTherapy
          initialProfilePsychologicalTherapy}) {
    locator<InitialProfileCubit>().setUserByEmail(data: {
      'updatedAt': Timestamp.now(),
      'profilePsychologicalTherapy': initialProfilePsychologicalTherapyToString(
          initialProfilePsychologicalTherapy),
    });
    context.goNamed(AppRoutes.initialProfile9.name);
  }

  _setPsychologicalTherapy(InitialProfilePsychologicalTherapy therapy) {
    locator<InitialProfileCubit>().changeInitialProfilePsychologicalTherapy(
        initialProfilePsychologicalTherapy: therapy);
  }
}
