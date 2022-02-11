// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_customer_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestPostCustomerToken _$RequestPostCustomerTokenFromJson(
        Map<String, dynamic> json) =>
    RequestPostCustomerToken(
      namespace: json['namespace'] as String,
      type: json['type'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$RequestPostCustomerTokenToJson(
        RequestPostCustomerToken instance) =>
    <String, dynamic>{
      'namespace': instance.namespace,
      'type': instance.type,
      'value': instance.value,
    };
