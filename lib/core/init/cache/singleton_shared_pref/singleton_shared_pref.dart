import 'package:shared_preferences/shared_preferences.dart';

class SingletonSharedPref {
  SharedPreferences? _sharedPreferences;
  static SingletonSharedPref? _instance;
  static SingletonSharedPref? get instance {
    _instance ??= SingletonSharedPref._init();
    return _instance;
  }

  SharedPreferences? get getSharedObject => _sharedPreferences;

  Future initShared() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  SingletonSharedPref._init();
}
