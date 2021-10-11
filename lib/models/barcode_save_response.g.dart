// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_save_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarCodeSaveResponse _$BarCodeSaveResponseFromJson(Map<String, dynamic> json) {
  return BarCodeSaveResponse(
    success: json['success'] as bool,
    errorMessages: (json['errorMessages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    infoMessages: (json['infoMessages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    orderItems: (json['orderItems'] as List<dynamic>)
        .map((e) => OrderItems.fromJson(e as Map<String, dynamic>))
        .toList(),
    validateResult: json['validateResult'] == null
        ? null
        : ValidateResult.fromJson(
            json['validateResult'] as Map<String, dynamic>),
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$BarCodeSaveResponseToJson(
        BarCodeSaveResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'errorMessages': instance.errorMessages,
      'infoMessages': instance.infoMessages,
      'validateResult': instance.validateResult,
      'orderItems': instance.orderItems,
      'message': instance.message,
    };

ValidateResult _$ValidateResultFromJson(Map<String, dynamic> json) {
  return ValidateResult(
    success: json['success'] as String,
    infoMessages: (json['infoMessages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errorMessages: (json['errorMessages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errorBarcodes: json['errorBarcodes'] as List<dynamic>?,
    validBarcodes: (json['validBarcodes'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$ValidateResultToJson(ValidateResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'infoMessages': instance.infoMessages,
      'errorMessages': instance.errorMessages,
      'errorBarcodes': instance.errorBarcodes,
      'validBarcodes': instance.validBarcodes,
    };

OrderItems _$OrderItemsFromJson(Map<String, dynamic> json) {
  return OrderItems(
    id: json['id'] as int,
    orderId: json['order_id'] as String,
    itemCode: json['item_code'] as String,
    itemCodeParent: json['item_code_parent'] as String,
    itemName: json['item_name'] as String,
    qty: json['qty'] as int,
    requireScan: json['require_scan'] as int,
    countBarcode: json['count_barcode'] as int,
    complete: json['complete'] as int,
    stampCreated: json['stamp_created'] as String,
    stampUpdated: json['stamp_updated'] as String,
    note: json['note'] as String?,
  );
}

Map<String, dynamic> _$OrderItemsToJson(OrderItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'item_code': instance.itemCode,
      'item_code_parent': instance.itemCodeParent,
      'item_name': instance.itemName,
      'qty': instance.qty,
      'require_scan': instance.requireScan,
      'count_barcode': instance.countBarcode,
      'complete': instance.complete,
      'stamp_created': instance.stampCreated,
      'stamp_updated': instance.stampUpdated,
      'note': instance.note,
    };
