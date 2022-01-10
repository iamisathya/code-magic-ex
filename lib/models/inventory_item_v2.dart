import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inventory_item_v2.g.dart';

@JsonSerializable()
class InventoryItemV2 {
  @JsonKey(name: "items")
  List<InventoryItem>? items;

  InventoryItemV2({this.items});

  factory InventoryItemV2.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemV2FromJson(json);

  Map<String, dynamic> toJson() => _$InventoryItemV2ToJson(this);
}

@JsonSerializable()
class InventoryItem {
  @JsonKey(name: "catalogSlide")
  CatalogSlide? catalogSlide;
  @JsonKey(name: "item")
  Item? item;
  @JsonKey(name: "quantityOnHand")
  String? quantityOnHand;
  @JsonKey(name: "terms")
  Terms? terms;
  @JsonKey(name: "itemInfo")
  ItemInfo? itemInfo;

  InventoryItem(
      {this.catalogSlide,
      this.item,
      this.quantityOnHand,
      this.terms,
      this.itemInfo});

  String get totalPrice => NumberFormat().format(double.parse(quantityOnHand!) * terms!.priceEach!);
  int get totalPv => int.parse(quantityOnHand!) * terms!.pvEach!;

  factory InventoryItem.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryItemToJson(this);
}

@JsonSerializable()
class CatalogSlide {
  @JsonKey(name: "content")
  Content? content;

  CatalogSlide({this.content});

  factory CatalogSlide.fromJson(Map<String, dynamic> json) =>
      _$CatalogSlideFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogSlideToJson(this);
}

@JsonSerializable()
class Content {
  @JsonKey(name: "description")
  String? description;

  Content({this.description});

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@JsonSerializable()
class Item {
  @JsonKey(name: "href")
  String? href;
  @JsonKey(name: "id")
  Id? id;

  Item({this.href, this.id});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class Id {
  @JsonKey(name: "unicity")
  String? unicity;

  Id({this.unicity});

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);

  Map<String, dynamic> toJson() => _$IdToJson(this);
}

@JsonSerializable()
class Terms {
  @JsonKey(name: "priceEach")
  int? priceEach;
  @JsonKey(name: "pvEach")
  int? pvEach;

  Terms({this.priceEach, this.pvEach});

  factory Terms.fromJson(Map<String, dynamic> json) => _$TermsFromJson(json);

  Map<String, dynamic> toJson() => _$TermsToJson(this);
}

@JsonSerializable()
class ItemInfo {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "country_code")
  String? countryCode;
  @JsonKey(name: "item_code")
  String? itemCode;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "created_by")
  String? createdBy;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "updated_by")
  String? updatedBy;
  @JsonKey(name: "is_archive")
  bool? isArchive;
  @JsonKey(name: "is_service_item")
  bool? isServiceItem;
  @JsonKey(name: "is_liquefy")
  bool? isLiquefy;
  @JsonKey(name: "is_marketing_item")
  bool? isMarketingItem;
  @JsonKey(name: "is_marketing_item_sellable")
  bool? isMarketingItemSellable;
  @JsonKey(name: "is_renewal")
  bool? isRenewal;
  @JsonKey(name: "is_renewal_sellable")
  bool? isRenewalSellable;
  @JsonKey(name: "is_starter_kit")
  bool? isStarterKit;
  @JsonKey(name: "is_starter_kit_sellable")
  bool? isStarterKitSellable;
  @JsonKey(name: "is_easyship")
  bool? isEasyship;
  @JsonKey(name: "is_easyship_sellable")
  bool? isEasyshipSellable;
  @JsonKey(name: "allow_pages")
  List<String>? allowPages;
  @JsonKey(name: "allow_ba_ids")
  List<dynamic>? allowBaIds;
  @JsonKey(name: "only_status_allow")
  OnlyStatusAllow? onlyStatusAllow;
  @JsonKey(name: "product_sorting")
  int? productSorting;
  @JsonKey(name: "item_name")
  ItemName? itemName;
  @JsonKey(name: "more_info_usage")
  String? moreInfoUsage;
  @JsonKey(name: "item_info_list")
  ItemInfoList? itemInfoList;
  @JsonKey(name: "item_info_link_target")
  String? itemInfoLinkTarget;
  @JsonKey(name: "item_info_link_url")
  ItemName? itemInfoLinkUrl;
  @JsonKey(name: "item_info_path")
  ItemName? itemInfoPath;
  @JsonKey(name: "text_info")
  ItemName? textInfo;
  @JsonKey(name: "price")
  Price? price;
  @JsonKey(name: "pv")
  int? pv;
  @JsonKey(name: "image_url")
  String imageUrl;
  @JsonKey(name: "remarks")
  String? remarks;
  @JsonKey(name: "tooltip")
  Tooltip? tooltip;
  @JsonKey(name: "partsCount")
  PartsCount? partsCount;
  @JsonKey(name: "publish_date_start")
  dynamic publishDateStart;
  @JsonKey(name: "publish_date_end")
  dynamic publishDateEnd;
  @JsonKey(name: "list_of_category_id")
  List<int>? listOfCategoryId;
  @JsonKey(name: "list_of_tag_id")
  List<dynamic>? listOfTagId;
  @JsonKey(name: "list_of_inventory_id")
  List<int>? listOfInventoryId;

  ItemInfo(
      {this.id,
      this.countryCode,
      this.itemCode,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.isArchive,
      this.isServiceItem,
      this.isLiquefy,
      this.isMarketingItem,
      this.isMarketingItemSellable,
      this.isRenewal,
      this.isRenewalSellable,
      this.isStarterKit,
      this.isStarterKitSellable,
      this.isEasyship,
      this.isEasyshipSellable,
      this.allowPages,
      this.allowBaIds,
      this.onlyStatusAllow,
      this.productSorting,
      this.itemName,
      this.moreInfoUsage,
      this.itemInfoList,
      this.itemInfoLinkTarget,
      this.itemInfoLinkUrl,
      this.itemInfoPath,
      this.textInfo,
      this.price,
      this.pv,
      this.imageUrl = "",
      this.remarks,
      this.tooltip,
      this.partsCount,
      this.publishDateStart,
      this.publishDateEnd,
      this.listOfCategoryId,
      this.listOfTagId,
      this.listOfInventoryId});

  factory ItemInfo.fromJson(Map<String, dynamic> json) =>
      _$ItemInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ItemInfoToJson(this);
}

@JsonSerializable()
class OnlyStatusAllow {
  @JsonKey(name: "shop")
  List<dynamic>? shop;

  OnlyStatusAllow({this.shop});

  factory OnlyStatusAllow.fromJson(Map<String, dynamic> json) =>
      _$OnlyStatusAllowFromJson(json);

  Map<String, dynamic> toJson() => _$OnlyStatusAllowToJson(this);
}

@JsonSerializable()
class ItemName {
  @JsonKey(name: "english")
  String? english;
  @JsonKey(name: "native")
  String? native;

  ItemName({this.english, this.native});

  factory ItemName.fromJson(Map<String, dynamic> json) =>
      _$ItemNameFromJson(json);

  Map<String, dynamic> toJson() => _$ItemNameToJson(this);
}

@JsonSerializable()
class ItemInfoList {
  @JsonKey(name: "english")
  List<String>? english;
  @JsonKey(name: "native")
  List<String>? native;

  ItemInfoList({this.english, this.native});

  factory ItemInfoList.fromJson(Map<String, dynamic> json) =>
      _$ItemInfoListFromJson(json);

  Map<String, dynamic> toJson() => _$ItemInfoListToJson(this);
}

@JsonSerializable()
class Price {
  @JsonKey(name: "wholesale")
  int? wholesale;
  @JsonKey(name: "retail")
  double? retail;
  @JsonKey(name: "preferred")
  int? preferred;
  @JsonKey(name: "employee")
  double? employee;

  Price({this.wholesale, this.retail, this.preferred, this.employee});

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}

@JsonSerializable()
class Tooltip {
  @JsonKey(name: "enable")
  bool? enable;
  @JsonKey(name: "content")
  ItemName? content;
  @JsonKey(name: "dialog")
  Dialog? dialog;

  Tooltip({this.enable, this.content, this.dialog});

  factory Tooltip.fromJson(Map<String, dynamic> json) =>
      _$TooltipFromJson(json);

  Map<String, dynamic> toJson() => _$TooltipToJson(this);
}

@JsonSerializable()
class Dialog {
  @JsonKey(name: "style")
  Style? style;

  Dialog({this.style});

  factory Dialog.fromJson(Map<String, dynamic> json) => _$DialogFromJson(json);

  Map<String, dynamic> toJson() => _$DialogToJson(this);
}

@JsonSerializable()
class Style {
  @JsonKey(name: "backgroundColor")
  String? backgroundColor;

  Style({this.backgroundColor});

  factory Style.fromJson(Map<String, dynamic> json) => _$StyleFromJson(json);

  Map<String, dynamic> toJson() => _$StyleToJson(this);
}

@JsonSerializable()
class PartsCount {
  @JsonKey(name: "unit")
  Unit? unit;
  @JsonKey(name: "value")
  dynamic value;

  PartsCount({this.unit, this.value});

  factory PartsCount.fromJson(Map<String, dynamic> json) =>
      _$PartsCountFromJson(json);

  Map<String, dynamic> toJson() => _$PartsCountToJson(this);
}

@JsonSerializable()
class Unit {
  @JsonKey(name: "english")
  dynamic english;
  @JsonKey(name: "native")
  dynamic native;

  Unit({this.english, this.native});

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

  Map<String, dynamic> toJson() => _$UnitToJson(this);
}
