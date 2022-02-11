// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HydraProducts _$HydraProductsFromJson(Map<String, dynamic> json) =>
    HydraProducts(
      isTagNative: json['isTagNative'] as String,
      warehouses: (json['warehouses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      warehouseSelected: json['warehouseSelected'] as String,
      totalItems: json['totalItems'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      marketingItems: (json['marketingItems'] as List<dynamic>)
          .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      renewal: json['renewal'] as List<dynamic>,
      starterKit: (json['starter_kit'] as List<dynamic>)
          .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      easyshipSet: (json['easyshipSet'] as List<dynamic>)
          .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HydraProductsToJson(HydraProducts instance) =>
    <String, dynamic>{
      'isTagNative': instance.isTagNative,
      'warehouses': instance.warehouses,
      'warehouseSelected': instance.warehouseSelected,
      'totalItems': instance.totalItems,
      'items': instance.items,
      'marketingItems': instance.marketingItems,
      'renewal': instance.renewal,
      'starter_kit': instance.starterKit,
      'easyshipSet': instance.easyshipSet,
    };

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
      id: json['id'] as int,
      warehouse: json['warehouse'] as String,
      isEnable: json['is_enable'] as bool,
      isLiquefy: json['is_liquefy'] as bool,
      isServiceItem: json['is_service_item'] as bool,
      enableAllowbackorder: json['enable_allowbackorder'] as bool,
      countryCode: json['country_code'] as String,
      itemCode: json['item_code'] as String,
      productSorting: json['product_sorting'] as int,
      itemName: ItemName.fromJson(json['item_name'] as Map<String, dynamic>),
      moreInfoUsage: json['more_info_usage'] as String,
      itemInfoList:
          ItemInfoList.fromJson(json['item_info_list'] as Map<String, dynamic>),
      itemInfoLinkTarget: json['item_info_link_target'] as String,
      itemInfoLinkUrl:
          ItemName.fromJson(json['item_info_link_url'] as Map<String, dynamic>),
      itemInfoPath:
          ItemName.fromJson(json['item_info_path'] as Map<String, dynamic>),
      price: json['price'] as int,
      priceOriginal: json['price_original'],
      discountAmount: json['discount_amount'],
      pv: json['pv'] as int,
      qtySellable: json['qty_sellable'] as int,
      imageUrl: json['image_url'] as String,
      remarks: json['remarks'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tags.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'],
      systemTags: json['system_tags'] as List<dynamic>,
      tooltip: json['tooltip'] == null
          ? null
          : Tooltip.fromJson(json['tooltip'] as Map<String, dynamic>),
      partsCount:
          PartsCount.fromJson(json['partsCount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'warehouse': instance.warehouse,
      'is_enable': instance.isEnable,
      'is_liquefy': instance.isLiquefy,
      'is_service_item': instance.isServiceItem,
      'enable_allowbackorder': instance.enableAllowbackorder,
      'country_code': instance.countryCode,
      'item_code': instance.itemCode,
      'product_sorting': instance.productSorting,
      'item_name': instance.itemName,
      'more_info_usage': instance.moreInfoUsage,
      'item_info_list': instance.itemInfoList,
      'item_info_link_target': instance.itemInfoLinkTarget,
      'item_info_link_url': instance.itemInfoLinkUrl,
      'item_info_path': instance.itemInfoPath,
      'price': instance.price,
      'price_original': instance.priceOriginal,
      'discount_amount': instance.discountAmount,
      'pv': instance.pv,
      'qty_sellable': instance.qtySellable,
      'image_url': instance.imageUrl,
      'remarks': instance.remarks,
      'categories': instance.categories,
      'tags': instance.tags,
      'status': instance.status,
      'system_tags': instance.systemTags,
      'tooltip': instance.tooltip,
      'partsCount': instance.partsCount,
    };

ItemName _$ItemNameFromJson(Map<String, dynamic> json) => ItemName(
      english: json['english'] as String?,
      native: json['native'] as String?,
    );

Map<String, dynamic> _$ItemNameToJson(ItemName instance) => <String, dynamic>{
      'english': instance.english,
      'native': instance.native,
    };

ItemInfoList _$ItemInfoListFromJson(Map<String, dynamic> json) => ItemInfoList(
      english: json['english'] as List<dynamic>,
      native: json['native'] as List<dynamic>,
    );

Map<String, dynamic> _$ItemInfoListToJson(ItemInfoList instance) =>
    <String, dynamic>{
      'english': instance.english,
      'native': instance.native,
    };

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      id: json['id'] as int,
      createdAt: json['created_at'] as String,
      createdBy: json['created_by'] as String,
      updatedAt: json['updated_at'] as String,
      updatedBy: json['updated_by'] as String,
      countryCode: json['country_code'] as String,
      name: ItemName.fromJson(json['name'] as Map<String, dynamic>),
      sorting: json['sorting'],
      isSystem: json['isSystem'] as bool,
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'country_code': instance.countryCode,
      'name': instance.name,
      'sorting': instance.sorting,
      'isSystem': instance.isSystem,
    };

Tags _$TagsFromJson(Map<String, dynamic> json) => Tags(
      id: json['id'] as int,
      createdAt: json['created_at'] as String,
      createdBy: json['created_by'] as String,
      updatedAt: json['updated_at'] as String,
      updatedBy: json['updated_by'] as String,
      name: json['name'] as String,
      isSystemTags: json['is_system_tags'] as bool,
      sorting: json['sorting'],
      style: Style.fromJson(json['style'] as Map<String, dynamic>),
      text: ItemName.fromJson(json['text'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'name': instance.name,
      'is_system_tags': instance.isSystemTags,
      'sorting': instance.sorting,
      'style': instance.style,
      'text': instance.text,
    };

Style _$StyleFromJson(Map<String, dynamic> json) => Style(
      color: json['color'] as String,
      backgroundColor: json['background_color'] as String,
    );

Map<String, dynamic> _$StyleToJson(Style instance) => <String, dynamic>{
      'color': instance.color,
      'background_color': instance.backgroundColor,
    };

PartsCount _$PartsCountFromJson(Map<String, dynamic> json) => PartsCount(
      unit: ItemName.fromJson(json['unit'] as Map<String, dynamic>),
      value: json['value'],
    );

Map<String, dynamic> _$PartsCountToJson(PartsCount instance) =>
    <String, dynamic>{
      'unit': instance.unit,
      'value': instance.value,
    };

Tooltip _$TooltipFromJson(Map<String, dynamic> json) => Tooltip(
      enable: json['enable'] as bool,
      content: ItemName.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TooltipToJson(Tooltip instance) => <String, dynamic>{
      'enable': instance.enable,
      'content': instance.content,
    };
