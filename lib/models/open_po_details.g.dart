// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_po_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenPlaceOrderDetails _$OpenPlaceOrderDetailsFromJson(
    Map<String, dynamic> json) {
  return OpenPlaceOrderDetails(
    comment: json['comment'] as String,
    productId: json['pro_id'] as String,
    productName: json['pro_name'] as String,
    productPrice: json['pro_price'] as String,
    productPv: json['pro_pv'] as String,
    productQty: json['pro_qty'] as String,
    total: json['total'] as String,
    total2: json['total2'] as String,
    totalPrice: json['totalprice'] as String,
    totalPv: json['totalpv'] as String,
  );
}

Map<String, dynamic> _$OpenPlaceOrderDetailsToJson(
        OpenPlaceOrderDetails instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'pro_id': instance.productId,
      'pro_name': instance.productName,
      'pro_price': instance.productPrice,
      'pro_pv': instance.productPv,
      'pro_qty': instance.productQty,
      'total': instance.total,
      'total2': instance.total2,
      'totalprice': instance.totalPrice,
      'totalpv': instance.totalPv,
    };
