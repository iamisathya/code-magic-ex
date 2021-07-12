// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provience_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProvinceItem _$ProvinceItemFromJson(Map<String, dynamic> json) {
  return ProvinceItem(
    proId: json['0'] as String,
    provienceId: json['PROVINCE_ID'] as String,
    proCode: json['1'] as String,
    provienceCode: json['PROVINCE_CODE'] as String,
    proName: json['2'] as String,
    provienceName: json['PROVINCE_NAME'] as String,
    proNameEn: json['3'] as String,
    provienceNameEn: json['PROVINCE_NAME_ENG'] as String,
    gId: json['4'] as String,
    geoId: json['GEO_ID'] as String,
  );
}

Map<String, dynamic> _$ProvinceItemToJson(ProvinceItem instance) =>
    <String, dynamic>{
      '0': instance.proId,
      'PROVINCE_ID': instance.provienceId,
      '1': instance.proCode,
      'PROVINCE_CODE': instance.provienceCode,
      '2': instance.proName,
      'PROVINCE_NAME': instance.provienceName,
      '3': instance.proNameEn,
      'PROVINCE_NAME_ENG': instance.provienceNameEn,
      '4': instance.gId,
      'GEO_ID': instance.geoId,
    };
