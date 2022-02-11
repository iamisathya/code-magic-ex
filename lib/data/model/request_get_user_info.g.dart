// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_get_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchuserInfo _$SearchuserInfoFromJson(Map<String, dynamic> json) =>
    SearchuserInfo(
      namespace: json['namespace'] as String,
      type: json['type'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$SearchuserInfoToJson(SearchuserInfo instance) =>
    <String, dynamic>{
      'namespace': instance.namespace,
      'type': instance.type,
      'value': instance.value,
    };
