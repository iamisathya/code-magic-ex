// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_error_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorMessage _$ErrorMessageFromJson(Map<String, dynamic> json) {
  return ErrorMessage(
    error: ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ErrorMessageToJson(ErrorMessage instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

ErrorObject _$ErrorObjectFromJson(Map<String, dynamic> json) {
  return ErrorObject(
    errorMessage: json['error_message'] as String?,
    error: json['error'] as String?,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$ErrorObjectToJson(ErrorObject instance) =>
    <String, dynamic>{
      'error_message': instance.errorMessage,
      'error': instance.error,
      'message': instance.message,
    };
