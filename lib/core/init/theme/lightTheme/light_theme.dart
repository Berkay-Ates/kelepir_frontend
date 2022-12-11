import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kelepir/core/init/theme/lightTheme/ilight_theme.dart';

import '../iappTheme/iapp_theme.dart';

class ProjectLightTheme extends ILightTheme with IAppTheme {
  @override
  ThemeData get themeData => ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
            foregroundColor: lightThemeArguments!.blackColor,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            centerTitle: true),
      );
}
