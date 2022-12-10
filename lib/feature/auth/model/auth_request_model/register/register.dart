import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';

@JsonSerializable()
class Register {
  String? name;
  String? surname;
  String? username;
  String? email;
  String? password;

  Register({this.name, this.email, this.password, this.surname, this.username});

  factory Register.fromJson(Map<String, dynamic> json) {
    return _$RegisterFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterToJson(this);
  }
}
