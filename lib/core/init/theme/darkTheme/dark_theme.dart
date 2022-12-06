import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './idark_theme.dart';
import '../iappTheme/iapp_theme.dart';

class ProjectDarkTheme extends IDarkTheme with IAppTheme {
  @override
  ThemeData get themeData => ThemeData.dark()
      .copyWith(appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light, centerTitle: true));
}
