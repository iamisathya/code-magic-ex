import 'package:json_annotation/json_annotation.dart';

part 'cart_products.g.dart';

@JsonSerializable()
class CartProductsItem {
  @JsonKey(name: "itemCode")
  String itemCode;
  @JsonKey(name: "productName")
  String productName;
  @JsonKey(name: "quantity")
  int quantity;
  @JsonKey(name: "itemPv")
  int itemPv;
  @JsonKey(name: "itemPrice")
  double itemPrice;
  @JsonKey(name: "totalPv")
  int totalPv;
  @JsonKey(name: "totalPrice")
  double totalPrice;

  CartProductsItem({
    this.itemCode = "",
    this.productName = "",
    this.quantity = 0,
    this.itemPv = 0,
    this.itemPrice = 0,
    this.totalPv = 0,
    this.totalPrice = 0,
  });

  factory CartProductsItem.fromJson(Map<String, dynamic> json) =>
      _$CartProductsItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductsItemToJson(this);
}
