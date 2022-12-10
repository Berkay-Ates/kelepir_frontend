class TokenManagement {
  static TokenManagement? _tokenManagement;
  static TokenManagement get instance {
    _tokenManagement ??= TokenManagement._();
    return _tokenManagement!;
  }

  String token = '';
  String imageId = '';
  String imagePhonePath = '';

  void setToken(String token) => this.token = token;
  void setImageToken(String image) => imageId = image;
  void setImagePath(String imagePath) => imagePhonePath = imagePath;

  String get getToken => token;
  String get getImagePath => imagePhonePath;
  String get getImageToken => imageId;

  TokenManagement._();
}
