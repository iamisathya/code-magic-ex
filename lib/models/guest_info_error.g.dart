// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_info_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuestInfoError _$GuestInfoErrorFromJson(Map<String, dynamic> json) {
  return GuestInfoError(
    error: ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GuestInfoErrorToJson(GuestInfoError instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

ErrorObject _$ErrorObjectFromJson(Map<String, dynamic> json) {
  return ErrorObject(
    code: json['code'] as String,
    message: json['message'] as String,
    errorCode: json['error_code'] as String,
    errorMessage: json['error_message'] as String,
  );
}

Map<String, dynamic> _$ErrorObjectToJson(ErrorObject instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'error_code': instance.errorCode,
      'error_message': instance.errorMessage,
    };
