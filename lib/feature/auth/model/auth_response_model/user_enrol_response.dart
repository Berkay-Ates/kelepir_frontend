import 'package:json_annotation/json_annotation.dart';

part 'user_enrol_response.g.dart';

@JsonSerializable()
class UserEnrollResult {
  User? user;
  String? token;

  UserEnrollResult({this.user, this.token});

  factory UserEnrollResult.fromJson(Map<String, dynamic> json) {
    return _$UserEnrollResultFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserEnrollResultToJson(this);
  }
}

@JsonSerializable()
class User {
  String? sId;
  String? name;
  String? email;
  String? password;

  User({this.sId, this.name, this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}
