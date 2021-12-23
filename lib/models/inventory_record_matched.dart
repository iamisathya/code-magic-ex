import 'package:json_annotation/json_annotation.dart';

part 'inventory_record_matched.g.dart';



@JsonSerializable()
class InventoryRecordsMatchedItem {
  @JsonKey(name: "pro_code")
  String itemCode;
  @JsonKey(name: "pro_id")
  String itemId;
  @JsonKey(name: "pro_name")
  String itemName;
  @JsonKey(name: "pro_name_en")
  String itemNameEn;
  @JsonKey(name: "pro_note")
  String itemNote;
  @JsonKey(name: "pro_price")
  String itemPrice;
  @JsonKey(name: "pro_pv")
  String itemPv;

  InventoryRecordsMatchedItem({
    required this.itemCode,
    required this.itemId,
    required this.itemName,
    required this.itemNameEn,
    required this.itemNote,
    required this.itemPrice,
    required this.itemPv,
  });

  factory InventoryRecordsMatchedItem.fromJson(Map<String, dynamic> json) =>
      _$InventoryRecordsMatchedItemFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryRecordsMatchedItemToJson(this);
}
