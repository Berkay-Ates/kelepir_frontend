import 'package:flutter/material.dart';

enum Tabs { map, list, profile, extra }

extension UpperCase on Tabs {
  String upperCaseFirstLetter() {
    return name.toUpperCase();
  }

  IconData getIcons() {
    switch (this) {
      case Tabs.map:
        return Icons.location_on_outlined;
      case Tabs.list:
        return Icons.shopify_outlined;
      case Tabs.profile:
        return Icons.person_outline_outlined;
      case Tabs.extra:
        return Icons.extension_rounded;
    }
  }
}
