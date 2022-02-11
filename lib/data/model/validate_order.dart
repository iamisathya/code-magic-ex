import 'package:json_annotation/json_annotation.dart';

part 'validate_order.g.dart';

@JsonSerializable()
class ValidateOrder {
  @JsonKey(name: "country")
  String country;
  @JsonKey(name: "dsc")
  String dsc;
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "success")
  String success;

  ValidateOrder({
    required this.country,
    required this.dsc,
    required this.message,
    required this.success,
  });

  factory ValidateOrder.fromJson(Map<String, dynamic> json) =>
      _$ValidateOrderFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateOrderToJson(this);

  Map<String, dynamic> toMap() =>
      {'country': country, 'dsc': dsc, 'message': message, 'success': success};
}
