import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Contacts {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "phone")
  String phone;
  @JsonKey(name: "website")
  String website;

  Contacts(
      {this.id = 0,
      this.name = "",
      this.username = "",
      this.email = "",
      this.phone = "",
      this.website = ""});

  factory Contacts.fromJson(Map<String, dynamic> json) =>
      _$ContactsFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsToJson(this);
}