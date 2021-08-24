// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enroll_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrollResponse _$EnrollResponseFromJson(Map<String, dynamic> json) {
  return EnrollResponse(
    success: json['Success'] as String,
    message:
        (json['Message'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$EnrollResponseToJson(EnrollResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'Message': instance.message,
    };
