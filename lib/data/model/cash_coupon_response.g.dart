// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_coupon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashCouponResponse _$CashCouponResponseFromJson(Map<String, dynamic> json) =>
    CashCouponResponse(
      success: json['success'] as bool,
      availableCreditAmount: json['availableCreditAmount'] as int,
    );

Map<String, dynamic> _$CashCouponResponseToJson(CashCouponResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'availableCreditAmount': instance.availableCreditAmount,
    };
