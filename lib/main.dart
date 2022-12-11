import 'package:flutter/material.dart';
import 'package:kelepir/core/init/theme/apptheme/app_theme.dart';

import 'core/init/navigation/navigation_service.dart';
import 'core/init/theme/lightTheme/light_theme.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final navigationService = NavigationService.instance;
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal,
      ),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ProjectAppTheme<ProjectLightTheme>(appTheme: ProjectLightTheme())
            .themeData,
        routeInformationParser: navigationService.router.routeInformationParser,
        routeInformationProvider:
            navigationService.router.routeInformationProvider,
        routerDelegate: navigationService.router.routerDelegate,
      ),
    );
  }
}
