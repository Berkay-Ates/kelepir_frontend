import '../../enums/shared/shared_enums.dart';

abstract class ISharedPreferences {
  String? getString(SharedKeyEnums key);
  Future<bool> saveString(SharedKeyEnums key, String token);
  Future<bool> delete(SharedKeyEnums key);
}
