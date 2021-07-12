// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisctrictItem _$DisctrictItemFromJson(Map<String, dynamic> json) {
  return DisctrictItem(
    amphurId: json['AMPHUR_ID'] as String,
    districtCode: json['DISTRICT_CODE'] as String,
    districtId: json['DISTRICT_ID'] as String,
    districtName: json['DISTRICT_NAME'] as String,
    districtNameEn: json['DISTRICT_NAME_ENG'] as String,
    geoId: json['GEO_ID'] as String,
    provinceId: json['PROVINCE_ID'] as String,
  );
}

Map<String, dynamic> _$DisctrictItemToJson(DisctrictItem instance) =>
    <String, dynamic>{
      'AMPHUR_ID': instance.amphurId,
      'DISTRICT_CODE': instance.districtCode,
      'DISTRICT_ID': instance.districtId,
      'DISTRICT_NAME': instance.districtName,
      'DISTRICT_NAME_ENG': instance.districtNameEn,
      'GEO_ID': instance.geoId,
      'PROVINCE_ID': instance.provinceId,
    };
