import 'package:json_annotation/json_annotation.dart';

import 'package:code_magic_ex/models/common_methods.dart';

part 'inventory_movement_records.g.dart';

@JsonSerializable()
class InventoryMovementRecords {
  @JsonKey(name: "item")
  CustomerData item;
  @JsonKey(name: "catalogSlide")
  CatalogSlide catalogSlide;
  @JsonKey(name: "terms")
  Terms terms;
  @JsonKey(name: "quantity")
  int quantity;

  InventoryMovementRecords({
    required this.item,
    required this.catalogSlide,
    required this.terms,
    required this.quantity,
  });


  factory InventoryMovementRecords.fromJson(Map<String, dynamic> json) =>
      _$InventoryMovementRecordsFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryMovementRecordsToJson(this);
}

@JsonSerializable()
class CustomerData {
  @JsonKey(name: "href")
  String href;
  @JsonKey(name: "id")
  CommonUserIdString id;
  
  CustomerData({
    required this.href,
    required this.id,
  });


  factory CustomerData.fromJson(Map<String, dynamic> json) =>
      _$CustomerDataFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDataToJson(this);
}

@JsonSerializable()
class CatalogSlide {
  @JsonKey(name: "catalogSlide")
  CatalogSlideContent catalogSlide;

  CatalogSlide({required this.catalogSlide});


  factory CatalogSlide.fromJson(Map<String, dynamic> json) =>
      _$CatalogSlideFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogSlideToJson(this);
}

@JsonSerializable()
class CatalogSlideContent {
  @JsonKey(name: "content")
  ContentDescription content;

  CatalogSlideContent({required this.content});


  factory CatalogSlideContent.fromJson(Map<String, dynamic> json) =>
      _$CatalogSlideContentFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogSlideContentToJson(this);
}

@JsonSerializable()
class ContentDescription {
  @JsonKey(name: "description")
  String description;

  ContentDescription({
    required this.description,
  });


  factory ContentDescription.fromJson(Map<String, dynamic> json) =>
      _$ContentDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$ContentDescriptionToJson(this);
}

@JsonSerializable()
class Terms {
  @JsonKey(name: "pvEach")
  int pvEach;

  Terms({
    required this.pvEach,
  });


  factory Terms.fromJson(Map<String, dynamic> json) =>
      _$TermsFromJson(json);

  Map<String, dynamic> toJson() => _$TermsToJson(this);
}
