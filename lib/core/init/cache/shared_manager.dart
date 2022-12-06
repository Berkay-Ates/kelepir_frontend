import 'package:kelepir/core/init/cache/shared_errors/shared_errors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../enums/shared/shared_enums.dart';
import 'ishared_manager.dart';

class SharedPreferencesManager extends ISharedPreferences {
  final SharedPreferences? sharedPreferences;

  SharedPreferencesManager(this.sharedPreferences);
  //* buraya initialize olmus bir shared preferences alalım
  //* shared preferences icin de singleton bir obje olusturalım proje genelinde o shared preferences objesi kullanılsın

  void checkPreferences() {
    if (sharedPreferences == null) {
      throw SharedPrefErrors();
    }
  }

  @override
  String? getString(SharedKeyEnums key) {
    checkPreferences();
    return sharedPreferences?.getString(key.name);
  }

  @override
  Future<bool> saveString(SharedKeyEnums key, String token) async {
    checkPreferences();
    bool isCached = await sharedPreferences?.setString(key.name, token) ?? false;
    return isCached;
  }

  @override
  Future<bool> delete(SharedKeyEnums key) async {
    checkPreferences();
    bool isDeleted = await sharedPreferences?.remove(key.name) ?? false;
    return isDeleted;
  }
}
