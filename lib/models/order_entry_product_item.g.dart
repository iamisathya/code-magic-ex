// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entry_product_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderEntryItem _$OrderEntryItemFromJson(Map<String, dynamic> json) {
  return OrderEntryItem(
    itemCode: json['itemcode'] as String,
    quantityOnHand: json['quantityonhand'] as String,
  );
}

Map<String, dynamic> _$OrderEntryItemToJson(OrderEntryItem instance) =>
    <String, dynamic>{
      'itemcode': instance.itemCode,
      'quantityonhand': instance.quantityOnHand,
    };
