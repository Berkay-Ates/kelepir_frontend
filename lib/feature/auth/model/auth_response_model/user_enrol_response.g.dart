// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_enrol_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEnrollResult _$UserEnrollResultFromJson(Map<String, dynamic> json) =>
    UserEnrollResult(
      accessToken: json['accessToken'] as String?,
      tokenType: json['tokenType'] as String?,
    );

Map<String, dynamic> _$UserEnrollResultToJson(UserEnrollResult instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'tokenType': instance.tokenType,
    };
