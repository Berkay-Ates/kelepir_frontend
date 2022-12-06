//? OPTION 1
enum LottieAssetEnumsOptional {
  assets('assets'),
  lottieFolderName('/lottie_files'),
  lottieNoConnection('/lottie_connection.json');

  final String routeName;
  const LottieAssetEnumsOptional(this.routeName);
}

enum LottieAssetEnums { noconnection, changetheme }

extension LottieAssetEnums2Extension on LottieAssetEnums {
  String get lottieFullName => 'assets/lottie_files/lottie_$name.json';
}
