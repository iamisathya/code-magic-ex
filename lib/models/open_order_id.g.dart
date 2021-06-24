// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_order_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenPlaceOrderId _$OpenPlaceOrderIdFromJson(Map<String, dynamic> json) {
  return OpenPlaceOrderId(
    orderId: json['order_id'] as String,
    orderDscId: json['order_dscid'] as String,
    orderOpId: json['order_opid'] as String,
    orderTotalPv: json['order_total_pv'] as String,
    orderTotalPrice: json['order_total_price'] as String,
    orderDate: json['order_date'] as String,
    orderStatus: json['order_status'] as String,
    createBy: json['create_by'] as String,
    createDate: json['create_date'] as String,
    updateBy: json['update_by'] as String,
    updateDate: json['update_date'] as String,
    deleteBy: json['delete_by'] as String,
    deleteDate: json['delete_date'] as String,
    customerId: json['cus_id'] as String,
    soId: json['so_id'] as String,
    comment: json['comment'] as String,
    isPrint: json['is_print'] as String,
    printedBy: json['printed_by'] as String,
    lastUpdate: json['last_update'] as String,
  );
}

Map<String, dynamic> _$OpenPlaceOrderIdToJson(OpenPlaceOrderId instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'order_dscid': instance.orderDscId,
      'order_opid': instance.orderOpId,
      'order_total_pv': instance.orderTotalPv,
      'order_total_price': instance.orderTotalPrice,
      'order_date': instance.orderDate,
      'order_status': instance.orderStatus,
      'create_by': instance.createBy,
      'create_date': instance.createDate,
      'update_by': instance.updateBy,
      'update_date': instance.updateDate,
      'delete_by': instance.deleteBy,
      'delete_date': instance.deleteDate,
      'cus_id': instance.customerId,
      'so_id': instance.soId,
      'comment': instance.comment,
      'is_print': instance.isPrint,
      'printed_by': instance.printedBy,
      'last_update': instance.lastUpdate,
    };
