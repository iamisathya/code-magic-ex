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
  ShipToName shipToName;
  @JsonKey(name: "shipToPhone")
  String shipToPhone;
  @JsonKey(name: "shipToTime")
  dynamic shipToTime;
  @JsonKey(name: "source")
  Source source;
  @JsonKey(name: "type")
  dynamic type;
  @JsonKey(name: "lines")
  ProductLines lines;
  @JsonKey(name: "transactions")
  Transactions transactions;
  @JsonKey(name: "customer")
  Customer customer;
  @JsonKey(name: "terms")
  Terms terms;
  @JsonKey(name: "dateCreated")
  String dateCreated;
  @JsonKey(name: "currency")
  String currency;
  @JsonKey(name: "giftReceipt")
  bool giftReceipt;
  @JsonKey(name: "taxedAs")
  String taxedAs;
  @JsonKey(name: "added_lines")
  AddedLineItems addedLines;
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
      required this.taxedAs,
      required this.addedLines,
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
        'taxedAs': taxedAs,
        'addedLines': addedLines,
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
class ShipToName {
  @JsonKey(name: "firstName")
  String firstName;
  @JsonKey(name: "lastName")
  String lastName;

  ShipToName({required this.firstName, required this.lastName});

  factory ShipToName.fromJson(Map<String, dynamic> json) =>
      _$ShipToNameFromJson(json);

  Map<String, dynamic> toJson() => _$ShipToNameToJson(this);
}

@JsonSerializable()
class Customer {
  ShipToAddress mainAddress;
  HumanNameFull humanName;
  Enroller enroller;
  Enroller sponsor;
  String birthDate;
  String maritalStatus;
  String email;
  TaxTerms taxTerms;
  String homePhone;
  String mobilePhone;
  String entryPeriod;
  String gender;
  Password password;
  String type;
  Source source;
  BusinessEntity businessEntity;
  String status;
  IdTypeString id;
  String href;
  String token;

  Customer({
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

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
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
class Enroller {
  String href;
  Id id;

  Enroller(
      {required this.href,
      required this.id});

  factory Enroller.fromJson(Map<String, dynamic> json) =>
      _$EnrollerFromJson(json);

  Map<String, dynamic> toJson() => _$EnrollerToJson(this);
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

@JsonSerializable()
class Tax {
  double amount;

  Tax({required this.amount});

  factory Tax.fromJson(Map<String, dynamic> json) =>
      _$TaxFromJson(json);

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
class HumanName {
  String fullName;

  HumanName({required this.fullName});

  factory HumanName.fromJson(Map<String, dynamic> json) =>
      _$HumanNameFromJson(json);

  Map<String, dynamic> toJson() => _$HumanNameToJson(this);
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
  int pv;
  int subtotal;
  Tax tax;
  double taxableTotal;
  int total;
  Discount discountDisplay;
  String period;
  double weight;

  Terms(
      {required this.discount,
      required this.freight,
      required this.pv,
      required this.subtotal,
      required this.tax,
      required this.taxableTotal,
      required this.total,
      required this.discountDisplay,
      required this.period,
      required this.weight});

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

@JsonSerializable(nullable: true)
class Transactions {
  List<TransactionItems>? items;
  
  Transactions({
    required this.items,  
  });

  factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsToJson(this);
}

@JsonSerializable()
class TransactionItems {
  @JsonKey(name: "amount")
  int amount;
  @JsonKey(name: "authorization")
  String authorization;
  @JsonKey(name: "method")
  String method;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "index")
  int index;

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
class Source {
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

  Source(
      {required this.agent,
      required this.campaign,
      required this.medium,
      required this.platform,
      required this.referrer,
      required this.version});


  factory Source.fromJson(Map<String, dynamic> json) =>
      _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
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
class ProductLines {
  @JsonKey(name: "items")
  List<ProductLineItems> items;

  ProductLines({
    required this.items,
  });

  factory ProductLines.fromJson(Map<String, dynamic> json) =>
      _$ProductLinesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductLinesToJson(this);
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
class ProductTerms {
  @JsonKey(name: 'priceEach')
  int priceEach;
  @JsonKey(name: 'subtotal')
  int subtotal;
  @JsonKey(name: 'discount')
  Discount discount;

  ProductTerms({
    required this.priceEach,
    required this.subtotal,
    required this.discount,
  });

  factory ProductTerms.fromJson(Map<String, dynamic> json) =>
      _$ProductTermsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTermsToJson(this);
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
