// {"customer":{"mainAddress":{"city":"กรุงเทพมหานคร   ","country":"TH","state":"","zip":"10200","address1":"ทดสอบ ","address2":"\n                                Sub-Area\n                                พระบรมมหาราชวัง\n                                    Area\n                                พระนคร"},"humanName":{"firstName":"Test","lastName":"Account","firstName@th":"ทดสอบ","lastName@th":"ทดสอ"},"enroller":{"href":"https://hydra.unicity.net/v5a/customers?id.unicity=2970466"},"sponsor":{"href":"https://hydra.unicity.net/v5a/customers?id.unicity=2970466"},"birthDate":"2000-12-01","maritalStatus":"Single","email":"no@unicity.com","taxTerms":{"taxId":"5994200922960"},"homePhone":"009900990","mobilePhone":"0099009900","entryPeriod":"2021-08","gender":"male","password":{"value":"5994200922960"},"type":"Associate","source":{"agent":"MLBS-DSCTools-TH","campaign":null,"medium":"Internet","platform":"Mac OS","referrer":null,"version":null}},"lines":{"items":[{"item":{"href":"https://hydra.unicity.net/v5a/items?id.unicity=20817"},"quantity":1}]},"shipToName":{"firstName":"test","lastName":"account"},"shipToPhone":"009900990","shipToEmail":"no@unicity.com","notes":"enrollment|dsc|pc web|tha||2970466|","shipToAddress":{"city":"1","country":"TH","state":"","address1":"ทดสอบ ","address2":"\n                                Sub-Area\n                                พระบรมมหาราชวัง\n                                    Area\n                                พระนคร","zip":""},"shippingMethod":{"href":"https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/shippingmethods?type=WillCall"},"transactions":{"items":[{"amount":"this.terms.total","type":"record","method":"Cash"}]},"terms":{"period":"2021-08"},"source":{"agent":"MLBS-DSCTools-TH","campaign":null,"medium":"Internet","platform":"Mac OS","referrer":null,"version":null}}

import 'package:json_annotation/json_annotation.dart';

part 'enroll_log_request_data.g.dart';

@JsonSerializable()
class EnrollLogRequestData {
  @JsonKey(name: "customer")
  Customer customer;
  @JsonKey(name: "lines")
  ProductLines lines;
  @JsonKey(name: 'shipToName')
  ShipToName shipToName;
  @JsonKey(name: 'shipToPhone')
  String shipToPhone;
  @JsonKey(name: 'shipToEmail')
  String shipToEmail;
  @JsonKey(name: 'notes')
  String notes;
  @JsonKey(name: 'shipToAddress')
  UserShipToAddress shipToAddress;
  @JsonKey(name: 'transactions')
  Transactions transactions;
  @JsonKey(name: 'shippingMethod')
  CustomerHref shippingMethod;
  @JsonKey(name: 'terms')
  ProductTerms terms;
  @JsonKey(name: "source")
  Source source;

  EnrollLogRequestData(
      {required this.customer,
      required this.lines,
      required this.shipToName,
      required this.shipToPhone,
      required this.shipToEmail,
      required this.shipToAddress,
      required this.shippingMethod,
      required this.notes,
      required this.terms,
      required this.transactions,
      required this.source});

  Map<String, dynamic> toMap() => {
        'customer': customer,
        'lines': lines,
        'shipToName': shipToName,
        'shipToPhone': shipToPhone,
        'shipToEmail': shipToEmail,
        'shipToAddress': shipToAddress,
        'shippingMethod': shippingMethod,
        'notes': notes,
        'terms': terms,
        'transactions': transactions,
      };

  factory EnrollLogRequestData.fromJson(Map<String, dynamic> json) =>
      _$EnrollLogRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$EnrollLogRequestDataToJson(this);
}

@JsonSerializable()
class Customer {
  @JsonKey(name: "href")
  String href;
  @JsonKey(name: "mainAddress")
  MainAddress mainAddress;
  @JsonKey(name: "humanName")
  HumanName humanName;
  @JsonKey(name: "enroller")
  CustomerHref enroller;
  @JsonKey(name: "sponsor")
  CustomerHref sponsor;
  @JsonKey(name: "birthDate")
  String birthDate;
  @JsonKey(name: "maritalStatus")
  String maritalStatus;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "taxTerms")
  TaxTerms taxTerms;
  @JsonKey(name: "homePhone")
  String homePhone;
  @JsonKey(name: "mobilePhone")
  String mobilePhone;
  @JsonKey(name: "entryPeriod")
  String entryPeriod;
  @JsonKey(name: "gender")
  String gender;
  @JsonKey(name: "password")
  Password password;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "source")
  Source source;

  Customer(
      {required this.href,
      required this.mainAddress,
      required this.humanName,
      required this.enroller,
      required this.sponsor,
      required this.birthDate,
      required this.maritalStatus,
      required this.email,
      required this.taxTerms,
      required this.homePhone,
      required this.mobilePhone,
      required this.entryPeriod,
      required this.gender,
      required this.password,
      required this.type,
      required this.source});

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MainAddress {
  @JsonKey(name: 'city')
  String city;
  @JsonKey(name: 'country')
  String country;
  @JsonKey(name: 'state')
  String state;
  @JsonKey(name: 'zip')
  String zip;
  @JsonKey(name: 'address1')
  String address1;
  @JsonKey(name: 'address2')
  String address2;

  MainAddress(
      {required this.city,
      required this.country,
      required this.state,
      required this.zip,
      required this.address1,
      required this.address2});

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
  @JsonKey(name: "firstName@th")
  String firstNameTh;
  @JsonKey(name: "lastName@th")
  String? lastNameTh;

  HumanName(
      {required this.firstName,
      required this.lastName,
      required this.firstNameTh,
      required this.lastNameTh});

  factory HumanName.fromJson(Map<String, dynamic> json) =>
      _$HumanNameFromJson(json);

  Map<String, dynamic> toJson() => _$HumanNameToJson(this);
}

@JsonSerializable()
class CustomerHref {
  @JsonKey(name: "href")
  String href;

  CustomerHref({required this.href});

  factory CustomerHref.fromJson(Map<String, dynamic> json) =>
      _$CustomerHrefFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerHrefToJson(this);
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

@JsonSerializable(explicitToJson: true)
class Password {
  @JsonKey(name: "value")
  String value;

  Password({required this.value});

  factory Password.fromJson(Map<String, dynamic> json) =>
      _$PasswordFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Source {
  @JsonKey(name: "agent")
  String agent;
  @JsonKey(name: "campaign")
  dynamic campaign;
  @JsonKey(name: "medium")
  String medium;
  @JsonKey(name: "platform")
  String platform;
  @JsonKey(name: "referrer")
  dynamic referrer;
  @JsonKey(name: "version")
  dynamic version;

  Source(
      {required this.agent,
      required this.campaign,
      required this.medium,
      required this.platform,
      required this.referrer,
      required this.version});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductLines {
  @JsonKey(name: 'items')
  List<ProductLineItem> items;

  ProductLines({required this.items});

  factory ProductLines.fromJson(Map<String, dynamic> json) =>
      _$ProductLinesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductLinesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductLineItem {
  @JsonKey(name: 'item')
  CustomerHref item;
  @JsonKey(name: 'quantity')
  String quantity;

  ProductLineItem({required this.item, required this.quantity});

  factory ProductLineItem.fromJson(Map<String, dynamic> json) =>
      _$ProductLineItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductLineItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ShipToName {
  @JsonKey(name: 'firstName')
  String firstName;
  @JsonKey(name: 'lastName')
  String lastName;

  ShipToName({required this.firstName, required this.lastName});

  factory ShipToName.fromJson(Map<String, dynamic> json) =>
      _$ShipToNameFromJson(json);

  Map<String, dynamic> toJson() => _$ShipToNameToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipToAddress {
  @JsonKey(name: 'city')
  String city;
  @JsonKey(name: 'country')
  String country;
  @JsonKey(name: 'state')
  String state;
  @JsonKey(name: 'address1')
  String address1;
  @JsonKey(name: 'address2')
  String address2;
  @JsonKey(name: 'zip')
  String zip;

  UserShipToAddress(
      {required this.city,
      required this.country,
      required this.state,
      required this.address1,
      required this.address2,
      required this.zip});

  factory UserShipToAddress.fromJson(Map<String, dynamic> json) =>
      _$UserShipToAddressFromJson(json);

  Map<String, dynamic> toJson() => _$UserShipToAddressToJson(this);
}

@JsonSerializable()
class ProductTerms {
  @JsonKey(name: 'period')
  String period;

  ProductTerms({
    required this.period,
  });

  factory ProductTerms.fromJson(Map<String, dynamic> json) =>
      _$ProductTermsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTermsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Transactions {
  @JsonKey(name: 'items')
  List<TransactionItem> items;

  Transactions({required this.items});

  factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TransactionItem {
  @JsonKey(name: 'amount')
  String amount;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'method')
  String method;

  TransactionItem(
      {required this.amount, required this.type, required this.method});

  factory TransactionItem.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionItemToJson(this);
}
