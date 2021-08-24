// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_po.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenPO _$OpenPOFromJson(Map<String, dynamic> json) {
  return OpenPO(
    orderDscid: json['order_dscid'] as String,
    orderOpid: json['order_opid'] as String,
    orderTotalPv: json['order_total_pv'] as String,
    orderTotalPrice: json['order_total_price'] as String,
    orderDate: json['order_date'] as String,
    orderTime: json['order_time'] as String,
    orderStatus: json['order_status'] as String,
    iconAttachment: json['order_attachment'] as String,
  );
}

Map<String, dynamic> _$OpenPOToJson(OpenPO instance) => <String, dynamic>{
      'order_attachment': instance.iconAttachment,
      'order_date': instance.orderDate,
      'order_dscid': instance.orderDscid,
      'order_opid': instance.orderOpid,
      'order_status': instance.orderStatus,
      'order_time': instance.orderTime,
      'order_total_price': instance.orderTotalPrice,
      'order_total_pv': instance.orderTotalPv,
    };
