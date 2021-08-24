import 'package:json_annotation/json_annotation.dart';

part 'user_id.g.dart';

@JsonSerializable()
class UserId {
  @JsonKey(name: "cus_id")
  String customerId;
  @JsonKey(name: "cus_code")
  String customerCode;
  @JsonKey(name: "cus_pocode")
  String customerPoCode;

  UserId(
      {required this.customerId,
      required this.customerCode,
      required this.customerPoCode});

  factory UserId.fromJson(Map<String, dynamic> json) => _$UserIdFromJson(json);

  Map<String, dynamic> toJson() => _$UserIdToJson(this);

  Map<String, dynamic> toMap() => {
        'customerCode': customerCode,
        'customerId': customerId,
        'customerPoCode': customerPoCode
      };

  Map<String, dynamic> toOriginalMap() => {
        'cus_code': customerCode,
        'cus_id': customerId,
        'cus_pocode': customerPoCode
      };
}
