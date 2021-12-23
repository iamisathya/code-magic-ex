// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_record_matched.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryRecordsMatchedItems _$InventoryRecordsMatchedItemsFromJson(
    Map<String, dynamic> json) {
  return InventoryRecordsMatchedItems(
    itemCode: json['pro_code'] as String,
    itemId: json['pro_id'] as String,
    itemName: json['pro_name'] as String,
    itemNameEn: json['pro_name_en'] as String,
    itemNote: json['pro_note'] as String,
    itemPrice: json['pro_price'] as String,
    itemPv: json['pro_pv'] as String,
  );
}

Map<String, dynamic> _$InventoryRecordsMatchedItemsToJson(
        InventoryRecordsMatchedItems instance) =>
    <String, dynamic>{
      'pro_code': instance.itemCode,
      'pro_id': instance.itemId,
      'pro_name': instance.itemName,
      'pro_name_en': instance.itemNameEn,
      'pro_note': instance.itemNote,
      'pro_price': instance.itemPrice,
      'pro_pv': instance.itemPv,
    };
