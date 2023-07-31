//IMPORT EXTERN APP
import 'package:app/core/routing/app_router.dart';
import 'package:app/features/deeplinks/app/cubits/deep_links/deeplink_cubit.dart';
import 'package:app/core/di/locator.dart';
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:go_router/go_router.dart';

class OnboardinProfileBodyWidget extends StatelessWidget {
  const OnboardinProfileBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: SizedBox(
              child: Text(
                S.of(context).screenRegisterTitle,
                style: DanaTheme.textMarketingHeadline(DanaTheme.paletteWhite),
              ),
            ),
          ),
          Expanded(
            flex: 22,
            child: SizedBox(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: DanaTheme.bodyPadding),
                child: Text(
                  S.of(context).pageInitialProfileOnboarding,
                  textAlign: TextAlign.center,
                  style: DanaTheme.textBody(DanaTheme.paletteWhite),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(height: 0),
          ),
          Expanded(
            flex: 9,
            child: SizedBox(
              child: GestureDetector(
                onTap: () => _openProfileTest(context),
                child: Container(
                  height: 60,
                  width: 333,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(180),
                    child: Container(
                      color: DanaTheme.paletteWhite,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: Text(
                            S
                                .of(context)
                                .screenInitialProfileOnBoardingButtonYes,
                            style: DanaTheme.textCta(DanaTheme.paletteDarkBlue),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(flex: 2, child: Container(height: 0)),
          Expanded(
            flex: 8,
            child: SizedBox(
              child: GestureDetector(
                onTap: () {
                  context.pop();
                  locator<DeeplinkCubit>().checkPendingDynamicLink();
                },
                child: Text(
                  S.of(context).screenInitialProfileOnBoardingButtonNo,
                  style: DanaTheme.textBody(DanaTheme.paletteWhite),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _openProfileTest(BuildContext context) {
    context.goNamed(AppRoutes.initialProfile1.name);
  }
}
