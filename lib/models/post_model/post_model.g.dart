// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostModel _$PostModelFromJson(Map<String, dynamic> json) => _PostModel(
  title: json['title'] as String,
  description: json['description'] as String,
  authorName: json['authorName'] as String,
  authorAvatar: const ImagePathConverter().fromJson(
    json['authorAvatar'] as Map<String, dynamic>?,
  ),
  postAvatar: const ImagePathConverter().fromJson(
    json['postAvatar'] as Map<String, dynamic>?,
  ),
  publishedAt: const DateTimeConverter().fromJson(
    json['publishedAt'] as String,
  ),
);

Map<String, dynamic> _$PostModelToJson(_PostModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'authorName': instance.authorName,
      'authorAvatar': const ImagePathConverter().toJson(instance.authorAvatar),
      'postAvatar': const ImagePathConverter().toJson(instance.postAvatar),
      'publishedAt': const DateTimeConverter().toJson(instance.publishedAt),
    };
