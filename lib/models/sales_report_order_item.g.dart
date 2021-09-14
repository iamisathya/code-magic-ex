// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_report_order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesReportOrderItem _$SalesReportOrderItemFromJson(Map<String, dynamic> json) {
  return SalesReportOrderItem(
    inputData: json['inputdata'] as String,
    customer: json['customer'] as String,
    name: json['name'] as String,
    orderNumber: json['ordernumber'] as String,
    date: json['date'] as String,
    time: json['time'] as String,
    total: json['total'] as String,
    totalPv: json['totalpv'] as int,
    barcode: json['barcode'] as String,
  );
}

Map<String, dynamic> _$SalesReportOrderItemToJson(
        SalesReportOrderItem instance) =>
    <String, dynamic>{
      'inputdata': instance.inputData,
      'customer': instance.customer,
      'name': instance.name,
      'ordernumber': instance.orderNumber,
      'date': instance.date,
      'time': instance.time,
      'total': instance.total,
      'totalpv': instance.totalPv,
      'barcode': instance.barcode,
    };
