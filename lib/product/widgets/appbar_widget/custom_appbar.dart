import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? appBar;
  final BuildContext context;

  const CustomAppBar({Key? key, this.appBar, required this.context}) : super(key: key);
  @override
  Size get preferredSize => Size(MediaQuery.of(context).size.width, 52);

  @override
  Widget build(BuildContext context) {
    return appBar ?? const SizedBox.shrink();
  }
}
