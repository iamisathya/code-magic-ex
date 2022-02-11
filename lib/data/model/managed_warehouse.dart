import 'package:json_annotation/json_annotation.dart';

part 'managed_warehouse.g.dart';

@JsonSerializable()
class ManagedWarehouses {
  @JsonKey(name: "items")
  List<Warehouse> items;

  ManagedWarehouses({required this.items});

  factory ManagedWarehouses.fromJson(Map<String, dynamic> json) =>
      _$ManagedWarehousesFromJson(json);

  Map<String, dynamic> toJson() => _$ManagedWarehousesToJson(this);

  Map<String, dynamic> toMap() => {
        'items': items,
      };
}

@JsonSerializable()
class Warehouse {
  @JsonKey(name: "href")
  String href;

  Warehouse({required this.href});

  factory Warehouse.fromJson(Map<String, dynamic> json) =>
      _$WarehouseFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseToJson(this);
}
