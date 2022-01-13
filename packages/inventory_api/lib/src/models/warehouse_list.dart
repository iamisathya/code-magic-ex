import 'package:json_annotation/json_annotation.dart';

part 'warehouse_list.g.dart';

@JsonSerializable()
class WarehousesList {
  @JsonKey(name: "items")
  List<Warehouse> items;

  WarehousesList({required this.items});

  factory WarehousesList.fromJson(Map<String, dynamic> json) =>
      _$WarehousesListFromJson(json);

  Map<String, dynamic> toJson() => _$WarehousesListToJson(this);

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
