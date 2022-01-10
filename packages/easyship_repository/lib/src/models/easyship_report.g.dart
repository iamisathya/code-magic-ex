// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'easyship_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EasyShipReports _$EasyShipReportsFromJson(Map<String, dynamic> json) {
  return EasyShipReports(
    orderNumber: json['ordernumber'] as String,
    pvDate: json['pvdate'] as String,
    name: json['name'] as String,
    itemName: json['itemname'] as String,
    price: json['price'] as String,
    pv: json['pv'] as int,
    totalPrice: json['totalprice'] as String,
  );
}

Map<String, dynamic> _$EasyShipReportsToJson(EasyShipReports instance) =>
    <String, dynamic>{
      'ordernumber': instance.orderNumber,
      'pvdate': instance.pvDate,
      'name': instance.name,
      'itemname': instance.itemName,
      'price': instance.price,
      'pv': instance.pv,
      'totalprice': instance.totalPrice,
    };
