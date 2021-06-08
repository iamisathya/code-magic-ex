// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_enroll_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestPostPlaceOrder _$RequestPostPlaceOrderFromJson(
    Map<String, dynamic> json) {
  return RequestPostPlaceOrder(
    mainAddress:
        MainAddress.fromJson(json['mainAddress'] as Map<String, dynamic>),
    humanName: HumanName.fromJson(json['humanName'] as Map<String, dynamic>),
    enroller:
        CollectHrefFromMap.fromJson(json['enroller'] as Map<String, dynamic>),
    sponsor:
        CollectHrefFromMap.fromJson(json['sponsor'] as Map<String, dynamic>),
    email: json['email'] as String,
    taxTerms: TaxTerms.fromJson(json['taxTerms'] as Map<String, dynamic>),
    birthDate: json['birthDate'] as String,
    homePhone: json['homePhone'] as String,
    gender: json['gender'] as String,
    type: json['type'] as String,
    maritalStatus: json['maritalStatus'] as String,
  );
}

Map<String, dynamic> _$RequestPostPlaceOrderToJson(
        RequestPostPlaceOrder instance) =>
    <String, dynamic>{
      'mainAddress': instance.mainAddress.toJson(),
      'humanName': instance.humanName.toJson(),
      'enroller': instance.enroller.toJson(),
      'sponsor': instance.sponsor.toJson(),
      'email': instance.email,
      'taxTerms': instance.taxTerms.toJson(),
      'birthDate': instance.birthDate,
      'homePhone': instance.homePhone,
      'gender': instance.gender,
      'type': instance.type,
      'maritalStatus': instance.maritalStatus,
    };

MainAddress _$MainAddressFromJson(Map<String, dynamic> json) {
  return MainAddress(
    city: json['city'] as String,
    country: json['country'] as String,
    state: json['state'] as String,
    zip: json['zip'] as String,
    address1: json['address1'] as String,
    address2: json['address2'] as String,
  );
}

Map<String, dynamic> _$MainAddressToJson(MainAddress instance) =>
    <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'state': instance.state,
      'zip': instance.zip,
      'address1': instance.address1,
      'address2': instance.address2,
    };

HumanName _$HumanNameFromJson(Map<String, dynamic> json) {
  return HumanName(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
  );
}

Map<String, dynamic> _$HumanNameToJson(HumanName instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
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

TaxTerms _$TaxTermsFromJson(Map<String, dynamic> json) {
  return TaxTerms(
    taxId: json['taxId'] as String,
  );
}

Map<String, dynamic> _$TaxTermsToJson(TaxTerms instance) => <String, dynamic>{
      'taxId': instance.taxId,
    };
