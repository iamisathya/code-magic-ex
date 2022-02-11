// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProductsItem _$CartProductsItemFromJson(Map<String, dynamic> json) =>
    CartProductsItem(
      itemCode: json['itemCode'] as String? ?? "",
      productName: json['productName'] as String? ?? "",
      quantity: json['quantity'] as int? ?? 0,
      itemPv: json['itemPv'] as int? ?? 0,
      itemPrice: (json['itemPrice'] as num?)?.toDouble() ?? 0,
      totalPv: json['totalPv'] as int? ?? 0,
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0,
      imageUrl: json['imageUrl'] as String? ?? "",
    );

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
