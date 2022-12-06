import 'package:flutter/material.dart';

class DarkThemeArguments {
  //* this has to be singleton because only one argument class needed to get arguments

  //* eager singleton
  //? static DarkThemeArguments? get instance => DarkThemeArguments._();

  //* lazy singleton
  static DarkThemeArguments? _instance;
  static DarkThemeArguments? get instance {
    _instance ??= _instance = DarkThemeArguments._();
    return _instance;
  }

  DarkThemeArguments._();

  Color blackColor = Colors.black;
  Color amberColor = Colors.amber;
}


//* there are two type of singleton structure bearer and lazy we will prefer lazy one or bearer
