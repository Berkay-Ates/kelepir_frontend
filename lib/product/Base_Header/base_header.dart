import 'package:flutter/material.dart';
import 'package:kelepir/feature/home/view/home_view.dart';

import '../constants/paddings/project_paddings.dart';

class BaseSheetHeader extends StatelessWidget {
  const BaseSheetHeader({
    Key? key,
  })  : _gripHeight = 30,
        super(key: key);

  final double _gripHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Divider(
            color: Colors.black,
            thickness: 3,
            indent: context.getWidth() * 0.4,
            endIndent: context.getWidth() * 0.4,
          ),
          Positioned(
              right: context.getWidth() * 0.02,
              top: 0,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(ProjectPaddings.small),
                  child: Icon(Icons.close),
                ),
              ))
        ],
      ),
    );
  }
}
