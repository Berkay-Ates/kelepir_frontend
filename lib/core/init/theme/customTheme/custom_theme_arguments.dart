import 'package:flutter/material.dart';

class CustomThemeArguments {
  //* eager singleton
  //? static CustomThemeArguments? get instance => CustomThemeArguments._();

  //* lazy singleton
  static CustomThemeArguments? _instance;
  static CustomThemeArguments? get instance {
    _instance ??= _instance = CustomThemeArguments._();
    return _instance;
  }

  CustomThemeArguments._();

  Color blackColor = Colors.black;
  Color amberColor = Colors.amber;
}
