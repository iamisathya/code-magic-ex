// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'easyship_report_with_total.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EasyShipReportsWithTotal _$EasyShipReportsWithTotalFromJson(
    Map<String, dynamic> json) {
  return EasyShipReportsWithTotal(
    month: json['month'] as String?,
    totalPrice: (json['totalPrice'] as num?)?.toDouble(),
    totalPv: json['totalPv'] as int?,
    reports: (json['reports'] as List<dynamic>?)
        ?.map((e) => EasyShipReports.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$EasyShipReportsWithTotalToJson(
        EasyShipReportsWithTotal instance) =>
    <String, dynamic>{
      'month': instance.month,
      'totalPrice': instance.totalPrice,
      'totalPv': instance.totalPv,
      'reports': instance.reports,
    };
