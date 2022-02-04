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
    code: json['code'],
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

PasswordResetResponse _$PasswordResetResponseFromJson(
    Map<String, dynamic> json) {
  return PasswordResetResponse(
    affectedRows: json['affectedRows'] as int,
  );
}

Map<String, dynamic> _$PasswordResetResponseToJson(
        PasswordResetResponse instance) =>
    <String, dynamic>{
      'affectedRows': instance.affectedRows,
    };

NameValueType _$NameValueTypeFromJson(Map<String, dynamic> json) {
  return NameValueType(
    name: json['name'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$NameValueTypeToJson(NameValueType instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

OrderCompleteArguments _$OrderCompleteArgumentsFromJson(
    Map<String, dynamic> json) {
  return OrderCompleteArguments(
    orderId: json['orderId'] as String,
    userId: json['userId'] as String,
    orderStatus: json['orderStatus'] as bool,
  );
}

Map<String, dynamic> _$OrderCompleteArgumentsToJson(
        OrderCompleteArguments instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'userId': instance.userId,
      'orderStatus': instance.orderStatus,
    };

PasswordUpdateModel _$PasswordUpdateModelFromJson(Map<String, dynamic> json) {
  return PasswordUpdateModel(
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$PasswordUpdateModelToJson(
        PasswordUpdateModel instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

EmailUpdateResponse _$EmailUpdateResponseFromJson(Map<String, dynamic> json) {
  return EmailUpdateResponse(
    id: json['id'] == null
        ? null
        : CommonIdTypeInt.fromJson(json['id'] as Map<String, dynamic>),
    email: json['email'] as String?,
    href: json['href'] as String?,
  );
}

Map<String, dynamic> _$EmailUpdateResponseToJson(
        EmailUpdateResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'href': instance.href,
    };
