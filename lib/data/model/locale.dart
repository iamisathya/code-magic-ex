import 'package:json_annotation/json_annotation.dart';

part 'locale.g.dart';

@JsonSerializable()
class LocaleModel {
  String language;
  String location;

  LocaleModel({required this.language, required this.location});

  factory LocaleModel.fromJson(Map<String, dynamic> json) =>
      _$LocaleModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocaleModelToJson(this);

  Map<String, dynamic> toMap() => {'language': language, 'location': location};
}
