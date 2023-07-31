//IMPORT EXTERN APP
//IMPORT INTERN APP
import 'package:app/config/constants.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:app/cubits/change_page/change_page_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProgramSuccessDialogWidget extends StatefulWidget {
  const ProgramSuccessDialogWidget({super.key});

  @override
  State<ProgramSuccessDialogWidget> createState() =>
      _ProgramSuccessDialogWidgetSuccessDialogWidgetState();
}

class _ProgramSuccessDialogWidgetSuccessDialogWidgetState
    extends State<ProgramSuccessDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DanaTheme.paletteDarkBlue,
        body: Container(
          color: DanaTheme.paletteDarkBlue,
          width: getScreenWidth(context),
          height: getScreenHeight(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  flex: 30,
                  child: Container(
                      width: getScreenWidth(context),
                      color: DanaTheme.paletteFBrown,
                      padding: EdgeInsets.all(0),
                      child: Stack(children: [
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                                height: 5, color: DanaTheme.paletteDarkBlue)),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                      height: 60, color: Colors.transparent)),
                              Expanded(
                                  flex: 28,
                                  child: Container(
                                      width: getScreenWidth(context),
                                      transform: Matrix4.translationValues(
                                          0.0, 0.25, 0.0),
                                      child: SvgPicture.asset(
                                          'assets/images/dana_mood_tracker_success.svg',
                                          fit: BoxFit.cover,
                                          alignment: Alignment.bottomCenter))),
                            ])
                      ]))),
              Expanded(
                  flex: 20,
                  child: Container(
                    padding: EdgeInsets.all(0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                S.of(context).programDialogSuccesTitle,
                                textAlign: TextAlign.center,
                                style: DanaTheme.textMarketingHeadline(
                                  DanaTheme.paletteWhite,
                                ),
                              )),
                          SizedBox(
                            height: 60,
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .read<ChangePageCubit>()
                                    .changeIndexPage(index: 0);
                                context.goNamed(AppRoutes.home.name);
                                context.pushNamed(
                                  AppRoutes.linkContent.name,
                                  queryParams: {
                                    "name": ProfileLinks.MY_PROGRESS.name,
                                    "tabId": "misSemanas"
                                  },
                                  extra: ProfileLinks.MY_PROGRESS,
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 330,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(180),
                                  child: Container(
                                    color: DanaTheme.paletteWhite,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Center(
                                        child: Text(
                                          S
                                              .of(context)
                                              .programDialogSuccesHighButtonText,
                                          style: DanaTheme.textCta(
                                              DanaTheme.paletteDarkBlue),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            child: GestureDetector(
                              onTap: () {
                                context.pop();
                                context
                                    .read<ChangePageCubit>()
                                    .changeIndexPage(index: 0);
                                context.goNamed(AppRoutes.home.name);
                                context.replaceNamed(
                                  AppRoutes.home.name,
                                );
                              },
                              child: Text(
                                S.of(context).programDialogSuccesSubText,
                                style: DanaTheme.textBody(
                                  DanaTheme.paletteWhite,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  )),
            ],
          ),
        ));
  }
}
