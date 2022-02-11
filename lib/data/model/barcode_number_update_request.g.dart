// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_number_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarcodeNumberUpdateRequest _$BarcodeNumberUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    BarcodeNumberUpdateRequest(
      order: (json['order'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      scan: (json['scan'] as List<dynamic>)
          .map((e) => BarcodeNumbers.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderNumber: json['orderNumber'] as String,
    );

Map<String, dynamic> _$BarcodeNumberUpdateRequestToJson(
        BarcodeNumberUpdateRequest instance) =>
    <String, dynamic>{
      'order': instance.order,
      'scan': instance.scan,
      'orderNumber': instance.orderNumber,
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      item: json['item'] as String,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'item': instance.item,
      'quantity': instance.quantity,
    };

BarcodeNumbers _$BarcodeNumbersFromJson(Map<String, dynamic> json) =>
    BarcodeNumbers(
      item: json['item'] as String,
    );

Map<String, dynamic> _$BarcodeNumbersToJson(BarcodeNumbers instance) =>
    <String, dynamic>{
      'item': instance.item,
    };
