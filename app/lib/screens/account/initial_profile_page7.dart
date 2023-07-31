//IMPORT EXTERN APP
import 'package:app/core/routing/app_router.dart';
import 'package:app/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//IMPORT INTERN APP
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/config/constants.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/account.utils.dart';
import 'package:app/utils/screen_size.dart';
import 'package:app/widgets/account/buttons/footer_buttons_profile_7_widget.dart';
import 'package:app/widgets/shared/progress_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:app/features/user/app/cubits/initial_profile_state.dart';

class InitialProfilePage7 extends StatefulWidget {
  @override
  _InitialProfilePage7State createState() => _InitialProfilePage7State();
}

class _InitialProfilePage7State extends State<InitialProfilePage7> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _validate = false;
  var maxSelected = 50;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: ProgressAppBar(
          appBarType: AppBarType.ONLY_CLOSE,
          bgColor: DanaTheme.paletteLightGrey,
          currentValue: 7,
          totalValue: 9,
          horizontalPadding: 15),
      body: _screenPage7(),
    );
  }

  Widget _screenPage7() {
    return BlocBuilder<InitialProfileCubit, InitialProfileState>(
      bloc: locator<InitialProfileCubit>(),
      builder: (context, stateInitialProfile) {
        return Container(
          width: getScreenWidth(context),
          height: double.infinity,
          color: DanaTheme.paletteLightGrey,
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
                        S.of(context).screenInitialProfilePage7Title,
                        style: DanaTheme.textHeadlineSmall(
                          DanaTheme.paletteDarkBlue,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 25,
                          left: DanaTheme.bodyPadding,
                          right: DanaTheme.bodyPadding),
                      child: Text(
                        S.of(context).screenInitialProfilePageSelectAll,
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
                      height: double.infinity,
                      padding: EdgeInsets.only(
                          bottom: 100,
                          left: DanaTheme.bodyPadding,
                          right: DanaTheme.bodyPadding),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          AccountUtils().getOptionProfileInformation7(
                            context,
                            image: 'bg_emotion_anxiety.svg',
                            item: InitialProfileEmotions.ANXIETY,
                            onTap: () {
                              _setItemSelected(
                                item: InitialProfileEmotions.ANXIETY,
                                selectedItemsProfileEmotions:
                                    stateInitialProfile
                                        .selectedItemsProfileEmotions,
                              );
                            },
                            selectedItems: stateInitialProfile
                                .selectedItemsProfileEmotions,
                            text:
                                S.of(context).screenInitialProfilePage7Anxiety,
                          ),
                          Container(height: 10),
                          AccountUtils().getOptionProfileInformation7(
                            context,
                            image: 'bg_emotion_afraid.svg',
                            item: InitialProfileEmotions.AFRAID,
                            onTap: () {
                              _setItemSelected(
                                item: InitialProfileEmotions.AFRAID,
                                selectedItemsProfileEmotions:
                                    stateInitialProfile
                                        .selectedItemsProfileEmotions,
                              );
                            },
                            selectedItems: stateInitialProfile
                                .selectedItemsProfileEmotions,
                            text: S.of(context).screenInitialProfilePage7Afraid,
                          ),
                          Container(height: 10),
                          AccountUtils().getOptionProfileInformation7(
                            context,
                            image: 'bg_emotion_depression.svg',
                            item: InitialProfileEmotions.SADNESS,
                            onTap: () {
                              _setItemSelected(
                                item: InitialProfileEmotions.SADNESS,
                                selectedItemsProfileEmotions:
                                    stateInitialProfile
                                        .selectedItemsProfileEmotions,
                              );
                            },
                            selectedItems: stateInitialProfile
                                .selectedItemsProfileEmotions,
                            text:
                                S.of(context).screenInitialProfilePage7Sadness,
                          ),
                          Container(height: 10),
                          AccountUtils().getOptionProfileInformation7(
                            context,
                            image: 'bg_emotion_loneliness.svg',
                            item: InitialProfileEmotions.LONELINESS,
                            onTap: () {
                              _setItemSelected(
                                item: InitialProfileEmotions.LONELINESS,
                                selectedItemsProfileEmotions:
                                    stateInitialProfile
                                        .selectedItemsProfileEmotions,
                              );
                            },
                            selectedItems: stateInitialProfile
                                .selectedItemsProfileEmotions,
                            text: S
                                .of(context)
                                .screenInitialProfilePage7Loneliness,
                          ),
                          Container(height: 10),
                          AccountUtils().getOptionProfileInformation7(
                            context,
                            image: 'bg_emotion_self_care.svg',
                            item: InitialProfileEmotions.SELF_CARE,
                            onTap: () {
                              _setItemSelected(
                                item: InitialProfileEmotions.SELF_CARE,
                                selectedItemsProfileEmotions:
                                    stateInitialProfile
                                        .selectedItemsProfileEmotions,
                              );
                            },
                            selectedItems: stateInitialProfile
                                .selectedItemsProfileEmotions,
                            text:
                                S.of(context).screenInitialProfilePage7SelfCare,
                          ),
                          Container(height: 10),
                          AccountUtils().getOptionProfileInformation7(
                            context,
                            image: 'bg_emotion_fault.svg',
                            item: InitialProfileEmotions.FAULT,
                            onTap: () {
                              _setItemSelected(
                                item: InitialProfileEmotions.FAULT,
                                selectedItemsProfileEmotions:
                                    stateInitialProfile
                                        .selectedItemsProfileEmotions,
                              );
                            },
                            selectedItems: stateInitialProfile
                                .selectedItemsProfileEmotions,
                            text: S.of(context).screenInitialProfilePage7Fault,
                          ),
                          Container(height: 10),
                          AccountUtils().getOptionProfileInformation7(
                            context,
                            image: 'bg_emotion_baby_link.svg',
                            item: InitialProfileEmotions.BABY_LINK,
                            onTap: () {
                              _setItemSelected(
                                item: InitialProfileEmotions.BABY_LINK,
                                selectedItemsProfileEmotions:
                                    stateInitialProfile
                                        .selectedItemsProfileEmotions,
                              );
                            },
                            selectedItems: stateInitialProfile
                                .selectedItemsProfileEmotions,
                            text:
                                S.of(context).screenInitialProfilePage7BabyLink,
                          ),
                          Container(height: 10),
                          AccountUtils().getOptionProfileInformation7(
                            context,
                            image: 'bg_emotion_sleep_quality.svg',
                            item: InitialProfileEmotions.SLEEP_QUALITY,
                            onTap: () {
                              _setItemSelected(
                                item: InitialProfileEmotions.SLEEP_QUALITY,
                                selectedItemsProfileEmotions:
                                    stateInitialProfile
                                        .selectedItemsProfileEmotions,
                              );
                            },
                            selectedItems: stateInitialProfile
                                .selectedItemsProfileEmotions,
                            text: S
                                .of(context)
                                .screenInitialProfilePage7SleepQuality,
                          ),
                          Container(height: 10),
                          AccountUtils().getOptionProfileInformation7(
                            context,
                            image: 'bg_emotion_relationship.svg',
                            item: InitialProfileEmotions.RELATIONSHIP,
                            onTap: () {
                              _setItemSelected(
                                item: InitialProfileEmotions.RELATIONSHIP,
                                selectedItemsProfileEmotions:
                                    stateInitialProfile
                                        .selectedItemsProfileEmotions,
                              );
                            },
                            selectedItems: stateInitialProfile
                                .selectedItemsProfileEmotions,
                            text: S
                                .of(context)
                                .screenInitialProfilePage7Relationship,
                          ),
                          Container(height: 10),
                          AccountUtils().getOptionProfileInformation7(
                            context,
                            image: 'bg_emotion_nutrition.svg',
                            item: InitialProfileEmotions.NUTRITION,
                            onTap: () {
                              _setItemSelected(
                                item: InitialProfileEmotions.NUTRITION,
                                selectedItemsProfileEmotions:
                                    stateInitialProfile
                                        .selectedItemsProfileEmotions,
                              );
                            },
                            selectedItems: stateInitialProfile
                                .selectedItemsProfileEmotions,
                            text: S
                                .of(context)
                                .screenInitialProfilePage7Nutrition,
                          ),
                          Container(height: 10),
                          AccountUtils().getOptionProfileInformation7(
                            context,
                            image: 'bg_emotion_others.svg',
                            item: InitialProfileEmotions.OTHERS,
                            onTap: () {
                              _setItemSelected(
                                item: InitialProfileEmotions.OTHERS,
                                selectedItemsProfileEmotions:
                                    stateInitialProfile
                                        .selectedItemsProfileEmotions,
                              );
                            },
                            selectedItems: stateInitialProfile
                                .selectedItemsProfileEmotions,
                            text: S.of(context).screenInitialProfilePage7Others,
                          ),
                          Container(height: 50),
                        ],
                      ),
                    ),
                    FooterButtonsProfile7(
                      onNextTap: () => _onNextClick(
                        selectedItemsProfileEmotions:
                            stateInitialProfile.selectedItemsProfileEmotions,
                      ),
                      onPreviousTap: () => _onPreviousClick(),
                    ),
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
    context.goNamed(AppRoutes.initialProfile6.name);
  }

  _onNextClick(
      {required List<InitialProfileEmotions> selectedItemsProfileEmotions}) {
    setState(() {
      isValidForm(selectedItemsProfileEmotions: selectedItemsProfileEmotions)
          ? _validate = false
          : _validate = true;
    });
    if (isValidForm(
        selectedItemsProfileEmotions: selectedItemsProfileEmotions)) {
      locator<InitialProfileCubit>().setUserByEmail(data: {
        'updatedAt': Timestamp.now(),
        'profileEmotions': FieldValue.arrayUnion(_getArraySelected(
            selectedItemsProfileEmotions: selectedItemsProfileEmotions)),
      });
      context.goNamed(AppRoutes.initialProfile8.name);
    }
  }

  isValidForm(
      {required List<InitialProfileEmotions> selectedItemsProfileEmotions}) {
    if (selectedItemsProfileEmotions.length > 0) {
      return true;
    }
    return false;
  }

  _setItemSelected(
      {required InitialProfileEmotions item,
      required List<InitialProfileEmotions> selectedItemsProfileEmotions}) {
    selectedItemsProfileEmotions.contains(item)
        ? selectedItemsProfileEmotions.remove(item)
        : selectedItemsProfileEmotions.length < maxSelected
            ? selectedItemsProfileEmotions.add(item)
            : null;

    locator<InitialProfileCubit>().changeSelectedItemsProfileEmotions(
        selectedItemsProfileEmotions: selectedItemsProfileEmotions);
  }

  _getArraySelected(
      {required List<InitialProfileEmotions> selectedItemsProfileEmotions}) {
    List<dynamic> result = [];
    for (var x in selectedItemsProfileEmotions) {
      result.add({"value": InitialProfileEmotionsToString(x)});
    }
    return result;
  }
}
