import 'package:json_annotation/json_annotation.dart';

part 'enroll_form.g.dart';

@JsonSerializable()
class EnrollForm {
  @JsonKey(name: "market")
  String market;
  @JsonKey(name: "notes")
  String notes;
  @JsonKey(name: "shippingMethod")
  ShippingMethod shippingMethod;
  @JsonKey(name: "shipToAddress")
  ShipToAddress shipToAddress;
  @JsonKey(name: "shipToEmail")
  String shipToEmail;
  @JsonKey(name: "shipToName")
  ShipToNameEnroll shipToName;
  @JsonKey(name: "shipToPhone")
  String shipToPhone;
  @JsonKey(name: "shipToTime")
  dynamic shipToTime;
  @JsonKey(name: "source")
  SourceEnroll source;
  @JsonKey(name: "type")
  dynamic type;
  @JsonKey(name: "lines")
  ProductLinesEnroll lines;
  @JsonKey(name: "transactions")
  TransactionsEnroll transactions;
  @JsonKey(name: "terms")
  Terms terms;
  @JsonKey(name: "dateCreated")
  String dateCreated;
  @JsonKey(name: "currency")
  String currency;
  @JsonKey(name: "giftReceipt")
  bool giftReceipt;

  @JsonKey(name: "customer")
  CustomerInfo customer;

  @JsonKey(name: "id")
  IdTypeString id;
  @JsonKey(name: "href")
  String href;

  EnrollForm(
      {required this.market,
      required this.notes,
      required this.shippingMethod,
      required this.shipToAddress,
      required this.shipToEmail,
      required this.shipToName,
      required this.shipToPhone,
      required this.shipToTime,
      required this.source,
      required this.type,
      required this.customer,
      required this.lines,
      required this.transactions,
      required this.terms,
      required this.dateCreated,
      required this.currency,
      required this.giftReceipt,
      required this.id,
      required this.href});

  factory EnrollForm.fromJson(Map<String, dynamic> json) =>
      _$EnrollFormFromJson(json);

  Map<String, dynamic> toJson() => _$EnrollFormToJson(this);

  Map<String, dynamic> toMap() => {
        'market': market,
        'notes': notes,
        'shippingMethod': shippingMethod,
        'shipToAddress': shipToAddress,
        'shipToEmail': shipToEmail,
        'shipToName': shipToName,
        'shipToPhone': shipToPhone,
        'shipToTime': shipToTime,
        'source': source,
        'type': type,
        'customer': customer,
        'lines': lines,
        'transactions': transactions,
        'terms': terms,
        'dateCreated': dateCreated,
        'currency': currency,
        'giftReceipt': giftReceipt,
        'id': id,
        'href': href
      };
}

@JsonSerializable()
class ShippingMethod {
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "warehouseUUID")
  String warehouseUUID;
  @JsonKey(name: "location")
  String location;

  ShippingMethod(
      {required this.type,
      required this.warehouseUUID,
      required this.location});

  factory ShippingMethod.fromJson(Map<String, dynamic> json) =>
      _$ShippingMethodFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingMethodToJson(this);
}

@JsonSerializable()
class ShipToAddress {
  @JsonKey(name: "country")
  String country;
  @JsonKey(name: "state")
  String state;
  @JsonKey(name: "city")
  String city;
  @JsonKey(name: "zip")
  String zip;
  @JsonKey(name: "address1")
  String address1;
  @JsonKey(name: "address2")
  String address2;

  ShipToAddress(
      {required this.country,
      required this.state,
      required this.city,
      required this.zip,
      required this.address1,
      required this.address2});

  factory ShipToAddress.fromJson(Map<String, dynamic> json) =>
      _$ShipToAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShipToAddressToJson(this);
}

@JsonSerializable()
class ShipToNameEnroll {
  @JsonKey(name: "firstName")
  String firstName;
  @JsonKey(name: "lastName")
  String lastName;

  ShipToNameEnroll({required this.firstName, required this.lastName});

  factory ShipToNameEnroll.fromJson(Map<String, dynamic> json) =>
      _$ShipToNameEnrollFromJson(json);

  Map<String, dynamic> toJson() => _$ShipToNameEnrollToJson(this);
}

@JsonSerializable()
class CustomerInfo {
  ShipToAddress mainAddress;
  HumanNameFull humanName;
  Enroller enroller;
  Enroller sponsor;
  String birthDate;
  String maritalStatus;
  String email;
  TaxTermsEnroll taxTerms;
  String homePhone;
  String mobilePhone;
  String entryPeriod;
  String gender;
  PasswordEnroll password;
  String type;
  SourceEnroll source;
  BusinessEntity businessEntity;
  String status;
  IdTypeString id;
  String href;
  String token;

  CustomerInfo({
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
    required this.source,
    required this.businessEntity,
    required this.status,
    required this.id,
    required this.href,
    required this.token,
  });

  factory CustomerInfo.fromJson(Map<String, dynamic> json) =>
      _$CustomerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerInfoToJson(this);
}

@JsonSerializable()
class TaxTermsEnroll {
  String taxId;

  TaxTermsEnroll({required this.taxId});

  factory TaxTermsEnroll.fromJson(Map<String, dynamic> json) =>
      _$TaxTermsEnrollFromJson(json);

  Map<String, dynamic> toJson() => _$TaxTermsEnrollToJson(this);
}

@JsonSerializable()
class Enroller {
  String href;
  Id id;

  Enroller({required this.href, required this.id});

  factory Enroller.fromJson(Map<String, dynamic> json) =>
      _$EnrollerFromJson(json);

  Map<String, dynamic> toJson() => _$EnrollerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PasswordEnroll {
  @JsonKey(name: "value")
  String value;

  PasswordEnroll({required this.value});

  factory PasswordEnroll.fromJson(Map<String, dynamic> json) =>
      _$PasswordEnrollFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordEnrollToJson(this);
}

@JsonSerializable()
class Tax {
  double amount;

  Tax({required this.amount});

  factory Tax.fromJson(Map<String, dynamic> json) => _$TaxFromJson(json);

  Map<String, dynamic> toJson() => _$TaxToJson(this);
}

@JsonSerializable()
class BusinessEntity {
  String legalType;

  BusinessEntity({required this.legalType});

  factory BusinessEntity.fromJson(Map<String, dynamic> json) =>
      _$BusinessEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessEntityToJson(this);
}

@JsonSerializable()
class Sponsor {
  String href;
  Id id;

  Sponsor({required this.href, required this.id});
  factory Sponsor.fromJson(Map<String, dynamic> json) =>
      _$SponsorFromJson(json);

  Map<String, dynamic> toJson() => _$SponsorToJson(this);
}

@JsonSerializable()
class Id {
  int unicity;

  Id({required this.unicity});
  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);

  Map<String, dynamic> toJson() => _$IdToJson(this);
}

@JsonSerializable()
class HumanNameFull {
  String firstName;
  String lastName;
  @JsonKey(name: "firstName@th")
  String firstNameTh;
  @JsonKey(name: "lastName@th")
  String lastNameTh;

  HumanNameFull(
      {required this.firstName,
      required this.lastName,
      required this.firstNameTh,
      required this.lastNameTh});

  factory HumanNameFull.fromJson(Map<String, dynamic> json) =>
      _$HumanNameFullFromJson(json);

  Map<String, dynamic> toJson() => _$HumanNameFullToJson(this);
}

@JsonSerializable()
class IdTypeString {
  @JsonKey(name: "unicity")
  String unicity;

  IdTypeString({
    required this.unicity,
  });

  factory IdTypeString.fromJson(Map<String, dynamic> json) =>
      _$IdTypeStringFromJson(json);

  Map<String, dynamic> toJson() => _$IdTypeStringToJson(this);
}

@JsonSerializable()
class Terms {
  Discount discount;
  Discount freight;
  String period;
  int pv;
  int subtotal;
  Tax tax;
  double taxableTotal;
  int total;

  Terms({
    required this.discount,
    required this.freight,
    required this.pv,
    required this.subtotal,
    required this.tax,
    required this.taxableTotal,
    required this.total,
    required this.period,
  });

  factory Terms.fromJson(Map<String, dynamic> json) => _$TermsFromJson(json);

  Map<String, dynamic> toJson() => _$TermsToJson(this);
}

@JsonSerializable()
class Discount {
  int amount;

  Discount({
    required this.amount,
  });

  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountToJson(this);
}

@JsonSerializable()
class Aggregate {
  Discount aggregate;

  Aggregate({
    required this.aggregate,
  });

  factory Aggregate.fromJson(Map<String, dynamic> json) =>
      _$AggregateFromJson(json);

  Map<String, dynamic> toJson() => _$AggregateToJson(this);
}

@JsonSerializable()
class TransactionsEnroll {
  List<TransactionItems>? items;

  TransactionsEnroll({
    required this.items,
  });

  factory TransactionsEnroll.fromJson(Map<String, dynamic> json) =>
      _$TransactionsEnrollFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsEnrollToJson(this);
}

@JsonSerializable()
class TransactionItems {
  @JsonKey(name: "amount")
  int amount;
  @JsonKey(name: "authorization")
  String? authorization;
  @JsonKey(name: "method")
  String method;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "index")
  int? index;

  TransactionItems({
    required this.amount,
    required this.authorization,
    required this.method,
    required this.type,
    required this.index,
  });

  factory TransactionItems.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemsFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionItemsToJson(this);
}

@JsonSerializable()
class Freight {
  @JsonKey(name: 'amount')
  int amount;

  Freight({required this.amount});

  factory Freight.fromJson(Map<String, dynamic> json) =>
      _$FreightFromJson(json);

  Map<String, dynamic> toJson() => _$FreightToJson(this);
}

@JsonSerializable()
class SourceEnroll {
  @JsonKey(name: 'agent')
  String agent;
  @JsonKey(name: 'campaign')
  dynamic campaign;
  @JsonKey(name: 'medium')
  String medium;
  @JsonKey(name: 'platform')
  String platform;
  @JsonKey(name: 'referrer')
  dynamic referrer;
  @JsonKey(name: 'version')
  dynamic version;

  SourceEnroll(
      {required this.agent,
      required this.campaign,
      required this.medium,
      required this.platform,
      required this.referrer,
      required this.version});

  factory SourceEnroll.fromJson(Map<String, dynamic> json) =>
      _$SourceEnrollFromJson(json);

  Map<String, dynamic> toJson() => _$SourceEnrollToJson(this);
}

@JsonSerializable()
class TaxAmount {
  @JsonKey(name: 'amount')
  double amount;

  TaxAmount({required this.amount});

  factory TaxAmount.fromJson(Map<String, dynamic> json) =>
      _$TaxAmountFromJson(json);

  Map<String, dynamic> toJson() => _$TaxAmountToJson(this);
}

@JsonSerializable()
class MainTerms {
  Discount discount;
  Freight freight;
  int pv;
  int subtotal;
  TaxAmount tax;
  double taxableTotal;
  int total;
  Discount discountDisplay;
  double weight;

  MainTerms({
    required this.discount,
    required this.freight,
    required this.pv,
    required this.subtotal,
    required this.tax,
    required this.taxableTotal,
    required this.total,
    required this.discountDisplay,
    required this.weight,
  });

  factory MainTerms.fromJson(Map<String, dynamic> json) =>
      _$MainTermsFromJson(json);

  Map<String, dynamic> toJson() => _$MainTermsToJson(this);
}

@JsonSerializable()
class ProductLinesEnroll {
  @JsonKey(name: "items")
  List<ProductLineItems> items;

  ProductLinesEnroll({
    required this.items,
  });

  factory ProductLinesEnroll.fromJson(Map<String, dynamic> json) =>
      _$ProductLinesEnrollFromJson(json);

  Map<String, dynamic> toJson() => _$ProductLinesEnrollToJson(this);
}

@JsonSerializable()
class ProductLineItems {
  @JsonKey(name: "item")
  ProductItemBaseInfo item;
  @JsonKey(name: "quantity")
  int quantity;

  ProductLineItems({
    required this.item,
    required this.quantity,
  });

  factory ProductLineItems.fromJson(Map<String, dynamic> json) =>
      _$ProductLineItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductLineItemsToJson(this);
}

@JsonSerializable()
class ProductItemBaseInfo {
  @JsonKey(name: 'href')
  String href;
  @JsonKey(name: 'id')
  IdTypeString id;

  ProductItemBaseInfo({
    required this.href,
    required this.id,
  });

  factory ProductItemBaseInfo.fromJson(Map<String, dynamic> json) =>
      _$ProductItemBaseInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemBaseInfoToJson(this);
}

@JsonSerializable()
class ProductTermsEnroll {
  @JsonKey(name: 'priceEach')
  int priceEach;
  @JsonKey(name: 'subtotal')
  int subtotal;
  @JsonKey(name: 'discount')
  Discount discount;

  ProductTermsEnroll({
    required this.priceEach,
    required this.subtotal,
    required this.discount,
  });

  factory ProductTermsEnroll.fromJson(Map<String, dynamic> json) =>
      _$ProductTermsEnrollFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTermsEnrollToJson(this);
}

@JsonSerializable()
class AddedLineItems {
  @JsonKey(name: 'items')
  List<AddedLineItem> items;

  AddedLineItems({required this.items});

  factory AddedLineItems.fromJson(Map<String, dynamic> json) =>
      _$AddedLineItemsFromJson(json);

  Map<String, dynamic> toJson() => _$AddedLineItemsToJson(this);
}

@JsonSerializable()
class AddedLineItem {
  AddedLineItem();

  factory AddedLineItem.fromJson(Map<String, dynamic> json) =>
      _$AddedLineItemFromJson(json);

  Map<String, dynamic> toJson() => _$AddedLineItemToJson(this);
}
