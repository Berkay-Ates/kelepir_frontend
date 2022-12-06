import 'package:flutter/material.dart';
import 'package:kelepir/core/init/theme/apptheme/app_theme.dart';
import 'package:kelepir/core/init/theme/darkTheme/dark_theme.dart';

import 'core/init/navigation/navigation_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final navigationService = NavigationService.instance;
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ProjectAppTheme<ProjectDarkTheme>(appTheme: ProjectDarkTheme()).themeData,
      routeInformationParser: navigationService.router.routeInformationParser,
      routeInformationProvider: navigationService.router.routeInformationProvider,
      routerDelegate: navigationService.router.routerDelegate,
    );
  }
}
