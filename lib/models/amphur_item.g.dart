// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amphur_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisctrictItem _$DisctrictItemFromJson(Map<String, dynamic> json) {
  return DisctrictItem(
    amphurCode: json['AMPHUR_CODE'] as String,
    amphurId: json['AMPHUR_ID'] as String,
    amphurName: json['AMPHUR_NAME'] as String,
    amphurNameEn: json['AMPHUR_NAME_ENG'] as String,
    gioId: json['GEO_ID'] as String,
    provinceId: json['PROVINCE_ID'] as String,
  );
}

Map<String, dynamic> _$DisctrictItemToJson(DisctrictItem instance) =>
    <String, dynamic>{
      'AMPHUR_CODE': instance.amphurCode,
      'AMPHUR_ID': instance.amphurId,
      'AMPHUR_NAME': instance.amphurName,
      'AMPHUR_NAME_ENG': instance.amphurNameEn,
      'GEO_ID': instance.gioId,
      'PROVINCE_ID': instance.provinceId,
    };
