import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfoList {
  @JsonKey(name: "items")
  List<UserInfo> items;
  
  UserInfoList({required this.items});

  factory UserInfoList.fromJson(Map<String, dynamic> json) => _$UserInfoListFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoListToJson(this);
}

@JsonSerializable()
class UserInfo {
  final CollectHrefFromMap achievementsHistory;
  final BusinessEntity businessEntity;
  final Coapplicant coapplicant;
  final CollectHrefFromMap cumulativeMetricsProfile;
  final CollectHrefFromMap customerSite;
  final CollectHrefFromMap draftBankAccounts;
  final String email;
  final EnrollerOrSponser enroller;
  final String entryPeriod;
  final String homePhone;
  final String href;
  final HumanName humanName;
  final Id id;
  final String joinDate;
  final CollectHrefFromMap loginAssociations;
  final MainAddress mainAddress;
  final CollectHrefFromMap metricsProfile;
  final CollectHrefFromMap metricsProfileHistory;
  final CollectHrefFromMap orders;
  final CollectHrefFromMap profilePicture;
  List<Rights> rights;
  final EnrollerOrSponser sponsor;
  final CollectHrefFromMap sponsoredCustomers;
  final CollectHrefFromMap statements;
  final String status;
  List<Subscriptions> subscriptions;
  final TaxTerms taxTerms;
  final String type;
  final int unicity;

  // UserInfo(
  //     {required this.achievementsHistory,
  //     required this.businessEntity,
  //     required this.coapplicant,
  //     required this.cumulativeMetricsProfile,
  //     required this.customerSite,
  //     required this.draftBankAccounts,
  //     required this.email,
  //     required this.enroller,
  //     required this.entryPeriod,
  //     required this.homePhone,
  //     required this.href,
  //     required this.humanName,
  //     required this.id,
  //     required this.joinDate,
  //     required this.loginAssociations,
  //     required this.mainAddress,
  //     required this.metricsProfile,
  //     required this.metricsProfileHistory,
  //     required this.orders,
  //     required this.profilePicture,
  //     required this.rights,
  //     required this.sponsor,
  //     required this.sponsoredCustomers,
  //     required this.statements,
  //     required this.status,
  //     required this.subscriptions,
  //     required this.taxTerms,
  //     required this.type,
  //     required this.unicity});

  UserInfo()
      : achievementsHistory = CollectHrefFromMap(href: ""),
        businessEntity = BusinessEntity(legalType: ""),
        coapplicant = Coapplicant(
            details: CoapplicantDetails(
                humanName:
                    SortHumanName(firstName: "", fullName: "", lastName: ""))),
        cumulativeMetricsProfile = CollectHrefFromMap(href: ""),
        customerSite = CollectHrefFromMap(href: ""),
        draftBankAccounts = CollectHrefFromMap(href: ""),
        email = "",
        enroller = EnrollerOrSponser(
            href: "",
            humanName: HumanNameEn(
                firstName: "", lastName: "", fullName: "", fullNameEn: ""),
            id: Id(unicity: "")),
        entryPeriod = "",
        homePhone = "",
        href = "",
        humanName = HumanName(
            fullName: "", lastName: "", firstName: "", fullNameTh: ""),
        id = Id(unicity: ""),
        joinDate = "",
        loginAssociations = CollectHrefFromMap(href: ""),
        mainAddress = MainAddress(
            address1: "",
            address2: "",
            city: "",
            country: "",
            state: "",
            zip: ""),
        metricsProfile = CollectHrefFromMap(href: ""),
        metricsProfileHistory = CollectHrefFromMap(href: ""),
        orders = CollectHrefFromMap(href: ""),
        profilePicture = CollectHrefFromMap(href: ""),
        rights = [],
        sponsor = EnrollerOrSponser(
            href: "",
            humanName: HumanNameEn(
                firstName: "", fullName: "", fullNameEn: "", lastName: ""),
            id: Id(unicity: "")),
        statements = CollectHrefFromMap(href: ""),
        status = "",
        subscriptions = [],
        taxTerms = TaxTerms(taxId: ""),
        type = "",
        unicity = 0,
        sponsoredCustomers = CollectHrefFromMap(href: "");

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  // ignore: sort_unnamed_constructors_first
  // UserInfo(this.achievementsHistory, this.businessEntity, this.coapplicant, this.cumulativeMetricsProfile, this.customerSite, this.draftBankAccounts, this.email, this.enroller, this.entryPeriod, this.homePhone, this.href, this.humanName, this.id, this.joinDate, this.loginAssociations, this.mainAddress, this.metricsProfile, this.metricsProfileHistory, this.orders, this.profilePicture, this.sponsor, this.sponsoredCustomers, this.statements, this.status, this.taxTerms, this.type, this.unicity, this.subscriptions, this.rights);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

  Map<String, dynamic> toMap() => {
        'achievementsHistory': achievementsHistory,
        'businessEntity': businessEntity,
        'coapplicant': coapplicant,
        'cumulativeMetricsProfile': cumulativeMetricsProfile,
        'customerSite': customerSite,
        'draftBankAccounts': draftBankAccounts,
        'email': email,
        'enroller': enroller,
        'entryPeriod': entryPeriod,
        'homePhone': homePhone,
        'href': href,
        'humanName': humanName,
        'id': id,
        'joinDate': joinDate,
        'loginAssociations': loginAssociations,
        'mainAddress': mainAddress,
        'metricsProfile': metricsProfile,
        'metricsProfileHistory': metricsProfileHistory,
        'orders': orders,
        'profilePicture': profilePicture,
        'rights': rights,
        'sponsor': sponsor,
        'sponsoredCustomers': sponsoredCustomers,
        'statements': statements,
        'status': status,
        'subscriptions': subscriptions,
        'taxTerms': taxTerms,
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
  String fullNameTh;

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
class HumanNameEn {
  String firstName;
  String lastName;
  String fullName;
  @JsonKey(name: "fullName@en")
  String fullNameEn;

  HumanNameEn(
      {required this.firstName,
      required this.lastName,
      required this.fullName,
      required this.fullNameEn});

  factory HumanNameEn.fromJson(Map<String, dynamic> json) =>
      _$HumanNameEnFromJson(json);

  Map<String, dynamic> toJson() => _$HumanNameEnToJson(this);
}

@JsonSerializable()
class Coapplicant {
  final CoapplicantDetails details;

  Coapplicant({required this.details});

  factory Coapplicant.fromJson(Map<String, dynamic> json) =>
      _$CoapplicantFromJson(json);

  Map<String, dynamic> toJson() => _$CoapplicantToJson(this);
}

@JsonSerializable()
class CoapplicantDetails {
  final SortHumanName humanName;

  CoapplicantDetails({required this.humanName});

  factory CoapplicantDetails.fromJson(Map<String, dynamic> json) =>
      _$CoapplicantDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CoapplicantDetailsToJson(this);
}

@JsonSerializable()
class SortHumanName {
  String firstName;
  String lastName;
  String fullName;

  SortHumanName(
      {required this.firstName,
      required this.lastName,
      required this.fullName});

  factory SortHumanName.fromJson(Map<String, dynamic> json) =>
      _$SortHumanNameFromJson(json);

  Map<String, dynamic> toJson() => _$SortHumanNameToJson(this);
}

@JsonSerializable()
class Id {
  final dynamic unicity;

  Id({required this.unicity});

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);

  Map<String, dynamic> toJson() => _$IdToJson(this);
}

// Here ends
@JsonSerializable()
class EnrollerOrSponser {
  String href;
  Id id;
  HumanNameEn humanName;

  EnrollerOrSponser(
      {required this.href, required this.id, required this.humanName});

  factory EnrollerOrSponser.fromJson(Map<String, dynamic> json) =>
      _$EnrollerOrSponserFromJson(json);

  Map<String, dynamic> toJson() => _$EnrollerOrSponserToJson(this);
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

@JsonSerializable()
class TaxTerms {
  String taxId;

  TaxTerms({required this.taxId});

  factory TaxTerms.fromJson(Map<String, dynamic> json) =>
      _$TaxTermsFromJson(json);

  Map<String, dynamic> toJson() => _$TaxTermsToJson(this);
}

@JsonSerializable()
class MainAddress {
  String address1;
  String address2;
  String city;
  String state;
  String zip;
  String country;

  MainAddress(
      {required this.address1,
      required this.address2,
      required this.city,
      required this.state,
      required this.zip,
      required this.country});

  factory MainAddress.fromJson(Map<String, dynamic> json) =>
      _$MainAddressFromJson(json);

  Map<String, dynamic> toJson() => _$MainAddressToJson(this);
}

@JsonSerializable()
class Rights {
  String holder;
  String type;

  Rights({required this.holder, required this.type});

  factory Rights.fromJson(Map<String, dynamic> json) => _$RightsFromJson(json);

  Map<String, dynamic> toJson() => _$RightsToJson(this);
}
