

import 'package:json_annotation/json_annotation.dart';

part 'openpo_create_order_result.g.dart';

@JsonSerializable()
class OpenPoCreateOrderResult {
  bool isSuccess;
  String distributorId;
  String poNumber;

  OpenPoCreateOrderResult({
    required this.isSuccess,
    required this.distributorId,
    required this.poNumber,
  });

  factory OpenPoCreateOrderResult.fromJson(Map<String, dynamic> json) =>
      _$OpenPoCreateOrderResultFromJson(json);

  Map<String, dynamic> toJson() => _$OpenPoCreateOrderResultToJson(this);
}
