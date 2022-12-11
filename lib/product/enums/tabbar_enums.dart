import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum TabEnums { map, list, extra, profile }

extension UpperCase on TabEnums {
  String upperCaseFirstLetter() {
    return name.toUpperCase();
  }

  IconData getIcons() {
    switch (this) {
      case TabEnums.map:
        return Icons.map_outlined;
      case TabEnums.list:
        return FontAwesomeIcons.list;
      case TabEnums.profile:
        return Icons.person;
      case TabEnums.extra:
        return Icons.directions;
    }
  }
}
