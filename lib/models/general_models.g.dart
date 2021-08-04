// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPeriodLogResponse _$GetPeriodLogResponseFromJson(Map<String, dynamic> json) {
  return GetPeriodLogResponse(
    status: json['status'] as String,
    idLog: json['idLog'] as int,
  );
}

Map<String, dynamic> _$GetPeriodLogResponseToJson(
        GetPeriodLogResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'idLog': instance.idLog,
    };
