import 'package:json_annotation/json_annotation.dart';

part 'order_entry_product_info.g.dart';

@JsonSerializable()
class OrderEntryProductInfo {
  String id;
  String productId;
  String productName;
  String productPrice;
  String productCost;
  String productVcost;

  OrderEntryProductInfo({
    this.id = "",
    this.productId = "",
    this.productName = "",
    this.productPrice = "",
    this.productCost = "",
    this.productVcost = "",
  });

  factory OrderEntryProductInfo.fromJson(Map<String, dynamic> json) =>
      _$OrderEntryProductInfoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderEntryProductInfoToJson(this);
}
