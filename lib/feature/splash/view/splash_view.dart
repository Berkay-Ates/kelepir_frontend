import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kelepir/core/base_view/base_view_model.dart';
import 'package:kelepir/feature/auth/view/authentication_view.dart';
import 'package:kelepir/feature/home/view/home_view.dart';
import 'package:kelepir/feature/splash/view_model/splash_view_model.dart';
import 'package:kelepir/product/extensions/lottie_asset_enum.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashModelView>(
      viewModel: SplashModelView(),
      onModelReady: ((modelView) {
        modelView.init();
      }),
      onPageBuilder: (context, modelView) => Observer(builder: (_) {
        return AnimatedSplashScreen(
          disableNavigation: true,
          //backgroundColor: const Color.fromARGB(31, 32, 30, 30),
          splashIconSize: MediaQuery.of(context).size.width * 0.5,
          nextScreen: modelView.isTokenExists ? const HomeView() : const AuthenticationView(),
          splash: LottieAssetEnums.splash.splashFullName,
        );
      }),
    );
  }
}
