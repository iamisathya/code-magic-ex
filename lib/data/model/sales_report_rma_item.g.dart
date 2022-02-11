// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_report_rma_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesReportRmaItem _$SalesReportRmaItemFromJson(Map<String, dynamic> json) =>
    SalesReportRmaItem(
      inputData: json['inputdata'] as String,
      customer: json['customer'] as String,
      name: json['name'] as String,
      orderNumber: json['ordernumber'] as String,
      rmaOrderNumber: json['rmaordernumber'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      total: json['total'] as String,
      totalPv: json['totalpv'] as String,
    );

Map<String, dynamic> _$SalesReportRmaItemToJson(SalesReportRmaItem instance) =>
    <String, dynamic>{
      'inputdata': instance.inputData,
      'customer': instance.customer,
      'name': instance.name,
      'ordernumber': instance.orderNumber,
      'rmaordernumber': instance.rmaOrderNumber,
      'date': instance.date,
      'time': instance.time,
      'total': instance.total,
      'totalpv': instance.totalPv,
    };
