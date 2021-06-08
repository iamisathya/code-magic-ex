// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_movement_records.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryMovementRecords _$InventoryMovementRecordsFromJson(
    Map<String, dynamic> json) {
  return InventoryMovementRecords(
    item: CustomerData.fromJson(json['item'] as Map<String, dynamic>),
    catalogSlide:
        CatalogSlide.fromJson(json['catalogSlide'] as Map<String, dynamic>),
    terms: Terms.fromJson(json['terms'] as Map<String, dynamic>),
    quantity: json['quantity'] as int,
  );
}

Map<String, dynamic> _$InventoryMovementRecordsToJson(
        InventoryMovementRecords instance) =>
    <String, dynamic>{
      'item': instance.item,
      'catalogSlide': instance.catalogSlide,
      'terms': instance.terms,
      'quantity': instance.quantity,
    };

CustomerData _$CustomerDataFromJson(Map<String, dynamic> json) {
  return CustomerData(
    href: json['href'] as String,
    id: CommonUserIdString.fromJson(json['id'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CustomerDataToJson(CustomerData instance) =>
    <String, dynamic>{
      'href': instance.href,
      'id': instance.id,
    };

CatalogSlide _$CatalogSlideFromJson(Map<String, dynamic> json) {
  return CatalogSlide(
    catalogSlide: CatalogSlideContent.fromJson(
        json['catalogSlide'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CatalogSlideToJson(CatalogSlide instance) =>
    <String, dynamic>{
      'catalogSlide': instance.catalogSlide,
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
  );
}

Map<String, dynamic> _$TermsToJson(Terms instance) => <String, dynamic>{
      'pvEach': instance.pvEach,
    };
