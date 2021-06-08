// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_methods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonGenericHref _$CommonGenericHrefFromJson(Map<String, dynamic> json) {
  return CommonGenericHref(
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$CommonGenericHrefToJson(CommonGenericHref instance) =>
    <String, dynamic>{
      'href': instance.href,
    };

CommonHumanNameFull _$CommonHumanNameFullFromJson(Map<String, dynamic> json) {
  return CommonHumanNameFull(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    fullName: json['fullName'] as String,
    fullNameTh: json['fullName@th'] as String,
  );
}

Map<String, dynamic> _$CommonHumanNameFullToJson(
        CommonHumanNameFull instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'fullName@th': instance.fullNameTh,
    };

CommonUserIdString _$CommonUserIdStringFromJson(Map<String, dynamic> json) {
  return CommonUserIdString(
    id: CommonIdTypeString.fromJson(json['id'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CommonUserIdStringToJson(CommonUserIdString instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

CommonIdTypeString _$CommonIdTypeStringFromJson(Map<String, dynamic> json) {
  return CommonIdTypeString(
    unicity: json['unicity'] as String,
  );
}

Map<String, dynamic> _$CommonIdTypeStringToJson(CommonIdTypeString instance) =>
    <String, dynamic>{
      'unicity': instance.unicity,
    };

CommonHumanFullName _$CommonHumanFullNameFromJson(Map<String, dynamic> json) {
  return CommonHumanFullName(
    fullName:
        CommonFullNameOnly.fromJson(json['fullName'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CommonHumanFullNameToJson(
        CommonHumanFullName instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
    };

CommonFullNameOnly _$CommonFullNameOnlyFromJson(Map<String, dynamic> json) {
  return CommonFullNameOnly(
    fullName: json['fullName'] as String,
  );
}

Map<String, dynamic> _$CommonFullNameOnlyToJson(CommonFullNameOnly instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
    };

CommonIdAndIota _$CommonIdAndIotaFromJson(Map<String, dynamic> json) {
  return CommonIdAndIota(
    unicity: json['unicity'] as String,
    iota: json['iota'] as String,
  );
}

Map<String, dynamic> _$CommonIdAndIotaToJson(CommonIdAndIota instance) =>
    <String, dynamic>{
      'unicity': instance.unicity,
      'iota': instance.iota,
    };

CompleteHumanThName _$CompleteHumanThNameFromJson(Map<String, dynamic> json) {
  return CompleteHumanThName(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    fullName: json['fullName'] as String,
    firstNameTh: json['firstName@th'] as String,
    lastNameTh: json['lastName@th'] as String,
    fullNameTh: json['fullName@th'] as String,
  );
}

Map<String, dynamic> _$CompleteHumanThNameToJson(
        CompleteHumanThName instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'firstName@th': instance.firstNameTh,
      'lastName@th': instance.lastNameTh,
      'fullName@th': instance.fullNameTh,
    };

CommonShipToNameFull _$CommonShipToNameFullFromJson(Map<String, dynamic> json) {
  return CommonShipToNameFull(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    fullName: json['fullName'] as String,
  );
}

Map<String, dynamic> _$CommonShipToNameFullToJson(
        CommonShipToNameFull instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
    };
