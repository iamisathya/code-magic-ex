// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openpo_create_order_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenPoCreateOrderResult _$OpenPoCreateOrderResultFromJson(
        Map<String, dynamic> json) =>
    OpenPoCreateOrderResult(
      isSuccess: json['isSuccess'] as bool,
      distributorId: json['distributorId'] as String,
      poNumber: json['poNumber'] as String,
    );

Map<String, dynamic> _$OpenPoCreateOrderResultToJson(
        OpenPoCreateOrderResult instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'distributorId': instance.distributorId,
      'poNumber': instance.poNumber,
    };
