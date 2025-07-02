// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => _RecipeModel(
  title: json['title'] as String,
  duration: (json['duration'] as num).toInt(),
  description: json['description'] as String,
  mealType: json['mealType'] as String,
  authorName: json['authorName'] as String,
  authorAvatar: const ImagePathConverter().fromJson(
    json['authorAvatar'] as Map<String, dynamic>?,
  ),
  recipeAvatar: const ImagePathConverter().fromJson(
    json['recipeAvatar'] as Map<String, dynamic>?,
  ),
  isHotRecipe: json['isHotRecipe'] as bool? ?? false,
);

Map<String, dynamic> _$RecipeModelToJson(_RecipeModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'duration': instance.duration,
      'description': instance.description,
      'mealType': instance.mealType,
      'authorName': instance.authorName,
      'authorAvatar': const ImagePathConverter().toJson(instance.authorAvatar),
      'recipeAvatar': const ImagePathConverter().toJson(instance.recipeAvatar),
      'isHotRecipe': instance.isHotRecipe,
    };
