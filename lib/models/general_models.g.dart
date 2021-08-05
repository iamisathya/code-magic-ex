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

ClearOrderCacheResponse _$ClearOrderCacheResponseFromJson(
    Map<String, dynamic> json) {
  return ClearOrderCacheResponse(
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ClearOrderCacheResponseToJson(
        ClearOrderCacheResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

VerifyOrderResponse _$VerifyOrderResponseFromJson(Map<String, dynamic> json) {
  return VerifyOrderResponse(
    code: json['code'] as int,
    require:
        (json['require'] as List<dynamic>).map((e) => e as String).toList(),
    unRequire: json['un_require'] as bool,
    updated: json['updated'] as bool,
    user: json['user'],
  );
}

Map<String, dynamic> _$VerifyOrderResponseToJson(
        VerifyOrderResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'require': instance.require,
      'un_require': instance.unRequire,
      'updated': instance.updated,
      'user': instance.user,
    };

SendOrderOnlineResponse _$SendOrderOnlineResponseFromJson(
    Map<String, dynamic> json) {
  return SendOrderOnlineResponse(
    status: json['status'] as bool,
  );
}

Map<String, dynamic> _$SendOrderOnlineResponseToJson(
        SendOrderOnlineResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
