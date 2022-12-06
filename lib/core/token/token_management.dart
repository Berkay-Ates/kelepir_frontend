class TokenManagement {
  static TokenManagement? _tokenManagement;
  static TokenManagement get instance {
    _tokenManagement ??= TokenManagement._();
    return _tokenManagement!;
  }

  String token = '';

  void setToken(String token) => this.token = token;
  String get getToken => token;

  TokenManagement._();
}
