//IMPORT EXTERN APP
//IMPORT INTERN APP
import 'package:app/bloc_dependency.dart';
import 'package:app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'generated/l10n.dart';
import 'styles/dana_theme.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    // unitBookmarkController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocDependency.setBlocs(),
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context, c) {
          return MaterialApp.router(
            title: 'Dana',
            routerConfig: goRouter,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: DanaTheme().getInitialTheme(),
            builder: (context, child) {
              return MediaQuery(
                child: child!,
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              );
            },
          );
        },
      ),
    );
  }
}
