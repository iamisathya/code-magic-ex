// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_po_create_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenPOCreateOrderResponse _$OpenPOCreateOrderResponseFromJson(
        Map<String, dynamic> json) =>
    OpenPOCreateOrderResponse(
      success: json['success'] as bool,
      poId: json['poid'] as String,
      customerCode: json['cus_code'] as String,
      customerId: json['cus_id'] as String,
      totalPv: json['totalpv'] as String,
      totalPrice: json['totalprice'] as String,
      customerName: json['cusname'] as String,
      comment: json['comment'] as String,
      poImg1: json['poimg1'] as String,
      poImg2: json['poimg2'] as String,
    );

Map<String, dynamic> _$OpenPOCreateOrderResponseToJson(
        OpenPOCreateOrderResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'poid': instance.poId,
      'cus_code': instance.customerCode,
      'cus_id': instance.customerId,
      'totalpv': instance.totalPv,
      'totalprice': instance.totalPrice,
      'cusname': instance.customerName,
      'comment': instance.comment,
      'poimg1': instance.poImg1,
      'poimg2': instance.poImg2,
    };
