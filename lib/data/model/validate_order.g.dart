// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateOrder _$ValidateOrderFromJson(Map<String, dynamic> json) =>
    ValidateOrder(
      country: json['country'] as String,
      dsc: json['dsc'] as String,
      message: json['message'] as String,
      success: json['success'] as String,
    );

Map<String, dynamic> _$ValidateOrderToJson(ValidateOrder instance) =>
    <String, dynamic>{
      'country': instance.country,
      'dsc': instance.dsc,
      'message': instance.message,
      'success': instance.success,
    };
