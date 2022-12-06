// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_enrol_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEnrollResult _$UserEnrollResultFromJson(Map<String, dynamic> json) => UserEnrollResult(
      user: json['user'] == null ? null : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserEnrollResultToJson(UserEnrollResult instance) => <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      sId: json['sId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'sId': instance.sId,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
