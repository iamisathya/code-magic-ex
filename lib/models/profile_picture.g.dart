// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_picture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfilePicture _$ProfilePictureFromJson(Map<String, dynamic> json) {
  return ProfilePicture(
    customer: (json['customer'] as List<dynamic>)
        .map((e) => PictureObject.fromJson(e as Map<String, dynamic>))
        .toList(),
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$ProfilePictureToJson(ProfilePicture instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'href': instance.href,
    };

PictureObject _$PictureObjectFromJson(Map<String, dynamic> json) {
  return PictureObject(
    size: json['size'] as String,
    media: json['media'] as String,
  );
}

Map<String, dynamic> _$PictureObjectToJson(PictureObject instance) =>
    <String, dynamic>{
      'size': instance.size,
      'media': instance.media,
    };
