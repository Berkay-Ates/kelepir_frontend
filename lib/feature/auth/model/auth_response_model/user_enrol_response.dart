import 'package:json_annotation/json_annotation.dart';

part 'user_enrol_response.g.dart';

@JsonSerializable()
class UserEnrollResult {
  String? accessToken;
  String? tokenType;

  UserEnrollResult({this.accessToken, this.tokenType});

  factory UserEnrollResult.fromJson(Map<String, dynamic> json) {
    return _$UserEnrollResultFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserEnrollResultToJson(this);
  }
}
