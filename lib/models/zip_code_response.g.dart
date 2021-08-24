// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zip_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ZipCodeResponse _$ZipCodeResponseFromJson(Map<String, dynamic> json) {
  return ZipCodeResponse(
    districtCode: json['district_code'] as String,
    id: json['id'] as String,
    zipCode: json['zipcode'] as String,
  );
}

Map<String, dynamic> _$ZipCodeResponseToJson(ZipCodeResponse instance) =>
    <String, dynamic>{
      'district_code': instance.districtCode,
      'id': instance.id,
      'zipcode': instance.zipCode,
    };
