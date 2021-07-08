// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserId _$UserIdFromJson(Map<String, dynamic> json) {
  return UserId(
    customerId: json['cus_id'] as String,
    customerCode: json['cus_code'] as String,
  );
}

Map<String, dynamic> _$UserIdToJson(UserId instance) => <String, dynamic>{
      'cus_id': instance.customerId,
      'cus_code': instance.customerCode,
    };
