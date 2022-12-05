// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:kelepir/core/init/theme/iappTheme/iapp_theme.dart';

class ProjectAppTheme<T extends IAppTheme> {
  late final ThemeData themeData;
  T appTheme;
  ProjectAppTheme({
    required this.appTheme,
  }) {
    themeData = appTheme.themeData;
  }
}
