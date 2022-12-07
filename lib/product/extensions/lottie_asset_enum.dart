//? OPTION 1
enum LottieAssetEnumsOptional {
  assets('assets'),
  lottieFolderName('/lottie_files'),
  lottieNoConnection('/lottie_connection.json'),
  lottieSplashImage('/');

  final String routeName;
  const LottieAssetEnumsOptional(this.routeName);
}

enum LottieAssetEnums { noconnection, changetheme, splash }

extension LottieAssetEnums2Extension on LottieAssetEnums {
  String get lottieFullName => 'assets/lottie_files/lottie_$name.json';
  String get splashFullName => 'assets/icons/ic_$name.png';
}
