import 'package:json_annotation/json_annotation.dart';

part 'guest_user_info.g.dart';

@JsonSerializable()
class GuestUserInfoList {
  @JsonKey(name: "items")
  List<GuestUserInfo> items;
  
  GuestUserInfoList({required this.items});

  factory GuestUserInfoList.fromJson(Map<String, dynamic> json) => _$GuestUserInfoListFromJson(json);

  Map<String, dynamic> toJson() => _$GuestUserInfoListToJson(this);
}

@JsonSerializable()
class GuestUserInfo {
  BusinessEntity businessEntity;
  CollectHrefFromMap customerSite;
  String entryPeriod;
  String href;
  HumanName humanName;
  Id id;
  String joinDate;
  String status;
  List<Subscriptions> subscriptions;
  String type;
  int unicity;

  GuestUserInfo({
      required this.businessEntity,
      required this.customerSite,
      required this.entryPeriod,
      required this.href,
      required this.humanName,
      required this.id,
      required this.joinDate,
      required this.status,
      required this.subscriptions,
      required this.type,
      required this.unicity});

  factory GuestUserInfo.fromJson(Map<String, dynamic> json) =>
      _$GuestUserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$GuestUserInfoToJson(this);

  Map<String, dynamic> toMap() => {
        'businessEntity': businessEntity,
        'customerSite': customerSite,
        'entryPeriod': entryPeriod,
        'href': href,
        'humanName': humanName,
        'id': id,
        'joinDate': joinDate,        
        'status': status,
        'subscriptions': subscriptions,
        'type': type,
        'unicity': unicity
      };
}

@JsonSerializable()
class CollectHrefFromMap {
  final String href;

  CollectHrefFromMap({required this.href});

  factory CollectHrefFromMap.fromJson(Map<String, dynamic> json) =>
      _$CollectHrefFromMapFromJson(json);

  Map<String, dynamic> toJson() => _$CollectHrefFromMapToJson(this);
}

@JsonSerializable()
class BusinessEntity {
  final String legalType;

  BusinessEntity({required this.legalType});

  factory BusinessEntity.fromJson(Map<String, dynamic> json) =>
      _$BusinessEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessEntityToJson(this);
}

@JsonSerializable()
class HumanName {
  String firstName;
  String lastName;
  String fullName;
  @JsonKey(name: "fullName@th")
  String? fullNameTh;

  HumanName(
      {required this.firstName,
      required this.lastName,
      required this.fullName,
      required this.fullNameTh});

  factory HumanName.fromJson(Map<String, dynamic> json) =>
      _$HumanNameFromJson(json);

  Map<String, dynamic> toJson() => _$HumanNameToJson(this);
}

@JsonSerializable()
class Id {
  final dynamic unicity;

  Id({required this.unicity});

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);

  Map<String, dynamic> toJson() => _$IdToJson(this);
}

@JsonSerializable()
class Subscriptions {
  String type;
  String startDate;
  String endDate;

  Subscriptions(
      {required this.type, required this.startDate, required this.endDate});

  factory Subscriptions.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionsFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionsToJson(this);
}