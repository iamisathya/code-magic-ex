// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_response_dsc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarcodeResponseDsc _$BarcodeResponseDscFromJson(Map<String, dynamic> json) =>
    BarcodeResponseDsc(
      href: json['href'] as String,
      userProfile: UserProfile.fromJson(json['items'] as Map<String, dynamic>),
      token: json['token'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$BarcodeResponseDscToJson(BarcodeResponseDsc instance) =>
    <String, dynamic>{
      'items': instance.userProfile,
      'token': instance.token,
      'href': instance.href,
      'url': instance.url,
    };

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      terms: Terms.fromJson(json['terms'] as Map<String, dynamic>),
      transactions:
          Transactions.fromJson(json['transactions'] as Map<String, dynamic>),
      creator: Creator.fromJson(json['creator'] as Map<String, dynamic>),
      currency: json['currency'] as String,
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
      fulfillmentStatus: json['fulfillmentStatus'] as String,
      invoice: Invoice.fromJson(json['invoice'] as Map<String, dynamic>),
      lines: Lines.fromJson(json['lines'] as Map<String, dynamic>),
      market: json['market'] as String,
      dateCreated: json['dateCreated'] as String,
      id: LabelId.fromJson(json['id'] as Map<String, dynamic>),
      notes: json['notes'] as String,
      paymentStatus: json['paymentStatus'] as String,
      shipToAddress:
          ShipToAddress.fromJson(json['shipToAddress'] as Map<String, dynamic>),
      shipToEmail: json['shipToEmail'] as String?,
      shippingMethod: ShippingMethod.fromJson(
          json['shippingMethod'] as Map<String, dynamic>),
      shipToName:
          ShipToName.fromJson(json['shipToName'] as Map<String, dynamic>),
      shipToPhone: json['shipToPhone'] as String?,
      source: json['source'],
      href: json['href'] as String,
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'creator': instance.creator,
      'currency': instance.currency,
      'customer': instance.customer,
      'dateCreated': instance.dateCreated,
      'fulfillmentStatus': instance.fulfillmentStatus,
      'href': instance.href,
      'id': instance.id,
      'invoice': instance.invoice,
      'lines': instance.lines,
      'market': instance.market,
      'notes': instance.notes,
      'paymentStatus': instance.paymentStatus,
      'shipToAddress': instance.shipToAddress,
      'shipToEmail': instance.shipToEmail,
      'shipToName': instance.shipToName,
      'shipToPhone': instance.shipToPhone,
      'shippingMethod': instance.shippingMethod,
      'source': instance.source,
      'terms': instance.terms,
      'transactions': instance.transactions,
    };

Creator _$CreatorFromJson(Map<String, dynamic> json) => Creator(
      humanName: BillToName.fromJson(json['humanName'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreatorToJson(Creator instance) => <String, dynamic>{
      'humanName': instance.humanName,
    };

BillToName _$BillToNameFromJson(Map<String, dynamic> json) => BillToName(
      fullName: json['fullName'] as String,
    );

Map<String, dynamic> _$BillToNameToJson(BillToName instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: Id.fromJson(json['id'] as Map<String, dynamic>),
      taxTerms: TaxTerms.fromJson(json['taxTerms'] as Map<String, dynamic>),
      href: json['href'] as String,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'taxTerms': instance.taxTerms,
      'href': instance.href,
    };

Id _$IdFromJson(Map<String, dynamic> json) => Id(
      unicity: json['unicity'] as String,
    );

Map<String, dynamic> _$IdToJson(Id instance) => <String, dynamic>{
      'unicity': instance.unicity,
    };

TaxTerms _$TaxTermsFromJson(Map<String, dynamic> json) => TaxTerms(
      taxId: json['taxId'] as String,
    );

Map<String, dynamic> _$TaxTermsToJson(TaxTerms instance) => <String, dynamic>{
      'taxId': instance.taxId,
    };

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      id: Id.fromJson(json['id'] as Map<String, dynamic>),
      href: json['href'] as String,
    );

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'id': instance.id,
      'href': instance.href,
    };

LabelId _$LabelIdFromJson(Map<String, dynamic> json) => LabelId(
      unicity: json['unicity'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$LabelIdToJson(LabelId instance) => <String, dynamic>{
      'unicity': instance.unicity,
      'label': instance.label,
    };

Lines _$LinesFromJson(Map<String, dynamic> json) => Lines(
      items: (json['items'] as List<dynamic>)
          .map((e) => ProductItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LinesToJson(Lines instance) => <String, dynamic>{
      'items': instance.items,
    };

ProductItems _$ProductItemsFromJson(Map<String, dynamic> json) => ProductItems(
      item: Invoice.fromJson(json['item'] as Map<String, dynamic>),
      catalogSlide:
          CatalogSlide.fromJson(json['catalogSlide'] as Map<String, dynamic>),
      terms: ProductTerms.fromJson(json['terms'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      quantityDetails: QuantityDetails.fromJson(
          json['quantityDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductItemsToJson(ProductItems instance) =>
    <String, dynamic>{
      'item': instance.item,
      'catalogSlide': instance.catalogSlide,
      'terms': instance.terms,
      'quantity': instance.quantity,
      'quantityDetails': instance.quantityDetails,
    };

CatalogSlide _$CatalogSlideFromJson(Map<String, dynamic> json) => CatalogSlide(
      content: Content.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CatalogSlideToJson(CatalogSlide instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      description: json['description'] as String,
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'description': instance.description,
    };

ProductTerms _$ProductTermsFromJson(Map<String, dynamic> json) => ProductTerms(
      priceEach: json['priceEach'] as int,
      pvEach: json['pvEach'] as int,
      taxablePriceEach: (json['taxablePriceEach'] as num).toDouble(),
      tax: ProductTax.fromJson(json['tax'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductTermsToJson(ProductTerms instance) =>
    <String, dynamic>{
      'priceEach': instance.priceEach,
      'pvEach': instance.pvEach,
      'taxablePriceEach': instance.taxablePriceEach,
      'tax': instance.tax,
    };

ProductTax _$ProductTaxFromJson(Map<String, dynamic> json) => ProductTax(
      aggregate: Aggregate.fromJson(json['aggregate'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toDouble(),
      percentage: json['percentage'] as int,
    );

Map<String, dynamic> _$ProductTaxToJson(ProductTax instance) =>
    <String, dynamic>{
      'aggregate': instance.aggregate,
      'amount': instance.amount,
      'percentage': instance.percentage,
    };

Aggregate _$AggregateFromJson(Map<String, dynamic> json) => Aggregate(
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$AggregateToJson(Aggregate instance) => <String, dynamic>{
      'amount': instance.amount,
    };

ShipToAddress _$ShipToAddressFromJson(Map<String, dynamic> json) =>
    ShipToAddress(
      address1: json['address1'] as String,
      address2: json['address2'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zip: json['zip'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$ShipToAddressToJson(ShipToAddress instance) =>
    <String, dynamic>{
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'state': instance.state,
      'zip': instance.zip,
      'country': instance.country,
    };

ShipToName _$ShipToNameFromJson(Map<String, dynamic> json) => ShipToName(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String,
      fullName: json['fullName'] as String,
      fullNameTh: json['fullName@th'] as String?,
      fullNameAr: json['fullName@ar'] as String?,
    );

Map<String, dynamic> _$ShipToNameToJson(ShipToName instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'fullName@th': instance.fullNameTh,
      'fullName@ar': instance.fullNameAr,
    };

ShippingMethod _$ShippingMethodFromJson(Map<String, dynamic> json) =>
    ShippingMethod(
      type: json['type'] as String,
      location: json['location'] as String?,
      href: json['href'] as String?,
    );

Map<String, dynamic> _$ShippingMethodToJson(ShippingMethod instance) =>
    <String, dynamic>{
      'type': instance.type,
      'location': instance.location,
      'href': instance.href,
    };

Terms _$TermsFromJson(Map<String, dynamic> json) => Terms(
      discount: Discount.fromJson(json['discount'] as Map<String, dynamic>),
      period: json['period'] as String,
      pretotal: json['pretotal'] as int,
      tax: TaxRate.fromJson(json['tax'] as Map<String, dynamic>),
      freight: Discount.fromJson(json['freight'] as Map<String, dynamic>),
      subtotal: json['subtotal'] as int,
      taxableTotal: (json['taxableTotal'] as num).toDouble(),
      total: json['total'] as int,
      pv: json['pv'] as int,
    );

Map<String, dynamic> _$TermsToJson(Terms instance) => <String, dynamic>{
      'discount': instance.discount,
      'period': instance.period,
      'pretotal': instance.pretotal,
      'tax': instance.tax,
      'freight': instance.freight,
      'subtotal': instance.subtotal,
      'taxableTotal': instance.taxableTotal,
      'total': instance.total,
      'pv': instance.pv,
    };

Transactions _$TransactionsFromJson(Map<String, dynamic> json) => Transactions(
      items: (json['items'] as List<dynamic>)
          .map((e) => TransactionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      aggregate: Aggregate.fromJson(json['aggregate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionsToJson(Transactions instance) =>
    <String, dynamic>{
      'items': instance.items,
      'aggregate': instance.aggregate,
    };

TransactionItem _$TransactionItemFromJson(Map<String, dynamic> json) =>
    TransactionItem(
      billToAddress:
          BillToAddress.fromJson(json['billToAddress'] as Map<String, dynamic>),
      billToName:
          BillToName.fromJson(json['billToName'] as Map<String, dynamic>),
      billToPhone: json['billToPhone'] as String?,
      methodDetails: json['methodDetails'] == null
          ? null
          : MethodDetails.fromJson(
              json['methodDetails'] as Map<String, dynamic>),
      amount: json['amount'] as int?,
      authorization: json['authorization'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$TransactionItemToJson(TransactionItem instance) =>
    <String, dynamic>{
      'billToAddress': instance.billToAddress,
      'billToName': instance.billToName,
      'billToPhone': instance.billToPhone,
      'methodDetails': instance.methodDetails,
      'amount': instance.amount,
      'authorization': instance.authorization,
      'type': instance.type,
    };

Discount _$DiscountFromJson(Map<String, dynamic> json) => Discount(
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$DiscountToJson(Discount instance) => <String, dynamic>{
      'amount': instance.amount,
    };

BillToAddress _$BillToAddressFromJson(Map<String, dynamic> json) =>
    BillToAddress(
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      city: json['city'] as String?,
      zip: json['zip'] as String?,
      country: json['country'] as String,
    );

Map<String, dynamic> _$BillToAddressToJson(BillToAddress instance) =>
    <String, dynamic>{
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'zip': instance.zip,
      'country': instance.country,
    };

MethodDetails _$MethodDetailsFromJson(Map<String, dynamic> json) =>
    MethodDetails(
      payer: json['payer'] as String,
    );

Map<String, dynamic> _$MethodDetailsToJson(MethodDetails instance) =>
    <String, dynamic>{
      'payer': instance.payer,
    };

QuantityDetails _$QuantityDetailsFromJson(Map<String, dynamic> json) =>
    QuantityDetails(
      quantityBackordered: json['quantityBackordered'] as int,
    );

Map<String, dynamic> _$QuantityDetailsToJson(QuantityDetails instance) =>
    <String, dynamic>{
      'quantityBackordered': instance.quantityBackordered,
    };

TaxRate _$TaxRateFromJson(Map<String, dynamic> json) => TaxRate(
      amount: (json['amount'] as num).toDouble(),
      percentage: json['percentage'] as int,
    );

Map<String, dynamic> _$TaxRateToJson(TaxRate instance) => <String, dynamic>{
      'amount': instance.amount,
      'percentage': instance.percentage,
    };
