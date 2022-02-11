// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_place_open_po_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestPlaceOpenPoOrder _$RequestPlaceOpenPoOrderFromJson(
        Map<String, dynamic> json) =>
    RequestPlaceOpenPoOrder(
      comment: json['comment'] as String,
      customerId: json['cus_id'] as String,
      customeDscId: json['cus_dscid'] as String,
      poId: json['poid'] as String,
      totalPv: json['totalpv'] as String,
      totalPrice: json['totalprice'] as String,
      customerName: json['cusname'] as String,
      item: json['item'] as String,
      base64Image: json['po_img'] as String,
    );

Map<String, dynamic> _$RequestPlaceOpenPoOrderToJson(
        RequestPlaceOpenPoOrder instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'cus_id': instance.customerId,
      'cus_dscid': instance.customeDscId,
      'poid': instance.poId,
      'totalpv': instance.totalPv,
      'totalprice': instance.totalPrice,
      'cusname': instance.customerName,
      'item': instance.item,
      'po_img': instance.base64Image,
    };
