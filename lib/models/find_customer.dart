import 'package:code_magic_ex/models/common_methods.dart';
import 'package:json_annotation/json_annotation.dart';

part 'find_customer.g.dart';

@JsonSerializable()
class FindCustomer {
  @JsonKey(name: "items")
  List<CustomerData> items;

  FindCustomer({
    required this.items,
  });

  factory FindCustomer.fromJson(Map<String, dynamic> json) =>
      _$FindCustomerFromJson(json);

  Map<String, dynamic> toJson() => _$FindCustomerToJson(this);
}

@JsonSerializable()
class CustomerData {
  @JsonKey(name: "unicity")
  String unicity;
  @JsonKey(name: "humanName")
  CommonHumanNameFull humanName;
  @JsonKey(name: "href")
  String href;
  @JsonKey(name: "id")
  CommonIdTypeString id;
  @JsonKey(name: "profilePicture")
  CommonGenericHref profilePicture;
  @JsonKey(name: "customerSite")
  CommonGenericHref customerSite;
  @JsonKey(name: "businessEntity")
  BusinessEntity businessEntity;
  @JsonKey(name: "joinDate")
  String joinDate;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "entryPeriod")
  String entryPeriod;
  @JsonKey(name: "subscriptions")
  List<Subscription> subscriptions;
  
  CustomerData({
    required this.unicity,
    required this.humanName,
    required this.href,
    required this.id,
    required this.profilePicture,
    required this.customerSite,
    required this.businessEntity,
    required this.joinDate,
    required this.status,
    required this.type,
    required this.entryPeriod,
    required this.subscriptions,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) =>
      _$CustomerDataFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDataToJson(this);
}

@JsonSerializable()
class BusinessEntity {
  @JsonKey(name: "legalType")
  String legalType;
  
  BusinessEntity({
    required this.legalType,
  });

  factory BusinessEntity.fromJson(Map<String, dynamic> json) =>
      _$BusinessEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessEntityToJson(this);
}

@JsonSerializable()
class Subscription {
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "startDate")
  String startDate;
  @JsonKey(name: "endDate")
  String endDate;

  Subscription({
    required this.type,
    required this.startDate,
    required this.endDate,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);
}
