import 'package:flutter/material.dart';

class LightThemeArguments {
  //* this has to be singleton because only one argument class needed to get arguments

  //* eager singleton
  //? static LightThemeArguments? get instance => LightThemeArguments._();

  //* lazy singleton
  static LightThemeArguments? _instance;
  static LightThemeArguments? get instance {
    _instance ??= _instance = LightThemeArguments._();
    return _instance;
  }

  LightThemeArguments._();

  Color blackColor = Colors.black;
  Color amberColor = Colors.amber;
}


//* there are two type of singleton structure bearer and lazy we will prefer lazy one or bearer
