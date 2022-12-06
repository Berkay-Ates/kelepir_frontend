import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kelepir/core/init/theme/customTheme/icustom_theme.dart';

import '../iappTheme/iapp_theme.dart';

class ProjectDarkTheme extends ICustomTheme with IAppTheme {
  @override
  ThemeData get themeData => ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          centerTitle: true,
        ),
      );
}
