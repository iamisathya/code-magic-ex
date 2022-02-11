// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'managed_warehouse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManagedWarehouses _$ManagedWarehousesFromJson(Map<String, dynamic> json) =>
    ManagedWarehouses(
      items: (json['items'] as List<dynamic>)
          .map((e) => Warehouse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ManagedWarehousesToJson(ManagedWarehouses instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

Warehouse _$WarehouseFromJson(Map<String, dynamic> json) => Warehouse(
      href: json['href'] as String,
    );

Map<String, dynamic> _$WarehouseToJson(Warehouse instance) => <String, dynamic>{
      'href': instance.href,
    };
