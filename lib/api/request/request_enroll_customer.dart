import 'package:json_annotation/json_annotation.dart';

part 'request_enroll_customer.g.dart';

@JsonSerializable(explicitToJson: true)
class RequestPostPlaceOrder {
  @JsonKey(name: "mainAddress")
  MainAddress mainAddress;
  @JsonKey(name: "humanName")
  HumanName humanName;
  @JsonKey(name: "enroller")
  CollectHrefFromMap enroller;
  @JsonKey(name: "sponsor")
  CollectHrefFromMap sponsor;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "taxTerms")
  TaxTerms taxTerms;
  @JsonKey(name: "birthDate")
  String birthDate;
  @JsonKey(name: "homePhone")
  String homePhone;
  @JsonKey(name: "gender")
  String gender;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "maritalStatus")
  String maritalStatus;

  RequestPostPlaceOrder(
      {required this.mainAddress,
      required this.humanName,
      required this.enroller,
      required this.sponsor,
      required this.email,
      required this.taxTerms,
      required this.birthDate,
      required this.homePhone,
      required this.gender,
      required this.type,
      required this.maritalStatus});

  factory RequestPostPlaceOrder.fromJson(Map<String, dynamic> json) =>
      _$RequestPostPlaceOrderFromJson(json);

  Map<String, dynamic> toJson() => _$RequestPostPlaceOrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MainAddress {
  @JsonKey(name: "city")
  String city;
  @JsonKey(name: "country")
  String country;
  @JsonKey(name: "state")
  String state;
  @JsonKey(name: "zip")
  String zip;
  @JsonKey(name: "address1")
  String address1;
  @JsonKey(name: "address2")
  String address2;

  MainAddress({
    required this.city,
    required this.country,
    required this.state,
    required this.zip,
    required this.address1,
    required this.address2,
  });

  factory MainAddress.fromJson(Map<String, dynamic> json) =>
      _$MainAddressFromJson(json);

  Map<String, dynamic> toJson() => _$MainAddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HumanName {
  @JsonKey(name: "firstName")
  String firstName;
  @JsonKey(name: "lastName")
  String lastName;

  HumanName({required this.firstName, required this.lastName});

  factory HumanName.fromJson(Map<String, dynamic> json) =>
      _$HumanNameFromJson(json);

  Map<String, dynamic> toJson() => _$HumanNameToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CollectHrefFromMap {
  @JsonKey(name: "href")
  final String href;

  CollectHrefFromMap({required this.href});

  factory CollectHrefFromMap.fromJson(Map<String, dynamic> json) =>
      _$CollectHrefFromMapFromJson(json);

  Map<String, dynamic> toJson() => _$CollectHrefFromMapToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TaxTerms {
  @JsonKey(name: "taxId")
  String taxId;

  TaxTerms({required this.taxId});

  factory TaxTerms.fromJson(Map<String, dynamic> json) =>
      _$TaxTermsFromJson(json);

  Map<String, dynamic> toJson() => _$TaxTermsToJson(this);
}
