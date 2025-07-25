// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_text_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostTextModel _$PostTextModelFromJson(Map<String, dynamic> json) =>
    _PostTextModel(
      type: $enumDecode(_$PostTextTypeEnumMap, json['type']),
      content: json['content'] as String,
      level: (json['level'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PostTextModelToJson(_PostTextModel instance) =>
    <String, dynamic>{
      'type': _$PostTextTypeEnumMap[instance.type]!,
      'content': instance.content,
      'level': instance.level,
    };

const _$PostTextTypeEnumMap = {
  PostTextType.image: 'image',
  PostTextType.heading: 'heading',
  PostTextType.paragraph: 'paragraph',
};
