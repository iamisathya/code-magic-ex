// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuestUserInfoList _$GuestUserInfoListFromJson(Map<String, dynamic> json) {
  return GuestUserInfoList(
    items: (json['items'] as List<dynamic>)
        .map((e) => GuestUserInfo.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GuestUserInfoListToJson(GuestUserInfoList instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

GuestUserInfo _$GuestUserInfoFromJson(Map<String, dynamic> json) {
  return GuestUserInfo(
    businessEntity:
        BusinessEntity.fromJson(json['businessEntity'] as Map<String, dynamic>),
    customerSite: CollectHrefFromMap.fromJson(
        json['customerSite'] as Map<String, dynamic>),
    entryPeriod: json['entryPeriod'] as String,
    href: json['href'] as String,
    humanName: HumanName.fromJson(json['humanName'] as Map<String, dynamic>),
    id: Id.fromJson(json['id'] as Map<String, dynamic>),
    joinDate: json['joinDate'] as String,
    status: json['status'] as String,
    subscriptions: (json['subscriptions'] as List<dynamic>)
        .map((e) => Subscriptions.fromJson(e as Map<String, dynamic>))
        .toList(),
    type: json['type'] as String,
    unicity: json['unicity'] as int,
  );
}

Map<String, dynamic> _$GuestUserInfoToJson(GuestUserInfo instance) =>
    <String, dynamic>{
      'businessEntity': instance.businessEntity,
      'customerSite': instance.customerSite,
      'entryPeriod': instance.entryPeriod,
      'href': instance.href,
      'humanName': instance.humanName,
      'id': instance.id,
      'joinDate': instance.joinDate,
      'status': instance.status,
      'subscriptions': instance.subscriptions,
      'type': instance.type,
      'unicity': instance.unicity,
    };

CollectHrefFromMap _$CollectHrefFromMapFromJson(Map<String, dynamic> json) {
  return CollectHrefFromMap(
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$CollectHrefFromMapToJson(CollectHrefFromMap instance) =>
    <String, dynamic>{
      'href': instance.href,
    };

BusinessEntity _$BusinessEntityFromJson(Map<String, dynamic> json) {
  return BusinessEntity(
    legalType: json['legalType'] as String,
  );
}

Map<String, dynamic> _$BusinessEntityToJson(BusinessEntity instance) =>
    <String, dynamic>{
      'legalType': instance.legalType,
    };

HumanName _$HumanNameFromJson(Map<String, dynamic> json) {
  return HumanName(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    fullName: json['fullName'] as String,
    fullNameTh: json['fullName@th'] as String,
  );
}

Map<String, dynamic> _$HumanNameToJson(HumanName instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'fullName@th': instance.fullNameTh,
    };

Id _$IdFromJson(Map<String, dynamic> json) {
  return Id(
    unicity: json['unicity'],
  );
}

Map<String, dynamic> _$IdToJson(Id instance) => <String, dynamic>{
      'unicity': instance.unicity,
    };

Subscriptions _$SubscriptionsFromJson(Map<String, dynamic> json) {
  return Subscriptions(
    type: json['type'] as String,
    startDate: json['startDate'] as String,
    endDate: json['endDate'] as String,
  );
}

Map<String, dynamic> _$SubscriptionsToJson(Subscriptions instance) =>
    <String, dynamic>{
      'type': instance.type,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
