import 'package:flutter/material.dart';
import 'package:kelepir/core/init/theme/apptheme/app_theme.dart';

import 'core/init/theme/lightTheme/light_theme.dart';
import 'feature/home/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ProjectAppTheme<ProjectLightTheme>(appTheme: ProjectLightTheme()).themeData,
      home: const HomeView(),
    );
  }
}
