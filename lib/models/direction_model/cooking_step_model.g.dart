// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cooking_step_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CookingStepModel _$CookingStepModelFromJson(Map<String, dynamic> json) =>
    _CookingStepModel(
      type: $enumDecode(_$StepBlockTypeEnumMap, json['type']),
      content: json['content'] as String,
    );

Map<String, dynamic> _$CookingStepModelToJson(_CookingStepModel instance) =>
    <String, dynamic>{
      'type': _$StepBlockTypeEnumMap[instance.type]!,
      'content': instance.content,
    };

const _$StepBlockTypeEnumMap = {
  StepBlockType.heading: 'heading',
  StepBlockType.paragraph: 'paragraph',
  StepBlockType.image: 'image',
};
