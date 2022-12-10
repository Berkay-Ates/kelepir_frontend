import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login {
  String? username;
  String? password;

  Login({this.username, this.password});

  factory Login.fromJson(Map<String, dynamic> json) {
    return _$LoginFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginToJson(this);
  }
}
