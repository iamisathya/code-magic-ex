import 'package:json_annotation/json_annotation.dart';

part 'sales_report_details.g.dart';

@JsonSerializable()
class SalesReportDetails {
  @JsonKey(name: "terms")
  TermsItem terms;
  @JsonKey(name: "transactions")
  Transactions transactions;
  @JsonKey(name: "creator")
  CommonHumanNameObject creator;
  @JsonKey(name: "currency")
  String currency;
  @JsonKey(name: "customer")
  Customer customer;
  @JsonKey(name: "fulfillmentStatus")
  String fulfillmentStatus;
  @JsonKey(name: "invoice")
  Invoice invoice;
  @JsonKey(name: "lines")
  Lines lines;
  @JsonKey(name: "market")
  String market;
  @JsonKey(name: "dateCreated")
  String dateCreated;
  @JsonKey(name: "id")
  Id id;
  @JsonKey(name: "notes")
  String notes;
  @JsonKey(name: "paymentStatus")
  String paymentStatus;
  @JsonKey(name: "shipToAddress")
  ShipToAddress shipToAddress;
  @JsonKey(name: "shipToEmail")
  String shipToEmail;
  @JsonKey(name: "shippingMethod")
  ShippingMethod shippingMethod;
  @JsonKey(name: "shipToName")
  ShipToName shipToName;
  @JsonKey(name: "shipToPhone")
  String shipToPhone;
  @JsonKey(name: "source")
  Source source;
  @JsonKey(name: "href")
  String href;

  SalesReportDetails({
    required this.terms,
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
    required this.href,
  });

  Map<String, dynamic> toMap() => {
        'terms': terms,
        'transactions': transactions,
        'preTotal': creator,
        'freight': currency,
        'tax': customer,
        'subTotal': fulfillmentStatus,
        'pv': invoice,
        'total': market,
        'taxableTotal': dateCreated,
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

  factory SalesReportDetails.fromJson(Map<String, dynamic> json) =>
      _$SalesReportDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$SalesReportDetailsToJson(this);
}

@JsonSerializable()
class TermsItem {
  @JsonKey(name: "discount")
  Discount discount;
  @JsonKey(name: "period")
  String period;
  @JsonKey(name: "pretotal")
  int preTotal;
  @JsonKey(name: "tax")
  TaxItem tax;
  @JsonKey(name: "freight")
  Discount freight;
  @JsonKey(name: "subtotal")
  int subTotal;
  @JsonKey(name: "taxableTotal")
  double taxableTotal;
  @JsonKey(name: "total")
  int total;
  @JsonKey(name: "pv")
  int pv;

  TermsItem(
      {required this.discount,
      required this.period,
      required this.preTotal,
      required this.tax,
      required this.freight,
      required this.subTotal,
      required this.taxableTotal,
      required this.total,
      required this.pv});

  Map<String, dynamic> toMap() => {
        'discount': discount,
        'period': period,
        'preTotal': preTotal,
        'freight': freight,
        'tax': tax,
        'subTotal': subTotal,
        'pv': pv,
        'total': total,
        'taxableTotal': taxableTotal,
      };

  factory TermsItem.fromJson(Map<String, dynamic> json) =>
      _$TermsItemFromJson(json);

  Map<String, dynamic> toJson() => _$TermsItemToJson(this);
}

@JsonSerializable()
class Discount {
  @JsonKey(name: "amount")
  int amount;

  Discount({
    required this.amount,
  });

  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountToJson(this);
}

@JsonSerializable()
class TaxItem {
  @JsonKey(name: "amount")
  double amount;
  @JsonKey(name: "percentage")
  int percentage;

  TaxItem({required this.amount, required this.percentage});

  Map<String, dynamic> toMap() => {
        'amount': amount,
        'percentage': percentage,
      };

  factory TaxItem.fromJson(Map<String, dynamic> json) =>
      _$TaxItemFromJson(json);

  Map<String, dynamic> toJson() => _$TaxItemToJson(this);
}

@JsonSerializable()
class Transactions {
  @JsonKey(name: "items")
  List<TransactionItems> items;
  @JsonKey(name: "aggregate")
  Discount aggregate;

  Transactions({
    required this.items,
    required this.aggregate,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsToJson(this);
}

@JsonSerializable()
class TransactionItems {
  @JsonKey(name: "billToAddress")
  BillToAddress billToAddress;
  @JsonKey(name: "billToName")
  BillToName billToName;
  @JsonKey(name: "billToPhone")
  String? billToPhone;
  @JsonKey(name: "methodDetails")
  MethodDetails methodDetails;
  @JsonKey(name: "amount")
  int amount;
  @JsonKey(name: "authorization")
  String authorization;
  @JsonKey(name: "method")
  String method;
  @JsonKey(name: "type")
  String type;

  TransactionItems({
    required this.billToAddress,
    required this.billToName,
    this.billToPhone,
    required this.methodDetails,
    required this.amount,
    required this.authorization,
    required this.method,
    required this.type,
  });

  factory TransactionItems.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemsFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionItemsToJson(this);
}

@JsonSerializable()
class BillToName {
  @JsonKey(name: "fullName")
  String fullName;

  BillToName({required this.fullName});

  factory BillToName.fromJson(Map<String, dynamic> json) =>
      _$BillToNameFromJson(json);

  Map<String, dynamic> toJson() => _$BillToNameToJson(this);
}

@JsonSerializable()
class FullName {
  @JsonKey(name: "fullName")
  String fullName;

  FullName({
    required this.fullName,
  });

  factory FullName.fromJson(Map<String, dynamic> json) =>
      _$FullNameFromJson(json);

  Map<String, dynamic> toJson() => _$FullNameToJson(this);
}

@JsonSerializable()
class MethodDetails {
  @JsonKey(name: "payer")
  String payer;
  @JsonKey(name: "creditCardNumberMasked")
  String creditCardNumberMasked;
  @JsonKey(name: "creditCardNetwork")
  String creditCardNetwork;

  MethodDetails({
    required this.payer,
    required this.creditCardNumberMasked,
    required this.creditCardNetwork,
  });

  factory MethodDetails.fromJson(Map<String, dynamic> json) =>
      _$MethodDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MethodDetailsToJson(this);
}

@JsonSerializable()
class BillToAddress {
  @JsonKey(name: "address1")
  String address1;
  @JsonKey(name: "address2")
  String address2;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "zip")
  String? zip;
  @JsonKey(name: "country")
  String? country;

  BillToAddress({
    required this.address1,
    required this.address2,
    this.city,
    this.zip,
    this.country,
  });

  factory BillToAddress.fromJson(Map<String, dynamic> json) =>
      _$BillToAddressFromJson(json);

  Map<String, dynamic> toJson() => _$BillToAddressToJson(this);
}

@JsonSerializable()
class ShipToAddress {
  @JsonKey(name: "address1")
  String address1;
  @JsonKey(name: "address2")
  String address2;
  @JsonKey(name: "city")
  String city;
  @JsonKey(name: "state")
  String state;
  @JsonKey(name: "zip")
  String zip;
  @JsonKey(name: "country")
  String country;

  ShipToAddress({
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.zip,
    required this.country,
  });

  factory ShipToAddress.fromJson(Map<String, dynamic> json) =>
      _$ShipToAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShipToAddressToJson(this);
}

@JsonSerializable()
class CommonHumanNameObject {
  @JsonKey(name: "humanName")
  CommonFullName humanName;

  CommonHumanNameObject({
    required this.humanName,
  });

  factory CommonHumanNameObject.fromJson(Map<String, dynamic> json) =>
      _$CommonHumanNameObjectFromJson(json);

  Map<String, dynamic> toJson() => _$CommonHumanNameObjectToJson(this);
}

@JsonSerializable()
class CommonFullName {
  @JsonKey(name: "fullName")
  String fullName;

  CommonFullName({
    required this.fullName,
  });

  factory CommonFullName.fromJson(Map<String, dynamic> json) =>
      _$CommonFullNameFromJson(json);

  Map<String, dynamic> toJson() => _$CommonFullNameToJson(this);
}

@JsonSerializable()
class Customer {
  @JsonKey(name: "id")
  CommonIdTypeString id;
  @JsonKey(name: "taxTerms")
  TaxTerms taxTerms;
  @JsonKey(name: "href")
  String href;

  Customer({
    required this.id,
    required this.taxTerms,
    required this.href,
  });

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable()
class Invoice {
  @JsonKey(name: "id")
  CommonIdTypeString id;
  @JsonKey(name: "href")
  String href;

  Invoice({
    required this.id,
    required this.href,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}

@JsonSerializable()
class TaxTerms {
  @JsonKey(name: "taxId")
  String taxId;

  TaxTerms({required this.taxId});

  factory TaxTerms.fromJson(Map<String, dynamic> json) =>
      _$TaxTermsFromJson(json);

  Map<String, dynamic> toJson() => _$TaxTermsToJson(this);
}

@JsonSerializable()
class CommonIdTypeString {
  @JsonKey(name: "unicity")
  String unicity;

  CommonIdTypeString({
    required this.unicity,
  });

  factory CommonIdTypeString.fromJson(Map<String, dynamic> json) =>
      _$CommonIdTypeStringFromJson(json);

  Map<String, dynamic> toJson() => _$CommonIdTypeStringToJson(this);
}

@JsonSerializable()
class Id {
  @JsonKey(name: "unicity")
  String unicity;
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "href")
  String? href;

  Id({
    required this.unicity,
    this.label,
    this.href,
  });

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);

  Map<String, dynamic> toJson() => _$IdToJson(this);
}

@JsonSerializable()
class ShippingMethod {
  @JsonKey(name: "href")
  String href;
  @JsonKey(name: "type")
  String type;

  ShippingMethod({
    required this.href,
    required this.type,
  });

  factory ShippingMethod.fromJson(Map<String, dynamic> json) =>
      _$ShippingMethodFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingMethodToJson(this);
}

@JsonSerializable()
class ShipToName {
  @JsonKey(name: "firstName")
  String firstName;
  @JsonKey(name: "lastName")
  String lastName;
  @JsonKey(name: "fullName")
  String fullName;

  ShipToName({
    required this.firstName,
    required this.lastName,
    required this.fullName,
  });

  factory ShipToName.fromJson(Map<String, dynamic> json) =>
      _$ShipToNameFromJson(json);

  Map<String, dynamic> toJson() => _$ShipToNameToJson(this);
}

@JsonSerializable()
class Source {
  @JsonKey(name: "medium")
  String medium;

  Source({required this.medium});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

@JsonSerializable()
class Shipments {
  @JsonKey(name: "items")
  List<ShipmentItem> items;

  Shipments({required this.items});

  factory Shipments.fromJson(Map<String, dynamic> json) =>
      _$ShipmentsFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentsToJson(this);
}

@JsonSerializable()
class ShipmentItem {
  @JsonKey(name: "trackingNumber")
  String trackingNumber;

  ShipmentItem({required this.trackingNumber});

  factory ShipmentItem.fromJson(Map<String, dynamic> json) =>
      _$ShipmentItemFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentItemToJson(this);
}

@JsonSerializable()
class Lines {
  @JsonKey(name: "items")
  List<Items> items;

  Lines({required this.items});

  factory Lines.fromJson(Map<String, dynamic> json) => _$LinesFromJson(json);

  Map<String, dynamic> toJson() => _$LinesToJson(this);
}

@JsonSerializable()
class Items {
  @JsonKey(name: "item")
  LineItem item;
  @JsonKey(name: "catalogSlide")
  CatalogSlide catalogSlide;
  @JsonKey(name: "terms")
  Terms terms;
  @JsonKey(name: "quantity")
  int quantity;
  @JsonKey(name: "quantityDetails")
  QuantityDetails quantityDetails;

  Items(
      {required this.item,
      required this.catalogSlide,
      required this.terms,
      required this.quantity,
      required this.quantityDetails});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class SingleLineItem {
  @JsonKey(name: "item")
  LineItem item;
  @JsonKey(name: "catalogSlide")
  CatalogSlide catalogSlide;
  @JsonKey(name: "terms")
  Terms terms;
  @JsonKey(name: "quantity")
  int quantity;
  @JsonKey(name: "quantityDetails")
  QuantityDetails quantityDetails;

  SingleLineItem(
      {required this.item,
      required this.catalogSlide,
      required this.terms,
      required this.quantity,
      required this.quantityDetails});
  factory SingleLineItem.fromJson(Map<String, dynamic> json) =>
      _$SingleLineItemFromJson(json);

  Map<String, dynamic> toJson() => _$SingleLineItemToJson(this);
}

@JsonSerializable()
class LineItem {
  @JsonKey(name: "id")
  Id id;
  @JsonKey(name: "href")
  String href;

  LineItem({required this.id, required this.href});

  factory LineItem.fromJson(Map<String, dynamic> json) =>
      _$LineItemFromJson(json);

  Map<String, dynamic> toJson() => _$LineItemToJson(this);
}

@JsonSerializable()
class IdString {
  @JsonKey(name: "unicity")
  String unicity;

  IdString({required this.unicity});

  factory IdString.fromJson(Map<String, dynamic> json) =>
      _$IdStringFromJson(json);

  Map<String, dynamic> toJson() => _$IdStringToJson(this);
}

@JsonSerializable()
class CatalogSlide {
  @JsonKey(name: "content")
  Content content;

  CatalogSlide({required this.content});

  factory CatalogSlide.fromJson(Map<String, dynamic> json) =>
      _$CatalogSlideFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogSlideToJson(this);
}

@JsonSerializable()
class Content {
  @JsonKey(name: "description")
  String description;

  Content({required this.description});

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@JsonSerializable()
class Terms {
  @JsonKey(name: "priceEach")
  int priceEach;
  @JsonKey(name: "pvEach")
  int pvEach;
  @JsonKey(name: "taxablePriceEach")
  double taxablePriceEach;
  @JsonKey(name: "tax")
  Tax tax;

  Terms(
      {required this.priceEach,
      required this.pvEach,
      required this.taxablePriceEach,
      required this.tax});

  factory Terms.fromJson(Map<String, dynamic> json) => _$TermsFromJson(json);

  Map<String, dynamic> toJson() => _$TermsToJson(this);
}

@JsonSerializable()
class Tax {
  @JsonKey(name: "aggregate")
  Aggregate aggregate;
  @JsonKey(name: "amount")
  double amount;
  @JsonKey(name: "percentage")
  int percentage;

  Tax(
      {required this.aggregate,
      required this.amount,
      required this.percentage});
  factory Tax.fromJson(Map<String, dynamic> json) => _$TaxFromJson(json);

  Map<String, dynamic> toJson() => _$TaxToJson(this);
}

@JsonSerializable()
class Aggregate {
  @JsonKey(name: "amount")
  double amount;

  Aggregate({required this.amount});

  factory Aggregate.fromJson(Map<String, dynamic> json) =>
      _$AggregateFromJson(json);

  Map<String, dynamic> toJson() => _$AggregateToJson(this);
}

@JsonSerializable()
class QuantityDetails {
  @JsonKey(name: "quantityBackordered")
  int quantityBackordered;

  QuantityDetails({required this.quantityBackordered});

  factory QuantityDetails.fromJson(Map<String, dynamic> json) =>
      _$QuantityDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$QuantityDetailsToJson(this);
}
