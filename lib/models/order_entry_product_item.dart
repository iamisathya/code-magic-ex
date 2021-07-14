import 'package:json_annotation/json_annotation.dart';

part 'order_entry_product_item.g.dart';

@JsonSerializable()
class OrderEntryItem {
  @JsonKey(name: "itemcode")
  String itemCode;
  @JsonKey(name: "quantityonhand")
  String quantityOnHand;

  OrderEntryItem({required this.itemCode, required this.quantityOnHand});

  factory OrderEntryItem.fromJson(Map<String, dynamic> json) =>
      _$OrderEntryItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderEntryItemToJson(this);
}
