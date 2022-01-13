// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehousesList _$WarehousesListFromJson(Map<String, dynamic> json) {
  return WarehousesList(
    items: (json['items'] as List<dynamic>)
        .map((e) => Warehouse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WarehousesListToJson(WarehousesList instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

Warehouse _$WarehouseFromJson(Map<String, dynamic> json) {
  return Warehouse(
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$WarehouseToJson(Warehouse instance) => <String, dynamic>{
      'href': instance.href,
    };
