import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/background.dart';

import 'package:app/widgets/shared/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthPageLayout extends StatelessWidget {
  const AuthPageLayout({
    required this.appBarTitle,
    required this.footer,
    required this.child,
  }) : super();

  final String appBarTitle;
  final Widget footer;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: appBarTitle,
        onBackPressed: () => context.canPop() ? context.pop() : null,
      ),
      body: Stack(
        children: [
          buildBackground(),
          footer,
          Padding(
            padding: const EdgeInsets.only(bottom: 120.0),
            child: Container(
              padding: EdgeInsets.all(DanaTheme.bodyPadding),
              color: Colors.transparent,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
