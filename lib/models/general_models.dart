import 'package:json_annotation/json_annotation.dart';

part 'general_models.g.dart';

@JsonSerializable()
class GetPeriodLogResponse {
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "idLog")
  int idLog;

  GetPeriodLogResponse({
    required this.status,
    required this.idLog,
  });

  factory GetPeriodLogResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPeriodLogResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPeriodLogResponseToJson(this);
}
