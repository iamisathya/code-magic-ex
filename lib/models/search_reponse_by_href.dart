import 'package:json_annotation/json_annotation.dart';

import 'guest_user_info.dart';

part 'search_reponse_by_href.g.dart';

@JsonSerializable()
class SearchedUserInfo {
  @JsonKey(name: "id")
  final Id id;
  @JsonKey(name: "humanName")
  final HumanName humanName;
  @JsonKey(name: "entryPeriod")
  String entryPeriod;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "href")
  String href;
  @JsonKey(name: "joinDate")
  String joinDate;


  SearchedUserInfo({
    required this.id,
    required this.humanName,
    required this.entryPeriod,
    required this.email,
    required this.status,
    required this.type,
    required this.href,
    required this.joinDate,
  });

  factory SearchedUserInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchedUserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchedUserInfoToJson(this);

  Map<String, dynamic> toMap() => {
        'id': id,
        'humanName': humanName,
        'entryPeriod': entryPeriod,
        'email': email,
        'status': status,
        'type': type,
        'href': href,
        'joinDate': joinDate,
      };
}
