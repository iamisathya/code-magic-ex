// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amphur_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmphurItem _$AmphurItemFromJson(Map<String, dynamic> json) {
  return AmphurItem(
    amphurCode: json['AMPHUR_CODE'] as String,
    amphurId: json['AMPHUR_ID'] as String,
    amphurName: json['AMPHUR_NAME'] as String,
    amphurNameEn: json['AMPHUR_NAME_ENG'] as String,
    gioId: json['GEO_ID'] as String,
    provinceId: json['PROVINCE_ID'] as String,
  );
}

Map<String, dynamic> _$AmphurItemToJson(AmphurItem instance) =>
    <String, dynamic>{
      'AMPHUR_CODE': instance.amphurCode,
      'AMPHUR_ID': instance.amphurId,
      'AMPHUR_NAME': instance.amphurName,
      'AMPHUR_NAME_ENG': instance.amphurNameEn,
      'GEO_ID': instance.gioId,
      'PROVINCE_ID': instance.provinceId,
    };
