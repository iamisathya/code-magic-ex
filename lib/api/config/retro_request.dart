import 'package:json_annotation/json_annotation.dart';
part 'retro_request.g.dart';

@JsonSerializable(explicitToJson: true)
class RetroRequest {
  @JsonKey(name: 'session')
  String session;

  RetroRequest({required this.session});

  factory RetroRequest.fromJson(Map<String, dynamic> json) =>
      _$RetroRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RetroRequestToJson(this);
}
