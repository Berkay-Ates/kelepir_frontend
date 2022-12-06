import 'package:json_annotation/json_annotation.dart';

part 'auth_enroll.g.dart';

@JsonSerializable()
class UserEnroll {
  String? name;
  String? email;
  String? password;

  UserEnroll({this.name, this.email, this.password});

  factory UserEnroll.fromJson(Map<String, dynamic> json) {
    return _$UserEnrollFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserEnrollToJson(this);
  }
}
