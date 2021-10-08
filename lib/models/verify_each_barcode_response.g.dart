// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_each_barcode_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEachBarcodeResponse _$VerifyEachBarcodeResponseFromJson(
    Map<String, dynamic> json) {
  return VerifyEachBarcodeResponse(
    pass: json['pass'] as String,
    error: (json['error'] as List<dynamic>?)
        ?.map((e) => ErrorMessage.fromJson(e as Map<String, dynamic>))
        .toList(),
    scan: (json['scan'] as List<dynamic>)
        .map((e) => Scan.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$VerifyEachBarcodeResponseToJson(
        VerifyEachBarcodeResponse instance) =>
    <String, dynamic>{
      'pass': instance.pass,
      'error': instance.error,
      'scan': instance.scan,
    };

Scan _$ScanFromJson(Map<String, dynamic> json) {
  return Scan(
    item: json['item'] as String,
    pass: json['pass'] as bool,
  );
}

Map<String, dynamic> _$ScanToJson(Scan instance) => <String, dynamic>{
      'item': instance.item,
      'pass': instance.pass,
    };

ErrorMessage _$ErrorMessageFromJson(Map<String, dynamic> json) {
  return ErrorMessage(
    msg: json['msg'] as String,
  );
}

Map<String, dynamic> _$ErrorMessageToJson(ErrorMessage instance) =>
    <String, dynamic>{
      'msg': instance.msg,
    };
