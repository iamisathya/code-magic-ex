// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProductsItem _$CartProductsItemFromJson(Map<String, dynamic> json) {
  return CartProductsItem(
    itemCode: json['itemCode'] as String,
    productName: json['productName'] as String,
    quantity: json['quantity'] as int,
    itemPv: json['itemPv'] as int,
    itemPrice: (json['itemPrice'] as num).toDouble(),
    totalPv: json['totalPv'] as int,
    totalPrice: (json['totalPrice'] as num).toDouble(),
    imageUrl: json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$CartProductsItemToJson(CartProductsItem instance) =>
    <String, dynamic>{
      'itemCode': instance.itemCode,
      'productName': instance.productName,
      'quantity': instance.quantity,
      'itemPv': instance.itemPv,
      'itemPrice': instance.itemPrice,
      'totalPv': instance.totalPv,
      'totalPrice': instance.totalPrice,
      'imageUrl': instance.imageUrl,
    };
