// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindCustomer _$FindCustomerFromJson(Map<String, dynamic> json) => FindCustomer(
      items: (json['items'] as List<dynamic>)
          .map((e) => CustomerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FindCustomerToJson(FindCustomer instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

CustomerData _$CustomerDataFromJson(Map<String, dynamic> json) => CustomerData(
      unicity: json['unicity'] as int,
      humanName: CommonHumanNameFull.fromJson(
          json['humanName'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: CommonIdTypeString.fromJson(json['id'] as Map<String, dynamic>),
      profilePicture: CommonGenericHref.fromJson(
          json['profilePicture'] as Map<String, dynamic>),
      customerSite: CommonGenericHref.fromJson(
          json['customerSite'] as Map<String, dynamic>),
      businessEntity: BusinessEntity.fromJson(
          json['businessEntity'] as Map<String, dynamic>),
      joinDate: json['joinDate'] as String,
      status: json['status'] as String,
      type: json['type'] as String,
      email: json['email'] as String,
      entryPeriod: json['entryPeriod'] as String,
      subscriptions: (json['subscriptions'] as List<dynamic>)
          .map((e) => Subscription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerDataToJson(CustomerData instance) =>
    <String, dynamic>{
      'unicity': instance.unicity,
      'humanName': instance.humanName,
      'href': instance.href,
      'id': instance.id,
      'profilePicture': instance.profilePicture,
      'customerSite': instance.customerSite,
      'businessEntity': instance.businessEntity,
      'joinDate': instance.joinDate,
      'status': instance.status,
      'type': instance.type,
      'email': instance.email,
      'entryPeriod': instance.entryPeriod,
      'subscriptions': instance.subscriptions,
    };

BusinessEntity _$BusinessEntityFromJson(Map<String, dynamic> json) =>
    BusinessEntity(
      legalType: json['legalType'] as String,
    );

Map<String, dynamic> _$BusinessEntityToJson(BusinessEntity instance) =>
    <String, dynamic>{
      'legalType': instance.legalType,
    };

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) => Subscription(
      type: json['type'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
    );

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) =>
    <String, dynamic>{
      'type': instance.type,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
