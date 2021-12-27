// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_records.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryRecords _$InventoryRecordsFromJson(Map<String, dynamic> json) {
  return InventoryRecords(
    items: (json['items'] as List<dynamic>)
        .map((e) => InventoryRecordItems.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$InventoryRecordsToJson(InventoryRecords instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

InventoryRecordItems _$InventoryRecordItemsFromJson(Map<String, dynamic> json) {
  return InventoryRecordItems(
    catalogSlideContent: CatalogSlideContent.fromJson(
        json['catalogSlide'] as Map<String, dynamic>),
    item: CustomerData.fromJson(json['item'] as Map<String, dynamic>),
    quantityOnHand: json['quantityOnHand'] as String,
    terms: Terms.fromJson(json['terms'] as Map<String, dynamic>),
    imageUrl: json['imageUrl'] as String?,
  );
}

Map<String, dynamic> _$InventoryRecordItemsToJson(
        InventoryRecordItems instance) =>
    <String, dynamic>{
      'catalogSlide': instance.catalogSlideContent,
      'item': instance.item,
      'quantityOnHand': instance.quantityOnHand,
      'terms': instance.terms,
      'imageUrl': instance.imageUrl,
    };

ItemName _$ItemNameFromJson(Map<String, dynamic> json) {
  return ItemName(
    english: json['english'] as String?,
    native: json['native'] as String?,
  );
}

Map<String, dynamic> _$ItemNameToJson(ItemName instance) => <String, dynamic>{
      'english': instance.english,
      'native': instance.native,
    };

CustomerData _$CustomerDataFromJson(Map<String, dynamic> json) {
  return CustomerData(
    href: json['href'] as String,
    id: CommonIdTypeString.fromJson(json['id'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CustomerDataToJson(CustomerData instance) =>
    <String, dynamic>{
      'href': instance.href,
      'id': instance.id,
    };

CatalogSlideContent _$CatalogSlideContentFromJson(Map<String, dynamic> json) {
  return CatalogSlideContent(
    content:
        ContentDescription.fromJson(json['content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CatalogSlideContentToJson(
        CatalogSlideContent instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

ContentDescription _$ContentDescriptionFromJson(Map<String, dynamic> json) {
  return ContentDescription(
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$ContentDescriptionToJson(ContentDescription instance) =>
    <String, dynamic>{
      'description': instance.description,
    };

Terms _$TermsFromJson(Map<String, dynamic> json) {
  return Terms(
    pvEach: json['pvEach'] as int,
    priceEach: (json['priceEach'] as num).toDouble(),
  );
}

Map<String, dynamic> _$TermsToJson(Terms instance) => <String, dynamic>{
      'priceEach': instance.priceEach,
      'pvEach': instance.pvEach,
    };

Tooltip _$TooltipFromJson(Map<String, dynamic> json) {
  return Tooltip(
    enable: json['enable'] as bool?,
    content: json['content'] == null
        ? null
        : ItemName.fromJson(json['content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TooltipToJson(Tooltip instance) => <String, dynamic>{
      'enable': instance.enable,
      'content': instance.content,
    };
