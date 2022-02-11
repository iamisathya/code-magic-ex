// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarcodeNumberResponse _$BarcodeNumberResponseFromJson(
        Map<String, dynamic> json) =>
    BarcodeNumberResponse(
      items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BarcodeNumberResponseToJson(
        BarcodeNumberResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
