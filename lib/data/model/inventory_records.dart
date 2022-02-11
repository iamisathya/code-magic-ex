import 'package:json_annotation/json_annotation.dart';

import 'common_methods.dart';

part 'inventory_records.g.dart';

@JsonSerializable()
class InventoryRecords {
  @JsonKey(name: "items")
  List<InventoryRecordItems> items;

  InventoryRecords({
    required this.items,
  });

  factory InventoryRecords.fromJson(Map<String, dynamic> json) =>
      _$InventoryRecordsFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryRecordsToJson(this);
}

@JsonSerializable()
class InventoryRecordItems {
  @JsonKey(name: "catalogSlide")
  CatalogSlideContent catalogSlideContent;
  @JsonKey(name: "item")
  CustomerData item;
  @JsonKey(name: "quantityOnHand")
  String quantityOnHand;
  @JsonKey(name: "terms")
  Terms terms;
  // ItemName? itemName;
  // ItemName? itemInfoLinkUrl;
  String? imageUrl;
  // Tooltip? tooltip;

  InventoryRecordItems({
    required this.catalogSlideContent,
    required this.item,
    required this.quantityOnHand,
    required this.terms,
    // this.itemName,
    // this.itemInfoLinkUrl,
    this.imageUrl = "",
    // this.tooltip,
  });

  factory InventoryRecordItems.fromJson(Map<String, dynamic> json) =>
      _$InventoryRecordItemsFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryRecordItemsToJson(this);
}

@JsonSerializable()
class ItemName {
  @JsonKey(name: "english")
  String? english;
  @JsonKey(name: "native")
  String? native;

  ItemName({this.english = "", this.native = ""});

  factory ItemName.fromJson(Map<String, dynamic> json) =>
      _$ItemNameFromJson(json);

  Map<String, dynamic> toJson() => _$ItemNameToJson(this);
}

@JsonSerializable()
class CustomerData {
  @JsonKey(name: "href")
  String href;
  @JsonKey(name: "id")
  CommonIdTypeString id;

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
  double priceEach;
  @JsonKey(name: "pvEach")
  int pvEach;

  Terms({
    required this.pvEach,
    required this.priceEach,
  });

  factory Terms.fromJson(Map<String, dynamic> json) => _$TermsFromJson(json);

  Map<String, dynamic> toJson() => _$TermsToJson(this);
}

@JsonSerializable()
class Tooltip {
  @JsonKey(name: "enable")
  bool? enable;
  @JsonKey(name: "content")
  ItemName? content;

  Tooltip({this.enable, this.content});

  factory Tooltip.fromJson(Map<String, dynamic> json) =>
      _$TooltipFromJson(json);

  Map<String, dynamic> toJson() => _$TooltipToJson(this);
}
