import 'package:json_annotation/json_annotation.dart';

import 'package:code_magic_ex/models/common_methods.dart';

part 'inventory_records.g.dart';

@JsonSerializable()
class InventoryRecords {
  @JsonKey(name: "catalogSlide")
  CatalogSlideContent catalogSlideContent;
  @JsonKey(name: "item")
  CustomerData item;
  @JsonKey(name: "quantityOnHand")
  String quantityOnHand;
  @JsonKey(name: "Terms")
  Terms terms;

  InventoryRecords({
    required this.item,
    required this.catalogSlideContent,
    required this.quantityOnHand,
    required this.terms,
  });

  factory InventoryRecords.fromJson(Map<String, dynamic> json) =>
      _$InventoryRecordsFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryRecordsToJson(this);
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
  @JsonKey(name: "priceEach")
  int priceEach;
  @JsonKey(name: "pvEach")
  int pvEach;

  Terms({
    required this.pvEach,
    required this.priceEach,
  });

  factory Terms.fromJson(Map<String, dynamic> json) => _$TermsFromJson(json);

  Map<String, dynamic> toJson() => _$TermsToJson(this);
}
