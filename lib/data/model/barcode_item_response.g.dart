// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarCodeItemsResponse _$BarCodeItemsResponseFromJson(
        Map<String, dynamic> json) =>
    BarCodeItemsResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => BarcodeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] as String?,
    );

Map<String, dynamic> _$BarCodeItemsResponseToJson(
        BarCodeItemsResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
      'user': instance.user,
    };

BarcodeItem _$BarcodeItemFromJson(Map<String, dynamic> json) => BarcodeItem(
      code: json['code'] as String,
      desc: json['desc'] as String,
      qty: json['qty'] as int,
      remain: json['remain'] as int,
      require: json['require'] as bool,
      scan: json['scan'] as int,
      isExpanded: json['isExpanded'] as bool,
      barcodes:
          (json['barcodes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BarcodeItemToJson(BarcodeItem instance) =>
    <String, dynamic>{
      'code': instance.code,
      'desc': instance.desc,
      'qty': instance.qty,
      'remain': instance.remain,
      'require': instance.require,
      'scan': instance.scan,
      'isExpanded': instance.isExpanded,
      'barcodes': instance.barcodes,
    };
