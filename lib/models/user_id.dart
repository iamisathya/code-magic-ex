import 'package:json_annotation/json_annotation.dart';

part 'user_id.g.dart';

@JsonSerializable()
class UserId {
  @JsonKey(name: "cus_id")
  String customerId;
  @JsonKey(name: "cus_code")
  String customerCode;

  UserId({required this.customerId, required this.customerCode});

  factory UserId.fromJson(Map<String, dynamic> json) =>
      _$UserIdFromJson(json);

  Map<String, dynamic> toJson() => _$UserIdToJson(this);

  Map<String, dynamic> toMap() =>
      {'customerCode': customerCode, 'customerId': customerId};
}
