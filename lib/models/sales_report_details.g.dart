// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_report_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesReportDetails _$SalesReportDetailsFromJson(Map<String, dynamic> json) {
  return SalesReportDetails(
    terms: TermsItem.fromJson(json['terms'] as Map<String, dynamic>),
    transactions:
        Transactions.fromJson(json['transactions'] as Map<String, dynamic>),
    creator:
        CommonHumanNameObject.fromJson(json['creator'] as Map<String, dynamic>),
    currency: json['currency'] as String,
    customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
    fulfillmentStatus: json['fulfillmentStatus'] as String,
    invoice: Invoice.fromJson(json['invoice'] as Map<String, dynamic>),
    market: json['market'] as String,
    dateCreated: json['dateCreated'] as String,
    id: Id.fromJson(json['id'] as Map<String, dynamic>),
    notes: json['notes'] as String,
    paymentStatus: json['paymentStatus'] as String,
    shipToAddress:
        ShipToAddress.fromJson(json['shipToAddress'] as Map<String, dynamic>),
    shipToEmail: json['shipToEmail'] as String,
    shippingMethod:
        ShippingMethod.fromJson(json['shippingMethod'] as Map<String, dynamic>),
    shipToName: ShipToName.fromJson(json['shipToName'] as Map<String, dynamic>),
    shipToPhone: json['shipToPhone'] as String,
    source: Source.fromJson(json['source'] as Map<String, dynamic>),
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$SalesReportDetailsToJson(SalesReportDetails instance) =>
    <String, dynamic>{
      'terms': instance.terms,
      'transactions': instance.transactions,
      'creator': instance.creator,
      'currency': instance.currency,
      'customer': instance.customer,
      'fulfillmentStatus': instance.fulfillmentStatus,
      'invoice': instance.invoice,
      'market': instance.market,
      'dateCreated': instance.dateCreated,
      'id': instance.id,
      'notes': instance.notes,
      'paymentStatus': instance.paymentStatus,
      'shipToAddress': instance.shipToAddress,
      'shipToEmail': instance.shipToEmail,
      'shippingMethod': instance.shippingMethod,
      'shipToName': instance.shipToName,
      'shipToPhone': instance.shipToPhone,
      'source': instance.source,
      'href': instance.href,
    };

TermsItem _$TermsItemFromJson(Map<String, dynamic> json) {
  return TermsItem(
    discount: Discount.fromJson(json['discount'] as Map<String, dynamic>),
    period: json['period'] as String,
    preTotal: json['pretotal'] as int,
    tax: TaxItem.fromJson(json['tax'] as Map<String, dynamic>),
    freight: Discount.fromJson(json['freight'] as Map<String, dynamic>),
    subTotal: json['subtotal'] as int,
    taxableTotal: (json['taxableTotal'] as num).toDouble(),
    total: json['total'] as int,
    pv: json['pv'] as int,
  );
}

Map<String, dynamic> _$TermsItemToJson(TermsItem instance) => <String, dynamic>{
      'discount': instance.discount,
      'period': instance.period,
      'pretotal': instance.preTotal,
      'tax': instance.tax,
      'freight': instance.freight,
      'subtotal': instance.subTotal,
      'taxableTotal': instance.taxableTotal,
      'total': instance.total,
      'pv': instance.pv,
    };

Discount _$DiscountFromJson(Map<String, dynamic> json) {
  return Discount(
    amount: json['amount'] as int,
  );
}

Map<String, dynamic> _$DiscountToJson(Discount instance) => <String, dynamic>{
      'amount': instance.amount,
    };

TaxItem _$TaxItemFromJson(Map<String, dynamic> json) {
  return TaxItem(
    amount: (json['amount'] as num).toDouble(),
    percentage: json['percentage'] as int,
  );
}

Map<String, dynamic> _$TaxItemToJson(TaxItem instance) => <String, dynamic>{
      'amount': instance.amount,
      'percentage': instance.percentage,
    };

Transactions _$TransactionsFromJson(Map<String, dynamic> json) {
  return Transactions(
    items: (json['items'] as List<dynamic>)
        .map((e) => TransactionItems.fromJson(e as Map<String, dynamic>))
        .toList(),
    aggregate: Discount.fromJson(json['aggregate'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TransactionsToJson(Transactions instance) =>
    <String, dynamic>{
      'items': instance.items,
      'aggregate': instance.aggregate,
    };

TransactionItems _$TransactionItemsFromJson(Map<String, dynamic> json) {
  return TransactionItems(
    billToAddress:
        BillToAddress.fromJson(json['billToAddress'] as Map<String, dynamic>),
    billToName: BillToName.fromJson(json['billToName'] as Map<String, dynamic>),
    billToPhone: json['billToPhone'] as String,
    methodDetails:
        MethodDetails.fromJson(json['methodDetails'] as Map<String, dynamic>),
    amount: json['amount'] as int,
    authorization: json['authorization'] as String,
    method: json['method'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$TransactionItemsToJson(TransactionItems instance) =>
    <String, dynamic>{
      'billToAddress': instance.billToAddress,
      'billToName': instance.billToName,
      'billToPhone': instance.billToPhone,
      'methodDetails': instance.methodDetails,
      'amount': instance.amount,
      'authorization': instance.authorization,
      'method': instance.method,
      'type': instance.type,
    };

BillToName _$BillToNameFromJson(Map<String, dynamic> json) {
  return BillToName(
    fullName: json['fullName'] as String,
  );
}

Map<String, dynamic> _$BillToNameToJson(BillToName instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
    };

FullName _$FullNameFromJson(Map<String, dynamic> json) {
  return FullName(
    fullName: json['fullName'] as String,
  );
}

Map<String, dynamic> _$FullNameToJson(FullName instance) => <String, dynamic>{
      'fullName': instance.fullName,
    };

MethodDetails _$MethodDetailsFromJson(Map<String, dynamic> json) {
  return MethodDetails(
    payer: json['payer'] as String,
    creditCardNumberMasked: json['creditCardNumberMasked'] as String,
    creditCardNetwork: json['creditCardNetwork'] as String,
  );
}

Map<String, dynamic> _$MethodDetailsToJson(MethodDetails instance) =>
    <String, dynamic>{
      'payer': instance.payer,
      'creditCardNumberMasked': instance.creditCardNumberMasked,
      'creditCardNetwork': instance.creditCardNetwork,
    };

BillToAddress _$BillToAddressFromJson(Map<String, dynamic> json) {
  return BillToAddress(
    address1: json['address1'] as String,
    address2: json['address2'] as String,
    city: json['city'] as String,
    zip: json['zip'] as String,
    country: json['country'] as String,
  );
}

Map<String, dynamic> _$BillToAddressToJson(BillToAddress instance) =>
    <String, dynamic>{
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'zip': instance.zip,
      'country': instance.country,
    };

ShipToAddress _$ShipToAddressFromJson(Map<String, dynamic> json) {
  return ShipToAddress(
    address1: json['address1'] as String,
    address2: json['address2'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    zip: json['zip'] as String,
    country: json['country'] as String,
  );
}

Map<String, dynamic> _$ShipToAddressToJson(ShipToAddress instance) =>
    <String, dynamic>{
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'state': instance.state,
      'zip': instance.zip,
      'country': instance.country,
    };

CommonHumanNameObject _$CommonHumanNameObjectFromJson(
    Map<String, dynamic> json) {
  return CommonHumanNameObject(
    humanName:
        CommonFullName.fromJson(json['humanName'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CommonHumanNameObjectToJson(
        CommonHumanNameObject instance) =>
    <String, dynamic>{
      'humanName': instance.humanName,
    };

CommonFullName _$CommonFullNameFromJson(Map<String, dynamic> json) {
  return CommonFullName(
    fullName: json['fullName'] as String,
  );
}

Map<String, dynamic> _$CommonFullNameToJson(CommonFullName instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    id: CommonIdTypeString.fromJson(json['id'] as Map<String, dynamic>),
    taxTerms: TaxTerms.fromJson(json['taxTerms'] as Map<String, dynamic>),
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'taxTerms': instance.taxTerms,
      'href': instance.href,
    };

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return Invoice(
    id: CommonIdTypeString.fromJson(json['id'] as Map<String, dynamic>),
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'id': instance.id,
      'href': instance.href,
    };

TaxTerms _$TaxTermsFromJson(Map<String, dynamic> json) {
  return TaxTerms(
    taxId: json['taxId'] as String,
  );
}

Map<String, dynamic> _$TaxTermsToJson(TaxTerms instance) => <String, dynamic>{
      'taxId': instance.taxId,
    };

CommonIdTypeString _$CommonIdTypeStringFromJson(Map<String, dynamic> json) {
  return CommonIdTypeString(
    unicity: json['unicity'] as String,
  );
}

Map<String, dynamic> _$CommonIdTypeStringToJson(CommonIdTypeString instance) =>
    <String, dynamic>{
      'unicity': instance.unicity,
    };

Id _$IdFromJson(Map<String, dynamic> json) {
  return Id(
    unicity: json['unicity'] as String,
    label: json['label'] as String,
  );
}

Map<String, dynamic> _$IdToJson(Id instance) => <String, dynamic>{
      'unicity': instance.unicity,
      'label': instance.label,
    };

ShippingMethod _$ShippingMethodFromJson(Map<String, dynamic> json) {
  return ShippingMethod(
    href: json['href'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$ShippingMethodToJson(ShippingMethod instance) =>
    <String, dynamic>{
      'href': instance.href,
      'type': instance.type,
    };

ShipToName _$ShipToNameFromJson(Map<String, dynamic> json) {
  return ShipToName(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    fullName: json['fullName'] as String,
  );
}

Map<String, dynamic> _$ShipToNameToJson(ShipToName instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
    };

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
    medium: json['medium'] as String,
  );
}

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'medium': instance.medium,
    };

Shipments _$ShipmentsFromJson(Map<String, dynamic> json) {
  return Shipments(
    items: (json['items'] as List<dynamic>)
        .map((e) => ShipmentItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ShipmentsToJson(Shipments instance) => <String, dynamic>{
      'items': instance.items,
    };

ShipmentItem _$ShipmentItemFromJson(Map<String, dynamic> json) {
  return ShipmentItem(
    trackingNumber: json['trackingNumber'] as String,
  );
}

Map<String, dynamic> _$ShipmentItemToJson(ShipmentItem instance) =>
    <String, dynamic>{
      'trackingNumber': instance.trackingNumber,
    };

Lines _$LinesFromJson(Map<String, dynamic> json) {
  return Lines(
    items: (json['items'] as List<dynamic>)
        .map((e) => Items.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LinesToJson(Lines instance) => <String, dynamic>{
      'items': instance.items,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
    item: LineItem.fromJson(json['item'] as Map<String, dynamic>),
    catalogSlide:
        CatalogSlide.fromJson(json['catalogSlide'] as Map<String, dynamic>),
    terms: Terms.fromJson(json['terms'] as Map<String, dynamic>),
    quantity: json['quantity'] as int,
    quantityDetails: QuantityDetails.fromJson(
        json['quantityDetails'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'item': instance.item,
      'catalogSlide': instance.catalogSlide,
      'terms': instance.terms,
      'quantity': instance.quantity,
      'quantityDetails': instance.quantityDetails,
    };

SingleLineItem _$SingleLineItemFromJson(Map<String, dynamic> json) {
  return SingleLineItem(
    item: LineItem.fromJson(json['item'] as Map<String, dynamic>),
    catalogSlide:
        CatalogSlide.fromJson(json['catalogSlide'] as Map<String, dynamic>),
    terms: Terms.fromJson(json['terms'] as Map<String, dynamic>),
    quantity: json['quantity'] as int,
    quantityDetails: QuantityDetails.fromJson(
        json['quantityDetails'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SingleLineItemToJson(SingleLineItem instance) =>
    <String, dynamic>{
      'item': instance.item,
      'catalogSlide': instance.catalogSlide,
      'terms': instance.terms,
      'quantity': instance.quantity,
      'quantityDetails': instance.quantityDetails,
    };

LineItem _$LineItemFromJson(Map<String, dynamic> json) {
  return LineItem(
    id: Id.fromJson(json['id'] as Map<String, dynamic>),
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$LineItemToJson(LineItem instance) => <String, dynamic>{
      'id': instance.id,
      'href': instance.href,
    };

IdString _$IdStringFromJson(Map<String, dynamic> json) {
  return IdString(
    unicity: json['unicity'] as String,
  );
}

Map<String, dynamic> _$IdStringToJson(IdString instance) => <String, dynamic>{
      'unicity': instance.unicity,
    };

CatalogSlide _$CatalogSlideFromJson(Map<String, dynamic> json) {
  return CatalogSlide(
    content: Content.fromJson(json['content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CatalogSlideToJson(CatalogSlide instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

Content _$ContentFromJson(Map<String, dynamic> json) {
  return Content(
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'description': instance.description,
    };

Terms _$TermsFromJson(Map<String, dynamic> json) {
  return Terms(
    priceEach: json['priceEach'] as int,
    pvEach: json['pvEach'] as int,
    taxablePriceEach: (json['taxablePriceEach'] as num).toDouble(),
    tax: Tax.fromJson(json['tax'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TermsToJson(Terms instance) => <String, dynamic>{
      'priceEach': instance.priceEach,
      'pvEach': instance.pvEach,
      'taxablePriceEach': instance.taxablePriceEach,
      'tax': instance.tax,
    };

Tax _$TaxFromJson(Map<String, dynamic> json) {
  return Tax(
    aggregate: Aggregate.fromJson(json['aggregate'] as Map<String, dynamic>),
    amount: (json['amount'] as num).toDouble(),
    percentage: json['percentage'] as int,
  );
}

Map<String, dynamic> _$TaxToJson(Tax instance) => <String, dynamic>{
      'aggregate': instance.aggregate,
      'amount': instance.amount,
      'percentage': instance.percentage,
    };

Aggregate _$AggregateFromJson(Map<String, dynamic> json) {
  return Aggregate(
    amount: (json['amount'] as num).toDouble(),
  );
}

Map<String, dynamic> _$AggregateToJson(Aggregate instance) => <String, dynamic>{
      'amount': instance.amount,
    };

QuantityDetails _$QuantityDetailsFromJson(Map<String, dynamic> json) {
  return QuantityDetails(
    quantityBackordered: json['quantityBackordered'] as int,
  );
}

Map<String, dynamic> _$QuantityDetailsToJson(QuantityDetails instance) =>
    <String, dynamic>{
      'quantityBackordered': instance.quantityBackordered,
    };
