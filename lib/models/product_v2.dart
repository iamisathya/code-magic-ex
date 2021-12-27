import 'package:json_annotation/json_annotation.dart';

part 'product_v2.g.dart';

@JsonSerializable()
class HydraProducts {
  @JsonKey(name: "isTagNative")
  String isTagNative;
  @JsonKey(name: "warehouses")
  List<String> warehouses;
  @JsonKey(name: "warehouseSelected")
  String warehouseSelected;
  @JsonKey(name: "totalItems")
  int totalItems;
  @JsonKey(name: "items")
  List<ProductItem> items;
  @JsonKey(name: "marketingItems")
  List<ProductItem> marketingItems;
  @JsonKey(name: "renewal")
  List<dynamic> renewal;
  @JsonKey(name: "starter_kit")
  List<ProductItem> starterKit;
  @JsonKey(name: "easyshipSet")
  List<ProductItem> easyshipSet;

  HydraProducts(
      {required this.isTagNative,
      required this.warehouses,
      required this.warehouseSelected,
      required this.totalItems,
      required this.items,
      required this.marketingItems,
      required this.renewal,
      required this.starterKit,
      required this.easyshipSet});

  factory HydraProducts.fromJson(Map<String, dynamic> json) =>
      _$HydraProductsFromJson(json);

  Map<String, dynamic> toJson() => _$HydraProductsToJson(this);
}

@JsonSerializable()
class ProductItem {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "warehouse")
  String warehouse;
  @JsonKey(name: "is_enable")
  bool isEnable;
  @JsonKey(name: "is_liquefy")
  bool isLiquefy;
  @JsonKey(name: "is_service_item")
  bool isServiceItem;
  @JsonKey(name: "enable_allowbackorder")
  bool enableAllowbackorder;
  @JsonKey(name: "country_code")
  String countryCode;
  @JsonKey(name: "item_code")
  String itemCode;
  @JsonKey(name: "product_sorting")
  int productSorting;
  @JsonKey(name: "item_name")
  ItemName itemName;
  @JsonKey(name: "more_info_usage")
  String moreInfoUsage;
  @JsonKey(name: "item_info_list")
  ItemInfoList itemInfoList;
  @JsonKey(name: "item_info_link_target")
  String itemInfoLinkTarget;
  @JsonKey(name: "item_info_link_url")
  ItemName itemInfoLinkUrl;
  @JsonKey(name: "item_info_path")
  ItemName itemInfoPath;
  @JsonKey(name: "price")
  int price;
  @JsonKey(name: "price_original")
  dynamic priceOriginal;
  @JsonKey(name: "discount_amount")
  dynamic discountAmount;
  @JsonKey(name: "pv")
  int pv;
  @JsonKey(name: "qty_sellable")
  int qtySellable;
  @JsonKey(name: "image_url")
  String imageUrl;
  @JsonKey(name: "remarks")
  String remarks;
  @JsonKey(name: "categories")
  List<Categories> categories;
  @JsonKey(name: "tags")
  List<Tags> tags;
  @JsonKey(name: "status")
  dynamic status;
  @JsonKey(name: "system_tags")
  List<dynamic> systemTags;
  @JsonKey(name: "tooltip")
  dynamic tooltip;
  @JsonKey(name: "parts_count")
  PartsCount partsCount;

  ProductItem(
      {required this.id,
      required this.warehouse,
      required this.isEnable,
      required this.isLiquefy,
      required this.isServiceItem,
      required this.enableAllowbackorder,
      required this.countryCode,
      required this.itemCode,
      required this.productSorting,
      required this.itemName,
      required this.moreInfoUsage,
      required this.itemInfoList,
      required this.itemInfoLinkTarget,
      required this.itemInfoLinkUrl,
      required this.itemInfoPath,
      required this.price,
      required this.priceOriginal,
      required this.discountAmount,
      required this.pv,
      required this.qtySellable,
      required this.imageUrl,
      required this.remarks,
      required this.categories,
      required this.tags,
      required this.status,
      required this.systemTags,
      required this.tooltip,
      required this.partsCount});

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}

@JsonSerializable()
class ItemName {
  @JsonKey(name: "english")
  String english;
  @JsonKey(name: "native")
  String native;

  ItemName({required this.english, required this.native});

  factory ItemName.fromJson(Map<String, dynamic> json) =>
      _$ItemNameFromJson(json);

  Map<String, dynamic> toJson() => _$ItemNameToJson(this);
}

@JsonSerializable()
class ItemInfoList {
  @JsonKey(name: "english")
  List<dynamic> english;
  @JsonKey(name: "native")
  List<dynamic> native;

  ItemInfoList({required this.english, required this.native});

  factory ItemInfoList.fromJson(Map<String, dynamic> json) =>
      _$ItemInfoListFromJson(json);

  Map<String, dynamic> toJson() => _$ItemInfoListToJson(this);
}

@JsonSerializable()
class Categories {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "created_by")
  String createdBy;
  @JsonKey(name: "updated_at")
  String updatedAt;
  @JsonKey(name: "updated_by")
  String updatedBy;
  @JsonKey(name: "country_code")
  String countryCode;
  @JsonKey(name: "name")
  ItemName name;
  @JsonKey(name: "sorting")
  dynamic sorting;
  @JsonKey(name: "is_system")
  bool isSystem;

  Categories(
      {required this.id,
      required this.createdAt,
      required this.createdBy,
      required this.updatedAt,
      required this.updatedBy,
      required this.countryCode,
      required this.name,
      required this.sorting,
      required this.isSystem});

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}

@JsonSerializable()
class Tags {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "created_by")
  String createdBy;
  @JsonKey(name: "updated_at")
  String updatedAt;
  @JsonKey(name: "updated_by")
  String updatedBy;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "is_system_tags")
  bool isSystemTags;
  @JsonKey(name: "sorting")
  dynamic sorting;
  @JsonKey(name: "style")
  Style style;
  @JsonKey(name: "text")
  ItemName text;

  Tags(
      {required this.id,
      required this.createdAt,
      required this.createdBy,
      required this.updatedAt,
      required this.updatedBy,
      required this.name,
      required this.isSystemTags,
      required this.sorting,
      required this.style,
      required this.text});

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);

  Map<String, dynamic> toJson() => _$TagsToJson(this);
}

@JsonSerializable()
class Style {
  @JsonKey(name: "color")
  String color;
  @JsonKey(name: "background_color")
  String backgroundColor;

  Style({required this.color, required this.backgroundColor});

  factory Style.fromJson(Map<String, dynamic> json) => _$StyleFromJson(json);

  Map<String, dynamic> toJson() => _$StyleToJson(this);
}

@JsonSerializable()
class PartsCount {
  @JsonKey(name: "unit")
  ItemName unit;
  @JsonKey(name: "value")
  int value;

  PartsCount({required this.unit, required this.value});

  factory PartsCount.fromJson(Map<String, dynamic> json) =>
      _$PartsCountFromJson(json);

  Map<String, dynamic> toJson() => _$PartsCountToJson(this);
}
