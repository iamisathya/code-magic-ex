// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_reponse_by_href.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchedUserInfo _$SearchedUserInfoFromJson(Map<String, dynamic> json) =>
    SearchedUserInfo(
      id: Id.fromJson(json['id'] as Map<String, dynamic>),
      humanName: HumanName.fromJson(json['humanName'] as Map<String, dynamic>),
      entryPeriod: json['entryPeriod'] as String,
      email: json['email'] as String,
      status: json['status'] as String,
      type: json['type'] as String,
      href: json['href'] as String,
      joinDate: json['joinDate'] as String,
    );

Map<String, dynamic> _$SearchedUserInfoToJson(SearchedUserInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'humanName': instance.humanName,
      'entryPeriod': instance.entryPeriod,
      'email': instance.email,
      'status': instance.status,
      'type': instance.type,
      'href': instance.href,
      'joinDate': instance.joinDate,
    };
