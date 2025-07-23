// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => _RecipeModel(
  id: (json['id'] as num).toInt(),
  documentId: json['documentId'] as String,
  title: json['title'] as String,
  duration: (json['duration'] as num).toInt(),
  description: json['description'] as String,
  authorName: json['authorName'] as String,
  category: CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  authorAvatar: const ImagePathConverter().fromJson(
    json['authorAvatar'] as Map<String, dynamic>?,
  ),
  recipeAvatar: const ImagePathConverter().fromJson(
    json['recipeAvatar'] as Map<String, dynamic>?,
  ),
  isHotRecipe: json['isHotRecipe'] as bool? ?? false,
  publishedAt: const DateTimeConverter().fromJson(
    json['publishedAt'] as String,
  ),
  isFavorite: json['isFavorite'] as bool? ?? false,
  prepTime: (json['prepTime'] as num?)?.toInt() ?? 0,
  cookTime: (json['cookTime'] as num?)?.toInt() ?? 0,
  videoRecipe: const ImagePathConverter().fromJson(
    json['videoRecipe'] as Map<String, dynamic>?,
  ),
  calories: (json['calories'] as num?)?.toDouble() ?? 0.0,
  protein: (json['protein'] as num?)?.toDouble() ?? 0.0,
  totalFat: (json['totalFat'] as num?)?.toDouble() ?? 0.0,
  carbohydrate: (json['carbohydrate'] as num?)?.toDouble() ?? 0.0,
  cholesterol: (json['cholesterol'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$RecipeModelToJson(_RecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentId': instance.documentId,
      'title': instance.title,
      'duration': instance.duration,
      'description': instance.description,
      'authorName': instance.authorName,
      'category': instance.category,
      'authorAvatar': const ImagePathConverter().toJson(instance.authorAvatar),
      'recipeAvatar': const ImagePathConverter().toJson(instance.recipeAvatar),
      'isHotRecipe': instance.isHotRecipe,
      'publishedAt': const DateTimeConverter().toJson(instance.publishedAt),
      'isFavorite': instance.isFavorite,
      'prepTime': instance.prepTime,
      'cookTime': instance.cookTime,
      'videoRecipe': const ImagePathConverter().toJson(instance.videoRecipe),
      'calories': instance.calories,
      'protein': instance.protein,
      'totalFat': instance.totalFat,
      'carbohydrate': instance.carbohydrate,
      'cholesterol': instance.cholesterol,
    };
