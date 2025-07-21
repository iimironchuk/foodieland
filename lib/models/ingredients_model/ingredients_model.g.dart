// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IngredientsModel _$IngredientsModelFromJson(Map<String, dynamic> json) =>
    _IngredientsModel(
      type: json['type'] as String,
      text: const IngredientsBlockTextConverter().fromJson(
        json['text'] as Map<String, dynamic>?,
      ),
    );

Map<String, dynamic> _$IngredientsModelToJson(_IngredientsModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': const IngredientsBlockTextConverter().toJson(instance.text),
    };
