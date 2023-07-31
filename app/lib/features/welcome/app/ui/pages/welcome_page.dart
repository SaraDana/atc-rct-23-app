//IMPORT EXTERN APP
import 'package:app/features/welcome/app/ui/pages/welcome_page_1.dart';
import 'package:app/features/welcome/app/ui/pages/welcome_page_2.dart';
import 'package:app/features/welcome/app/ui/pages/welcome_page_3.dart';
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/core/routing/app_router.dart';

import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/screen_size.dart';
import 'package:app/widgets/onboarding/onboarding_footer_buttons.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final controller = PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = [
      WelcomePage1(),
      WelcomePage2(),
      WelcomePage3(),
    ];

    return Scaffold(
      body: Container(
        color: DanaTheme.paletteDarkBlue,
        width: double.infinity,
        height: getScreenHeight(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 14,
              child: SizedBox(
                width: double.infinity,
                child: PageView.builder(
                  controller: controller,
                  // itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SmoothPageIndicator(
                controller: controller,
                count: pages.length,
                effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    dotColor: DanaTheme.paletteWhite,
                    expansionFactor: 6,
                    activeDotColor: DanaTheme.paletteWhite),
              ),
            ),
            Expanded(
              flex: 2,
              child: OnBoardingFooterButtons(onLoginClick: () {
                context.goNamed(AppRoutes.login.name);
              }, onRegisterClick: () {
                context.goNamed(AppRoutes.register.name);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
