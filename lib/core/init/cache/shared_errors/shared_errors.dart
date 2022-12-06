class SharedPrefErrors implements Exception {
  @override
  String toString() {
    return 'singleton Shared pref object has not been initialized';
  }
}
