import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_picture.g.dart';

@JsonSerializable()
class ProfilePicture {
  @JsonKey(name: "sizes")
  List<PictureObject> sizes;
  @JsonKey(name: "href")
  String href;

  ProfilePicture({
    required this.sizes,
    required this.href,
  });

  factory ProfilePicture.fromJson(Map<String, dynamic> json) =>
      _$ProfilePictureFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePictureToJson(this);

  Map<String, dynamic> toMap() => {'sizes': sizes, 'href': href};
}

@JsonSerializable()
class PictureObject {
  @JsonKey(name: "size")
  String size;
  @JsonKey(name: "media")
  String media;

  PictureObject({
    required this.size,
    required this.media,
  });

  factory PictureObject.fromJson(Map<String, dynamic> json) =>
      _$PictureObjectFromJson(json);

  Map<String, dynamic> toJson() => _$PictureObjectToJson(this);
}
