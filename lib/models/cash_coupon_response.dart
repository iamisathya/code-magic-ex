
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cash_coupon_response.g.dart';

@JsonSerializable()
class CashCouponResponse{
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "availableCreditAmount")
  int availableCreditAmount;

  CashCouponResponse({required this.success, required this.availableCreditAmount});

  factory CashCouponResponse.fromJson(Map<String, dynamic> json) => _$CashCouponResponseFromJson(json);

  Map<String, dynamic> toJson() =>  _$CashCouponResponseToJson(this);
}