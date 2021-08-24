import 'package:json_annotation/json_annotation.dart';

part 'enroll_response.g.dart';

@JsonSerializable()
class EnrollResponse {
  @JsonKey(name: "Success")
  String success;
  @JsonKey(name: "Message")
  List<String> message;

  EnrollResponse({
    required this.success,
    required this.message,
  });

  factory EnrollResponse.fromJson(Map<String, dynamic> json) =>
      _$EnrollResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EnrollResponseToJson(this);
}