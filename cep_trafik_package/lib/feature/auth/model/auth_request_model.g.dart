// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRequestModel _$AuthRequestModelFromJson(Map<String, dynamic> json) =>
    AuthRequestModel(
      grantType: json['grant_type'] as String?,
      userName: json['username'] as String?,
      password: json['password'] as String?,
    )..localId = json['localId'] as int?;

Map<String, dynamic> _$AuthRequestModelToJson(AuthRequestModel instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'grant_type': instance.grantType,
      'username': instance.userName,
      'password': instance.password,
    };
