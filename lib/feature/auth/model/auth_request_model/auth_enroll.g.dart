// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_enroll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEnroll _$UserEnrollFromJson(Map<String, dynamic> json) => UserEnroll(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserEnrollToJson(UserEnroll instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
