// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Register _$RegisterFromJson(Map<String, dynamic> json) => Register(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      surname: json['surname'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
    };
