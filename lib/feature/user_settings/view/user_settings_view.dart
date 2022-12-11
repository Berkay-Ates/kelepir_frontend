import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../home/view_model/home_model_view.dart';

class UserSettings extends StatelessWidget {
  final HomeModelView modelView;
  const UserSettings({required this.modelView});
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: modelView.deleteToken,
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.black),
              )),
        ],
      );
    });
  }
}
