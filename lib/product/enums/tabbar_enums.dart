import 'package:flutter/material.dart';

enum TabEnums { map, list, extra, profile }

extension UpperCase on TabEnums {
  String upperCaseFirstLetter() {
    return name.toUpperCase();
  }

  IconData getIcons() {
    switch (this) {
      case TabEnums.map:
        return Icons.pin_drop_outlined;
      case TabEnums.list:
        return Icons.shopify_outlined;
      case TabEnums.profile:
        return Icons.person_outline_outlined;
      case TabEnums.extra:
        return Icons.extension_rounded;
    }
  }
}
