// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enroll_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrollForm _$EnrollFormFromJson(Map<String, dynamic> json) {
  return EnrollForm(
    market: json['market'] as String,
    notes: json['notes'] as String,
    shippingMethod:
        ShippingMethod.fromJson(json['shippingMethod'] as Map<String, dynamic>),
    shipToAddress:
        ShipToAddress.fromJson(json['shipToAddress'] as Map<String, dynamic>),
    shipToEmail: json['shipToEmail'] as String,
    shipToName: ShipToName.fromJson(json['shipToName'] as Map<String, dynamic>),
    shipToPhone: json['shipToPhone'] as String,
    shipToTime: json['shipToTime'],
    source: Source.fromJson(json['source'] as Map<String, dynamic>),
    type: json['type'],
    customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
    lines: ProductLines.fromJson(json['lines'] as Map<String, dynamic>),
    transactions:
        Transactions.fromJson(json['transactions'] as Map<String, dynamic>),
    terms: Terms.fromJson(json['terms'] as Map<String, dynamic>),
    dateCreated: json['dateCreated'] as String,
    currency: json['currency'] as String,
    giftReceipt: json['giftReceipt'] as bool,
    taxedAs: json['taxedAs'] as String,
    addedLines:
        AddedLineItems.fromJson(json['added_lines'] as Map<String, dynamic>),
    id: IdTypeString.fromJson(json['id'] as Map<String, dynamic>),
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$EnrollFormToJson(EnrollForm instance) =>
    <String, dynamic>{
      'market': instance.market,
      'notes': instance.notes,
      'shippingMethod': instance.shippingMethod,
      'shipToAddress': instance.shipToAddress,
      'shipToEmail': instance.shipToEmail,
      'shipToName': instance.shipToName,
      'shipToPhone': instance.shipToPhone,
      'shipToTime': instance.shipToTime,
      'source': instance.source,
      'type': instance.type,
      'lines': instance.lines,
      'transactions': instance.transactions,
      'customer': instance.customer,
      'terms': instance.terms,
      'dateCreated': instance.dateCreated,
      'currency': instance.currency,
      'giftReceipt': instance.giftReceipt,
      'taxedAs': instance.taxedAs,
      'added_lines': instance.addedLines,
      'id': instance.id,
      'href': instance.href,
    };

ShippingMethod _$ShippingMethodFromJson(Map<String, dynamic> json) {
  return ShippingMethod(
    type: json['type'] as String,
    warehouseUUID: json['warehouseUUID'] as String,
    location: json['location'] as String,
  );
}

Map<String, dynamic> _$ShippingMethodToJson(ShippingMethod instance) =>
    <String, dynamic>{
      'type': instance.type,
      'warehouseUUID': instance.warehouseUUID,
      'location': instance.location,
    };

ShipToAddress _$ShipToAddressFromJson(Map<String, dynamic> json) {
  return ShipToAddress(
    country: json['country'] as String,
    state: json['state'] as String,
    city: json['city'] as String,
    zip: json['zip'] as String,
    address1: json['address1'] as String,
    address2: json['address2'] as String,
  );
}

Map<String, dynamic> _$ShipToAddressToJson(ShipToAddress instance) =>
    <String, dynamic>{
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'zip': instance.zip,
      'address1': instance.address1,
      'address2': instance.address2,
    };

ShipToName _$ShipToNameFromJson(Map<String, dynamic> json) {
  return ShipToName(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
  );
}

Map<String, dynamic> _$ShipToNameToJson(ShipToName instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    mainAddress:
        ShipToAddress.fromJson(json['mainAddress'] as Map<String, dynamic>),
    humanName:
        HumanNameFull.fromJson(json['humanName'] as Map<String, dynamic>),
    enroller: Enroller.fromJson(json['enroller'] as Map<String, dynamic>),
    sponsor: Enroller.fromJson(json['sponsor'] as Map<String, dynamic>),
    birthDate: json['birthDate'] as String,
    maritalStatus: json['maritalStatus'] as String,
    email: json['email'] as String,
    taxTerms: TaxTerms.fromJson(json['taxTerms'] as Map<String, dynamic>),
    homePhone: json['homePhone'] as String,
    mobilePhone: json['mobilePhone'] as String,
    entryPeriod: json['entryPeriod'] as String,
    gender: json['gender'] as String,
    password: Password.fromJson(json['password'] as Map<String, dynamic>),
    type: json['type'] as String,
    source: Source.fromJson(json['source'] as Map<String, dynamic>),
    businessEntity:
        BusinessEntity.fromJson(json['businessEntity'] as Map<String, dynamic>),
    status: json['status'] as String,
    id: IdTypeString.fromJson(json['id'] as Map<String, dynamic>),
    href: json['href'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'mainAddress': instance.mainAddress,
      'humanName': instance.humanName,
      'enroller': instance.enroller,
      'sponsor': instance.sponsor,
      'birthDate': instance.birthDate,
      'maritalStatus': instance.maritalStatus,
      'email': instance.email,
      'taxTerms': instance.taxTerms,
      'homePhone': instance.homePhone,
      'mobilePhone': instance.mobilePhone,
      'entryPeriod': instance.entryPeriod,
      'gender': instance.gender,
      'password': instance.password,
      'type': instance.type,
      'source': instance.source,
      'businessEntity': instance.businessEntity,
      'status': instance.status,
      'id': instance.id,
      'href': instance.href,
      'token': instance.token,
    };

TaxTerms _$TaxTermsFromJson(Map<String, dynamic> json) {
  return TaxTerms(
    taxId: json['taxId'] as String,
  );
}

Map<String, dynamic> _$TaxTermsToJson(TaxTerms instance) => <String, dynamic>{
      'taxId': instance.taxId,
    };

Enroller _$EnrollerFromJson(Map<String, dynamic> json) {
  return Enroller(
    href: json['href'] as String,
    id: Id.fromJson(json['id'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EnrollerToJson(Enroller instance) => <String, dynamic>{
      'href': instance.href,
      'id': instance.id,
    };

Password _$PasswordFromJson(Map<String, dynamic> json) {
  return Password(
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$PasswordToJson(Password instance) => <String, dynamic>{
      'value': instance.value,
    };

Tax _$TaxFromJson(Map<String, dynamic> json) {
  return Tax(
    amount: (json['amount'] as num).toDouble(),
  );
}

Map<String, dynamic> _$TaxToJson(Tax instance) => <String, dynamic>{
      'amount': instance.amount,
    };

BusinessEntity _$BusinessEntityFromJson(Map<String, dynamic> json) {
  return BusinessEntity(
    legalType: json['legalType'] as String,
  );
}

Map<String, dynamic> _$BusinessEntityToJson(BusinessEntity instance) =>
    <String, dynamic>{
      'legalType': instance.legalType,
    };

Sponsor _$SponsorFromJson(Map<String, dynamic> json) {
  return Sponsor(
    href: json['href'] as String,
    id: Id.fromJson(json['id'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SponsorToJson(Sponsor instance) => <String, dynamic>{
      'href': instance.href,
      'id': instance.id,
    };

Id _$IdFromJson(Map<String, dynamic> json) {
  return Id(
    unicity: json['unicity'] as int,
  );
}

Map<String, dynamic> _$IdToJson(Id instance) => <String, dynamic>{
      'unicity': instance.unicity,
    };

HumanName _$HumanNameFromJson(Map<String, dynamic> json) {
  return HumanName(
    fullName: json['fullName'] as String,
  );
}

Map<String, dynamic> _$HumanNameToJson(HumanName instance) => <String, dynamic>{
      'fullName': instance.fullName,
    };

HumanNameFull _$HumanNameFullFromJson(Map<String, dynamic> json) {
  return HumanNameFull(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    firstNameTh: json['firstName@th'] as String,
    lastNameTh: json['lastName@th'] as String,
  );
}

Map<String, dynamic> _$HumanNameFullToJson(HumanNameFull instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'firstName@th': instance.firstNameTh,
      'lastName@th': instance.lastNameTh,
    };

IdTypeString _$IdTypeStringFromJson(Map<String, dynamic> json) {
  return IdTypeString(
    unicity: json['unicity'] as String,
  );
}

Map<String, dynamic> _$IdTypeStringToJson(IdTypeString instance) =>
    <String, dynamic>{
      'unicity': instance.unicity,
    };

Terms _$TermsFromJson(Map<String, dynamic> json) {
  return Terms(
    discount: Discount.fromJson(json['discount'] as Map<String, dynamic>),
    freight: Discount.fromJson(json['freight'] as Map<String, dynamic>),
    pv: json['pv'] as int,
    subtotal: json['subtotal'] as int,
    tax: Tax.fromJson(json['tax'] as Map<String, dynamic>),
    taxableTotal: (json['taxableTotal'] as num).toDouble(),
    total: json['total'] as int,
    discountDisplay:
        Discount.fromJson(json['discountDisplay'] as Map<String, dynamic>),
    period: json['period'] as String,
    weight: (json['weight'] as num).toDouble(),
  );
}

Map<String, dynamic> _$TermsToJson(Terms instance) => <String, dynamic>{
      'discount': instance.discount,
      'freight': instance.freight,
      'pv': instance.pv,
      'subtotal': instance.subtotal,
      'tax': instance.tax,
      'taxableTotal': instance.taxableTotal,
      'total': instance.total,
      'discountDisplay': instance.discountDisplay,
      'period': instance.period,
      'weight': instance.weight,
    };

Discount _$DiscountFromJson(Map<String, dynamic> json) {
  return Discount(
    amount: json['amount'] as int,
  );
}

Map<String, dynamic> _$DiscountToJson(Discount instance) => <String, dynamic>{
      'amount': instance.amount,
    };

Aggregate _$AggregateFromJson(Map<String, dynamic> json) {
  return Aggregate(
    aggregate: Discount.fromJson(json['aggregate'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AggregateToJson(Aggregate instance) => <String, dynamic>{
      'aggregate': instance.aggregate,
    };

Transactions _$TransactionsFromJson(Map<String, dynamic> json) {
  return Transactions(
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => TransactionItems.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TransactionsToJson(Transactions instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

TransactionItems _$TransactionItemsFromJson(Map<String, dynamic> json) {
  return TransactionItems(
    amount: json['amount'] as int,
    authorization: json['authorization'] as String,
    method: json['method'] as String,
    type: json['type'] as String,
    index: json['index'] as int,
  );
}

Map<String, dynamic> _$TransactionItemsToJson(TransactionItems instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'authorization': instance.authorization,
      'method': instance.method,
      'type': instance.type,
      'index': instance.index,
    };

Freight _$FreightFromJson(Map<String, dynamic> json) {
  return Freight(
    amount: json['amount'] as int,
  );
}

Map<String, dynamic> _$FreightToJson(Freight instance) => <String, dynamic>{
      'amount': instance.amount,
    };

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
    agent: json['agent'] as String,
    campaign: json['campaign'],
    medium: json['medium'] as String,
    platform: json['platform'] as String,
    referrer: json['referrer'],
    version: json['version'],
  );
}

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'agent': instance.agent,
      'campaign': instance.campaign,
      'medium': instance.medium,
      'platform': instance.platform,
      'referrer': instance.referrer,
      'version': instance.version,
    };

TaxAmount _$TaxAmountFromJson(Map<String, dynamic> json) {
  return TaxAmount(
    amount: (json['amount'] as num).toDouble(),
  );
}

Map<String, dynamic> _$TaxAmountToJson(TaxAmount instance) => <String, dynamic>{
      'amount': instance.amount,
    };

MainTerms _$MainTermsFromJson(Map<String, dynamic> json) {
  return MainTerms(
    discount: Discount.fromJson(json['discount'] as Map<String, dynamic>),
    freight: Freight.fromJson(json['freight'] as Map<String, dynamic>),
    pv: json['pv'] as int,
    subtotal: json['subtotal'] as int,
    tax: TaxAmount.fromJson(json['tax'] as Map<String, dynamic>),
    taxableTotal: (json['taxableTotal'] as num).toDouble(),
    total: json['total'] as int,
    discountDisplay:
        Discount.fromJson(json['discountDisplay'] as Map<String, dynamic>),
    weight: (json['weight'] as num).toDouble(),
  );
}

Map<String, dynamic> _$MainTermsToJson(MainTerms instance) => <String, dynamic>{
      'discount': instance.discount,
      'freight': instance.freight,
      'pv': instance.pv,
      'subtotal': instance.subtotal,
      'tax': instance.tax,
      'taxableTotal': instance.taxableTotal,
      'total': instance.total,
      'discountDisplay': instance.discountDisplay,
      'weight': instance.weight,
    };

ProductLines _$ProductLinesFromJson(Map<String, dynamic> json) {
  return ProductLines(
    items: (json['items'] as List<dynamic>)
        .map((e) => ProductLineItems.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ProductLinesToJson(ProductLines instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

ProductLineItems _$ProductLineItemsFromJson(Map<String, dynamic> json) {
  return ProductLineItems(
    item: ProductItemBaseInfo.fromJson(json['item'] as Map<String, dynamic>),
    quantity: json['quantity'] as int,
  );
}

Map<String, dynamic> _$ProductLineItemsToJson(ProductLineItems instance) =>
    <String, dynamic>{
      'item': instance.item,
      'quantity': instance.quantity,
    };

ProductItemBaseInfo _$ProductItemBaseInfoFromJson(Map<String, dynamic> json) {
  return ProductItemBaseInfo(
    href: json['href'] as String,
    id: IdTypeString.fromJson(json['id'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProductItemBaseInfoToJson(
        ProductItemBaseInfo instance) =>
    <String, dynamic>{
      'href': instance.href,
      'id': instance.id,
    };

ProductTerms _$ProductTermsFromJson(Map<String, dynamic> json) {
  return ProductTerms(
    priceEach: json['priceEach'] as int,
    subtotal: json['subtotal'] as int,
    discount: Discount.fromJson(json['discount'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProductTermsToJson(ProductTerms instance) =>
    <String, dynamic>{
      'priceEach': instance.priceEach,
      'subtotal': instance.subtotal,
      'discount': instance.discount,
    };

AddedLineItems _$AddedLineItemsFromJson(Map<String, dynamic> json) {
  return AddedLineItems(
    items: (json['items'] as List<dynamic>)
        .map((e) => AddedLineItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AddedLineItemsToJson(AddedLineItems instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

AddedLineItem _$AddedLineItemFromJson(Map<String, dynamic> json) {
  return AddedLineItem();
}

Map<String, dynamic> _$AddedLineItemToJson(AddedLineItem instance) =>
    <String, dynamic>{};
