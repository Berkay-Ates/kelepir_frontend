import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../../product/extensions/lottie_asset_enum.dart';

class NoConnectionView extends StatefulWidget {
  const NoConnectionView({super.key});
  @override
  State<NoConnectionView> createState() => _NoConnectionViewState();
}

class _NoConnectionViewState extends State<NoConnectionView> {
  final String networkScanText = 'yakinimda ag tara';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0.0, systemOverlayStyle: SystemUiOverlayStyle.light),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(LottieAssetEnums.noconnection.lottieFullName),
        ],
      ),
    );
  }
}
