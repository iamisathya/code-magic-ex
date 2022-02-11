// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_report_item_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesReportItemItem _$SalesReportItemItemFromJson(Map<String, dynamic> json) =>
    SalesReportItemItem(
      itemCode: json['itemcode'] as String,
      description: json['description'] as String,
      pv: json['pv'] as int,
      qty: json['qty'] as int,
      totalPv: json['totalpv'] as String,
    );

Map<String, dynamic> _$SalesReportItemItemToJson(
        SalesReportItemItem instance) =>
    <String, dynamic>{
      'itemcode': instance.itemCode,
      'description': instance.description,
      'pv': instance.pv,
      'qty': instance.qty,
      'totalpv': instance.totalPv,
    };
