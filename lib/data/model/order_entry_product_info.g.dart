// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entry_product_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderEntryProductInfo _$OrderEntryProductInfoFromJson(
        Map<String, dynamic> json) =>
    OrderEntryProductInfo(
      id: json['id'] as String? ?? "",
      productId: json['productId'] as String? ?? "",
      productName: json['productName'] as String? ?? "",
      productPrice: json['productPrice'] as String? ?? "",
      productCost: json['productCost'] as String? ?? "",
      productVcost: json['productVcost'] as String? ?? "",
    );

Map<String, dynamic> _$OrderEntryProductInfoToJson(
        OrderEntryProductInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'productCost': instance.productCost,
      'productVcost': instance.productVcost,
    };
