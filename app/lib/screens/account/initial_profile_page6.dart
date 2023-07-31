//IMPORT LOCAL APP
import 'package:app/core/routing/app_router.dart';
import 'package:app/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//IMPORT EXTERN APP
import 'package:app/features/user/app/cubits/initial_profile_cubit.dart';
import 'package:app/config/constants.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/account.utils.dart';
import 'package:app/utils/screen_size.dart';
import 'package:app/widgets/account/buttons/footer_buttons_profile_6_widget.dart';
import 'package:app/widgets/shared/progress_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:app/features/user/app/cubits/initial_profile_state.dart';

class InitialProfilePage6 extends StatefulWidget {
  @override
  _InitialProfilePage6State createState() => _InitialProfilePage6State();
}

class _InitialProfilePage6State extends State<InitialProfilePage6> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _validate = false;
  var maxSelected = 6;

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
            bgColor: DanaTheme.paletteLightGrey,
            currentValue: 6,
            totalValue: 9,
            horizontalPadding: 15),
        body: _screenPage6());
  }

  Widget _screenPage6() {
    return BlocBuilder<InitialProfileCubit, InitialProfileState>(
      bloc: locator<InitialProfileCubit>(),
      builder: (context, stateInitialProfile) {
        return Container(
          width: getScreenWidth(context),
          height: double.infinity,
          color: DanaTheme.paletteLightGrey,
          child: Column(
            children: [
              Column(children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: EdgeInsets.only(
                            bottom: 9,
                            left: DanaTheme.bodyPadding,
                            right: DanaTheme.bodyPadding),
                        child: Text(
                            S.of(context).screenInitialProfilePage6Title,
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
                            S.of(context).screenInitialProfilePageSelectAll,
                            style:
                                DanaTheme.textBody(DanaTheme.paletteDarkBlue))))
              ]),
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
                          AccountUtils().getOptionsProfileInformation6(
                            context,
                            item:
                                InitialProfileContentType.EMOTIONAL_MANAGEMENT,
                            onTap: () => _setItemSelected(
                              item: InitialProfileContentType
                                  .EMOTIONAL_MANAGEMENT,
                              selectedItemsProfileContentType:
                                  stateInitialProfile
                                      .selectedItemsProfileContentType,
                            ),
                            selectedItems: stateInitialProfile
                                .selectedItemsProfileContentType,
                            text: S
                                .of(context)
                                .screenInitialProfilePage6EmotionalManagement,
                          ),
                          Container(height: 10),
                          AccountUtils().getOptionsProfileInformation6(
                            context,
                            item: InitialProfileContentType.YOGA,
                            onTap: () => _setItemSelected(
                              item: InitialProfileContentType.YOGA,
                              selectedItemsProfileContentType:
                                  stateInitialProfile
                                      .selectedItemsProfileContentType,
                            ),
                            selectedItems: stateInitialProfile
                                .selectedItemsProfileContentType,
                            text: S.of(context).screenInitialProfilePage6Yoga,
                          ),
                          Container(height: 10),
                          AccountUtils().getOptionsProfileInformation6(
                            context,
                            item: InitialProfileContentType.MINDFULNESS,
                            onTap: () => _setItemSelected(
                              item: InitialProfileContentType.MINDFULNESS,
                              selectedItemsProfileContentType:
                                  stateInitialProfile
                                      .selectedItemsProfileContentType,
                            ),
                            selectedItems: stateInitialProfile
                                .selectedItemsProfileContentType,
                            text: S
                                .of(context)
                                .screenInitialProfilePage6Mindfulness,
                          ),
                          Container(height: 10),
                          AccountUtils().getOptionsProfileInformation6(
                            context,
                            item: InitialProfileContentType.SPORT,
                            onTap: () => _setItemSelected(
                              item: InitialProfileContentType.SPORT,
                              selectedItemsProfileContentType:
                                  stateInitialProfile
                                      .selectedItemsProfileContentType,
                            ),
                            selectedItems: stateInitialProfile
                                .selectedItemsProfileContentType,
                            text: S.of(context).screenInitialProfilePage6Sport,
                          ),
                          Container(height: 10),
                          AccountUtils().getOptionsProfileInformation6(
                            context,
                            item: InitialProfileContentType.GENERAL_INFORMATION,
                            onTap: () => _setItemSelected(
                              item:
                                  InitialProfileContentType.GENERAL_INFORMATION,
                              selectedItemsProfileContentType:
                                  stateInitialProfile
                                      .selectedItemsProfileContentType,
                            ),
                            selectedItems: stateInitialProfile
                                .selectedItemsProfileContentType,
                            text: S
                                .of(context)
                                .screenInitialProfilePage6GeneralInformation,
                          ),
                          Container(height: 10),
                          AccountUtils().getOptionsProfileInformation6(
                            context,
                            item: InitialProfileContentType
                                .SCIENTIFIC_INFORMATION,
                            onTap: () => _setItemSelected(
                              item: InitialProfileContentType
                                  .SCIENTIFIC_INFORMATION,
                              selectedItemsProfileContentType:
                                  stateInitialProfile
                                      .selectedItemsProfileContentType,
                            ),
                            selectedItems: stateInitialProfile
                                .selectedItemsProfileContentType,
                            text: S
                                .of(context)
                                .screenInitialProfilePage6ScientificInformation,
                          ),
                          Container(height: 50),
                        ],
                      ),
                    ),
                    FooterButtonsProfile6Widget(
                      onNextTap: () => _onNextClick(
                          selectedItemsProfileContentType: stateInitialProfile
                              .selectedItemsProfileContentType),
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
    context.goNamed(AppRoutes.initialProfile4.name);
  }

  _onNextClick(
      {required List<InitialProfileContentType>
          selectedItemsProfileContentType}) {
    setState(() {
      isValidForm(
              selectedItemsProfileContentType: selectedItemsProfileContentType)
          ? _validate = false
          : _validate = true;
    });
    if (isValidForm(
        selectedItemsProfileContentType: selectedItemsProfileContentType)) {
      locator<InitialProfileCubit>().setUserByEmail(data: {
        'updatedAt': Timestamp.now(),
        'profileContentType': FieldValue.arrayUnion(_getArraySelected(
            selectedItemsProfileContentType: selectedItemsProfileContentType)),
      });
      context.goNamed(AppRoutes.initialProfile7.name);
    }
  }

  isValidForm(
      {required List<InitialProfileContentType>
          selectedItemsProfileContentType}) {
    if (selectedItemsProfileContentType.length > 0) {
      return true;
    }
    return false;
  }

  _setItemSelected(
      {required InitialProfileContentType item,
      required List<InitialProfileContentType>
          selectedItemsProfileContentType}) {
    setState(() {
      selectedItemsProfileContentType.contains(item)
          ? selectedItemsProfileContentType.remove(item)
          : selectedItemsProfileContentType.length < maxSelected
              ? selectedItemsProfileContentType.add(item)
              : null;
    });
    locator<InitialProfileCubit>().changeSelectedItemsProfileContentType(
        selectedItemsProfileContentType: selectedItemsProfileContentType);
  }

  _getArraySelected(
      {required List<InitialProfileContentType>
          selectedItemsProfileContentType}) {
    List<dynamic> result = [];
    for (var x in selectedItemsProfileContentType) {
      result.add({"value": InitialProfileContentTypeToString(x)});
    }
    return result;
  }
}
