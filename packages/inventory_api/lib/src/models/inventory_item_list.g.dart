// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_item_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryItemListModel _$InventoryItemListModelFromJson(
    Map<String, dynamic> json) {
  return InventoryItemListModel(
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => InventoryItemListModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$InventoryItemListModelToJson(
        InventoryItemListModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

InventoryItem _$InventoryItemFromJson(Map<String, dynamic> json) {
  return InventoryItem(
    catalogSlide: json['catalogSlide'] == null
        ? null
        : CatalogSlide.fromJson(json['catalogSlide'] as Map<String, dynamic>),
    item: json['item'] == null
        ? null
        : Item.fromJson(json['item'] as Map<String, dynamic>),
    quantityOnHand: json['quantityOnHand'] as String?,
    terms: json['terms'] == null
        ? null
        : Terms.fromJson(json['terms'] as Map<String, dynamic>),
    itemInfo: json['itemInfo'] == null
        ? null
        : ItemInfo.fromJson(json['itemInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InventoryItemToJson(InventoryItem instance) =>
    <String, dynamic>{
      'catalogSlide': instance.catalogSlide,
      'item': instance.item,
      'quantityOnHand': instance.quantityOnHand,
      'terms': instance.terms,
      'itemInfo': instance.itemInfo,
    };

CatalogSlide _$CatalogSlideFromJson(Map<String, dynamic> json) {
  return CatalogSlide(
    content: json['content'] == null
        ? null
        : Content.fromJson(json['content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CatalogSlideToJson(CatalogSlide instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

Content _$ContentFromJson(Map<String, dynamic> json) {
  return Content(
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'description': instance.description,
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    href: json['href'] as String?,
    id: json['id'] == null
        ? null
        : Id.fromJson(json['id'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'href': instance.href,
      'id': instance.id,
    };

Id _$IdFromJson(Map<String, dynamic> json) {
  return Id(
    unicity: json['unicity'] as String?,
  );
}

Map<String, dynamic> _$IdToJson(Id instance) => <String, dynamic>{
      'unicity': instance.unicity,
    };

Terms _$TermsFromJson(Map<String, dynamic> json) {
  return Terms(
    priceEach: (json['priceEach'] as num?)?.toDouble(),
    pvEach: json['pvEach'] as int?,
  );
}

Map<String, dynamic> _$TermsToJson(Terms instance) => <String, dynamic>{
      'priceEach': instance.priceEach,
      'pvEach': instance.pvEach,
    };

ItemInfo _$ItemInfoFromJson(Map<String, dynamic> json) {
  return ItemInfo(
    id: json['id'] as int?,
    countryCode: json['country_code'] as String?,
    itemCode: json['item_code'] as String?,
    createdAt: json['created_at'] as String?,
    createdBy: json['created_by'] as String?,
    updatedAt: json['updated_at'] as String?,
    updatedBy: json['updated_by'] as String?,
    isArchive: json['is_archive'] as bool?,
    isServiceItem: json['is_service_item'] as bool?,
    isLiquefy: json['is_liquefy'] as bool?,
    isMarketingItem: json['is_marketing_item'] as bool?,
    isMarketingItemSellable: json['is_marketing_item_sellable'] as bool?,
    isRenewal: json['is_renewal'] as bool?,
    isRenewalSellable: json['is_renewal_sellable'] as bool?,
    isStarterKit: json['is_starter_kit'] as bool?,
    isStarterKitSellable: json['is_starter_kit_sellable'] as bool?,
    isEasyship: json['is_easyship'] as bool?,
    isEasyshipSellable: json['is_easyship_sellable'] as bool?,
    allowPages: (json['allow_pages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    allowBaIds: json['allow_ba_ids'] as List<dynamic>?,
    onlyStatusAllow: json['only_status_allow'] == null
        ? null
        : OnlyStatusAllow.fromJson(
            json['only_status_allow'] as Map<String, dynamic>),
    productSorting: json['product_sorting'] as int?,
    itemName: json['item_name'] == null
        ? null
        : ItemName.fromJson(json['item_name'] as Map<String, dynamic>),
    moreInfoUsage: json['more_info_usage'] as String?,
    itemInfoList: json['item_info_list'] == null
        ? null
        : ItemInfoList.fromJson(json['item_info_list'] as Map<String, dynamic>),
    itemInfoLinkTarget: json['item_info_link_target'] as String?,
    itemInfoLinkUrl: json['item_info_link_url'] == null
        ? null
        : ItemName.fromJson(json['item_info_link_url'] as Map<String, dynamic>),
    itemInfoPath: json['item_info_path'] == null
        ? null
        : ItemName.fromJson(json['item_info_path'] as Map<String, dynamic>),
    textInfo: json['text_info'] == null
        ? null
        : ItemName.fromJson(json['text_info'] as Map<String, dynamic>),
    price: json['price'] == null
        ? null
        : Price.fromJson(json['price'] as Map<String, dynamic>),
    pv: json['pv'] as int?,
    imageUrl: json['image_url'] as String,
    remarks: json['remarks'] as String?,
    tooltip: json['tooltip'] == null
        ? null
        : Tooltip.fromJson(json['tooltip'] as Map<String, dynamic>),
    partsCount: json['partsCount'] == null
        ? null
        : PartsCount.fromJson(json['partsCount'] as Map<String, dynamic>),
    publishDateStart: json['publish_date_start'],
    publishDateEnd: json['publish_date_end'],
    listOfCategoryId: (json['list_of_category_id'] as List<dynamic>?)
        ?.map((e) => e as int)
        .toList(),
    listOfTagId: json['list_of_tag_id'] as List<dynamic>?,
    listOfInventoryId: (json['list_of_inventory_id'] as List<dynamic>?)
        ?.map((e) => e as int)
        .toList(),
  );
}

Map<String, dynamic> _$ItemInfoToJson(ItemInfo instance) => <String, dynamic>{
      'id': instance.id,
      'country_code': instance.countryCode,
      'item_code': instance.itemCode,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'is_archive': instance.isArchive,
      'is_service_item': instance.isServiceItem,
      'is_liquefy': instance.isLiquefy,
      'is_marketing_item': instance.isMarketingItem,
      'is_marketing_item_sellable': instance.isMarketingItemSellable,
      'is_renewal': instance.isRenewal,
      'is_renewal_sellable': instance.isRenewalSellable,
      'is_starter_kit': instance.isStarterKit,
      'is_starter_kit_sellable': instance.isStarterKitSellable,
      'is_easyship': instance.isEasyship,
      'is_easyship_sellable': instance.isEasyshipSellable,
      'allow_pages': instance.allowPages,
      'allow_ba_ids': instance.allowBaIds,
      'only_status_allow': instance.onlyStatusAllow,
      'product_sorting': instance.productSorting,
      'item_name': instance.itemName,
      'more_info_usage': instance.moreInfoUsage,
      'item_info_list': instance.itemInfoList,
      'item_info_link_target': instance.itemInfoLinkTarget,
      'item_info_link_url': instance.itemInfoLinkUrl,
      'item_info_path': instance.itemInfoPath,
      'text_info': instance.textInfo,
      'price': instance.price,
      'pv': instance.pv,
      'image_url': instance.imageUrl,
      'remarks': instance.remarks,
      'tooltip': instance.tooltip,
      'partsCount': instance.partsCount,
      'publish_date_start': instance.publishDateStart,
      'publish_date_end': instance.publishDateEnd,
      'list_of_category_id': instance.listOfCategoryId,
      'list_of_tag_id': instance.listOfTagId,
      'list_of_inventory_id': instance.listOfInventoryId,
    };

OnlyStatusAllow _$OnlyStatusAllowFromJson(Map<String, dynamic> json) {
  return OnlyStatusAllow(
    shop: json['shop'] as List<dynamic>?,
  );
}

Map<String, dynamic> _$OnlyStatusAllowToJson(OnlyStatusAllow instance) =>
    <String, dynamic>{
      'shop': instance.shop,
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

ItemInfoList _$ItemInfoListFromJson(Map<String, dynamic> json) {
  return ItemInfoList(
    english:
        (json['english'] as List<dynamic>?)?.map((e) => e as String).toList(),
    native:
        (json['native'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ItemInfoListToJson(ItemInfoList instance) =>
    <String, dynamic>{
      'english': instance.english,
      'native': instance.native,
    };

Price _$PriceFromJson(Map<String, dynamic> json) {
  return Price(
    wholesale: json['wholesale'] as int?,
    retail: (json['retail'] as num?)?.toDouble(),
    preferred: json['preferred'] as int?,
    employee: (json['employee'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'wholesale': instance.wholesale,
      'retail': instance.retail,
      'preferred': instance.preferred,
      'employee': instance.employee,
    };

Tooltip _$TooltipFromJson(Map<String, dynamic> json) {
  return Tooltip(
    enable: json['enable'] as bool?,
    content: json['content'] == null
        ? null
        : ItemName.fromJson(json['content'] as Map<String, dynamic>),
    dialog: json['dialog'] == null
        ? null
        : Dialog.fromJson(json['dialog'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TooltipToJson(Tooltip instance) => <String, dynamic>{
      'enable': instance.enable,
      'content': instance.content,
      'dialog': instance.dialog,
    };

Dialog _$DialogFromJson(Map<String, dynamic> json) {
  return Dialog(
    style: json['style'] == null
        ? null
        : Style.fromJson(json['style'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DialogToJson(Dialog instance) => <String, dynamic>{
      'style': instance.style,
    };

Style _$StyleFromJson(Map<String, dynamic> json) {
  return Style(
    backgroundColor: json['backgroundColor'] as String?,
  );
}

Map<String, dynamic> _$StyleToJson(Style instance) => <String, dynamic>{
      'backgroundColor': instance.backgroundColor,
    };

PartsCount _$PartsCountFromJson(Map<String, dynamic> json) {
  return PartsCount(
    unit: json['unit'] == null
        ? null
        : Unit.fromJson(json['unit'] as Map<String, dynamic>),
    value: json['value'],
  );
}

Map<String, dynamic> _$PartsCountToJson(PartsCount instance) =>
    <String, dynamic>{
      'unit': instance.unit,
      'value': instance.value,
    };

Unit _$UnitFromJson(Map<String, dynamic> json) {
  return Unit(
    english: json['english'],
    native: json['native'],
  );
}

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
      'english': instance.english,
      'native': instance.native,
    };
