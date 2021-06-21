// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo()
    ..rights = (json['rights'] as List<dynamic>)
        .map((e) => Rights.fromJson(e as Map<String, dynamic>))
        .toList()
    ..subscriptions = (json['subscriptions'] as List<dynamic>)
        .map((e) => Subscriptions.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'rights': instance.rights,
      'subscriptions': instance.subscriptions,
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

HumanNameEn _$HumanNameEnFromJson(Map<String, dynamic> json) {
  return HumanNameEn(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    fullName: json['fullName'] as String,
    fullNameEn: json['fullName@en'] as String,
  );
}

Map<String, dynamic> _$HumanNameEnToJson(HumanNameEn instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'fullName@en': instance.fullNameEn,
    };

Coapplicant _$CoapplicantFromJson(Map<String, dynamic> json) {
  return Coapplicant(
    details:
        CoapplicantDetails.fromJson(json['details'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CoapplicantToJson(Coapplicant instance) =>
    <String, dynamic>{
      'details': instance.details,
    };

CoapplicantDetails _$CoapplicantDetailsFromJson(Map<String, dynamic> json) {
  return CoapplicantDetails(
    humanName:
        SortHumanName.fromJson(json['humanName'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CoapplicantDetailsToJson(CoapplicantDetails instance) =>
    <String, dynamic>{
      'humanName': instance.humanName,
    };

SortHumanName _$SortHumanNameFromJson(Map<String, dynamic> json) {
  return SortHumanName(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    fullName: json['fullName'] as String,
  );
}

Map<String, dynamic> _$SortHumanNameToJson(SortHumanName instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
    };

Id _$IdFromJson(Map<String, dynamic> json) {
  return Id(
    unicity: json['unicity'],
  );
}

Map<String, dynamic> _$IdToJson(Id instance) => <String, dynamic>{
      'unicity': instance.unicity,
    };

EnrollerOrSponser _$EnrollerOrSponserFromJson(Map<String, dynamic> json) {
  return EnrollerOrSponser(
    href: json['href'] as String,
    id: Id.fromJson(json['id'] as Map<String, dynamic>),
    humanName: HumanNameEn.fromJson(json['humanName'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EnrollerOrSponserToJson(EnrollerOrSponser instance) =>
    <String, dynamic>{
      'href': instance.href,
      'id': instance.id,
      'humanName': instance.humanName,
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

TaxTerms _$TaxTermsFromJson(Map<String, dynamic> json) {
  return TaxTerms(
    taxId: json['taxId'] as String,
  );
}

Map<String, dynamic> _$TaxTermsToJson(TaxTerms instance) => <String, dynamic>{
      'taxId': instance.taxId,
    };

MainAddress _$MainAddressFromJson(Map<String, dynamic> json) {
  return MainAddress(
    address1: json['address1'] as String,
    address2: json['address2'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    zip: json['zip'] as String,
    country: json['country'] as String,
  );
}

Map<String, dynamic> _$MainAddressToJson(MainAddress instance) =>
    <String, dynamic>{
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'state': instance.state,
      'zip': instance.zip,
      'country': instance.country,
    };

Rights _$RightsFromJson(Map<String, dynamic> json) {
  return Rights(
    holder: json['holder'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$RightsToJson(Rights instance) => <String, dynamic>{
      'holder': instance.holder,
      'type': instance.type,
    };
