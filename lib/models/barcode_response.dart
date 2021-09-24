import 'package:json_annotation/json_annotation.dart';

part 'barcode_response.g.dart';

@JsonSerializable()
class BarcodeResponse {
  @JsonKey(name: "href")
  String href;
  @JsonKey(name: "items")
  UserProfile userProfile;
  @JsonKey(name: "result")
  String? result;
  @JsonKey(name: "token")
  String token;
  @JsonKey(name: "url")
  String url;
  @JsonKey(name: "version")
  String version;

  BarcodeResponse(
      {required this.href,
      required this.userProfile,
      this.result,
      required this.token,
      required this.url,
      required this.version});

  factory BarcodeResponse.fromJson(Map<String, dynamic> json) =>
      _$BarcodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BarcodeResponseToJson(this);

  Map<String, dynamic> toMap() => {
        'href': href,
        'userProfile': userProfile,
        'result': result,
        'token': token,
        'url': url,
        'version': version
      };
}

@JsonSerializable()
class UserProfile {
  @JsonKey(name: "creator")
  Creator creator;
  @JsonKey(name: "currency")
  String currency;
  @JsonKey(name: "customer")
  Customer customer;
  @JsonKey(name: "dateCreated")
  String dateCreated;
  @JsonKey(name: "fulfillmentStatus")
  String fulfillmentStatus;
  @JsonKey(name: "href")
  String href;
  @JsonKey(name: "id")
  Id id;
  @JsonKey(name: "invoice")
  Invoice invoice;
  @JsonKey(name: "lines")
  Lines lines;
  @JsonKey(name: "market")
  String market;
  @JsonKey(name: "notes")
  String notes;
  @JsonKey(name: "paymentStatus")
  String paymentStatus;
  @JsonKey(name: "shipToAddress")
  ShipToAddress shipToAddress;
  @JsonKey(name: "shipToEmail")
  String shipToEmail;
  @JsonKey(name: "shipToName")
  ShipToName shipToName;
  @JsonKey(name: "shipToPhone")
  String shipToPhone;
  @JsonKey(name: "shippingMethod")
  ShippingMethod shippingMethod;
  @JsonKey(name: "source")
  dynamic source;
  @JsonKey(name: "terms")
  Terms terms;
  @JsonKey(name: "transactions")
  Transactions transactions;

  UserProfile(
      {required this.terms,
      required this.transactions,
      required this.creator,
      required this.currency,
      required this.customer,
      required this.fulfillmentStatus,
      required this.invoice,
      required this.lines,
      required this.market,
      required this.dateCreated,
      required this.id,
      required this.notes,
      required this.paymentStatus,
      required this.shipToAddress,
      required this.shipToEmail,
      required this.shippingMethod,
      required this.shipToName,
      required this.shipToPhone,
      required this.source,
      required this.href});

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  Map<String, dynamic> toMap() => {
        'terms': terms,
        'transactions': transactions,
        'creator': creator,
        'currency': currency,
        'customer': customer,
        'fulfillmentStatus': fulfillmentStatus,
        'invoice': invoice,
        'lines': lines,
        'market': market,
        'dateCreated': dateCreated,
        'id': id,
        'notes': notes,
        'paymentStatus': paymentStatus,
        'shipToAddress': shipToAddress,
        'shipToEmail': shipToEmail,
        'shippingMethod': shippingMethod,
        'shipToName': shipToName,
        'shipToPhone': shipToPhone,
        'source': source,
        'href': href,
      };
}

@JsonSerializable()
class Creator {
  BillToName humanName;

  Creator({required this.humanName});


  factory Creator.fromJson(Map<String, dynamic> json) =>
      _$CreatorFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorToJson(this);
}

@JsonSerializable()
class BillToName {
  String fullName;

  BillToName({required this.fullName});


  factory BillToName.fromJson(Map<String, dynamic> json) =>
      _$BillToNameFromJson(json);

  Map<String, dynamic> toJson() => _$BillToNameToJson(this);
}

@JsonSerializable()
class Customer {
  Id id;
  TaxTerms taxTerms;
  String href;

  Customer({required this.id, required this.taxTerms, required this.href});


  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable()
class Id {
  String unicity;

  Id({required this.unicity});


  factory Id.fromJson(Map<String, dynamic> json) =>
      _$IdFromJson(json);

  Map<String, dynamic> toJson() => _$IdToJson(this);
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
class Invoice {
  Id id;
  String href;

  Invoice({required this.id, required this.href});

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}

@JsonSerializable()
class LabelId {
  String unicity;
  String label;

  LabelId({required this.unicity, required this.label});


  factory LabelId.fromJson(Map<String, dynamic> json) =>
      _$LabelIdFromJson(json);

  Map<String, dynamic> toJson() => _$LabelIdToJson(this);
}

@JsonSerializable()
class Lines {
  List<ProductItems> items;

  Lines({required this.items});


  factory Lines.fromJson(Map<String, dynamic> json) =>
      _$LinesFromJson(json);

  Map<String, dynamic> toJson() => _$LinesToJson(this);
}

@JsonSerializable()
class ProductItems {
  Invoice item;
  CatalogSlide catalogSlide;
  ProductTerms terms;
  int quantity;
  QuantityDetails quantityDetails;

  ProductItems(
      {required this.item,
      required this.catalogSlide,
      required this.terms,
      required this.quantity,
      required this.quantityDetails});


  factory ProductItems.fromJson(Map<String, dynamic> json) =>
      _$ProductItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemsToJson(this);
}

@JsonSerializable()
class CatalogSlide {
  Content content;

  CatalogSlide({required this.content});


  factory CatalogSlide.fromJson(Map<String, dynamic> json) =>
      _$CatalogSlideFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogSlideToJson(this);
}

@JsonSerializable()
class Content {
  String description;

  Content({required this.description});


  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@JsonSerializable()
class ProductTerms {
  int priceEach;
  int pvEach;
  double taxablePriceEach;
  ProductTax tax;

  ProductTerms(
      {required this.priceEach,
      required this.pvEach,
      required this.taxablePriceEach,
      required this.tax});


  factory ProductTerms.fromJson(Map<String, dynamic> json) =>
      _$ProductTermsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTermsToJson(this);
}

@JsonSerializable()
class ProductTax {
  Aggregate aggregate;
  double amount;
  int percentage;

  ProductTax(
      {required this.aggregate,
      required this.amount,
      required this.percentage});


  factory ProductTax.fromJson(Map<String, dynamic> json) =>
      _$ProductTaxFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTaxToJson(this);
}

@JsonSerializable()
class Aggregate {
  double amount;

  Aggregate({required this.amount});


  factory Aggregate.fromJson(Map<String, dynamic> json) =>
      _$AggregateFromJson(json);

  Map<String, dynamic> toJson() => _$AggregateToJson(this);
}

@JsonSerializable()
class ShipToAddress {
  String address1;
  String address2;
  String city;
  String state;
  String zip;
  String country;

  ShipToAddress(
      {required this.address1,
      required this.address2,
      required this.city,
      required this.state,
      required this.zip,
      required this.country});


  factory ShipToAddress.fromJson(Map<String, dynamic> json) =>
      _$ShipToAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShipToAddressToJson(this);
}

@JsonSerializable()
class ShipToName {
  String firstName;
  String lastName;
  String fullName;
  @JsonKey(name: "fullName@th")
  String fullNameTh;

  ShipToName(
      {required this.firstName,
      required this.lastName,
      required this.fullName,
      required this.fullNameTh});


  factory ShipToName.fromJson(Map<String, dynamic> json) =>
      _$ShipToNameFromJson(json);

  Map<String, dynamic> toJson() => _$ShipToNameToJson(this);
}

@JsonSerializable()
class ShippingMethod {
  String type;
  String location;

  ShippingMethod({required this.type, required this.location});


  factory ShippingMethod.fromJson(Map<String, dynamic> json) =>
      _$ShippingMethodFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingMethodToJson(this);
}

@JsonSerializable()
class Terms {
  Discount discount;
  String period;
  int pretotal;
  TaxRate tax;
  Discount freight;
  int subtotal;
  double taxableTotal;
  int total;
  int pv;

  Terms(
      {required this.discount,
      required this.period,
      required this.pretotal,
      required this.tax,
      required this.freight,
      required this.subtotal,
      required this.taxableTotal,
      required this.total,
      required this.pv});


  factory Terms.fromJson(Map<String, dynamic> json) =>
      _$TermsFromJson(json);

  Map<String, dynamic> toJson() => _$TermsToJson(this);
}

@JsonSerializable()
class Transactions {
  List<TransactionItem> items;
  Aggregate aggregate;

  Transactions({required this.items, required this.aggregate});


  factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsToJson(this);
}

@JsonSerializable()
class TransactionItem {
  BillToAddress billToAddress;
  BillToName billToName;
  String billToPhone;
  MethodDetails methodDetails;
  int amount;
  String authorization;
  String type;

  TransactionItem(
      {required this.billToAddress,
      required this.billToName,
      required this.billToPhone,
      required this.methodDetails,
      required this.amount,
      required this.authorization,
      required this.type});


  factory TransactionItem.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionItemToJson(this);
}

@JsonSerializable()
class Discount {
  int amount;

  Discount({required this.amount});


  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountToJson(this);
}

@JsonSerializable()
class BillToAddress {
  String address1;
  String address2;
  String city;
  String zip;
  String country;

  BillToAddress(
      {required this.address1,
      required this.address2,
      required this.city,
      required this.zip,
      required this.country});


  factory BillToAddress.fromJson(Map<String, dynamic> json) =>
      _$BillToAddressFromJson(json);

  Map<String, dynamic> toJson() => _$BillToAddressToJson(this);
}

@JsonSerializable()
class MethodDetails {
  String payer;

  MethodDetails({required this.payer});


  factory MethodDetails.fromJson(Map<String, dynamic> json) =>
      _$MethodDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MethodDetailsToJson(this);
}

@JsonSerializable()
class QuantityDetails {
  int quantityBackordered;

  QuantityDetails({required this.quantityBackordered});


  factory QuantityDetails.fromJson(Map<String, dynamic> json) =>
      _$QuantityDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$QuantityDetailsToJson(this);
}

@JsonSerializable()
class TaxRate {
  double amount;
  int percentage;

  TaxRate({required this.amount, required this.percentage});


  factory TaxRate.fromJson(Map<String, dynamic> json) =>
      _$TaxRateFromJson(json);

  Map<String, dynamic> toJson() => _$TaxRateToJson(this);
}
