import 'package:foodieland/models/direction_model/cooking_step_model.dart';
import 'package:foodieland/models/ingredients_model/ingredients_model.dart';
import 'package:foodieland/utils/converters/date_time_converter.dart';
import 'package:foodieland/utils/converters/image_path_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../category_model/category_model.dart';

part 'recipe_model.g.dart';

part 'recipe_model.freezed.dart';

@freezed
abstract class RecipeModel with _$RecipeModel {
  factory RecipeModel({
    required int id,
    required String documentId,
    required String title,
    required int duration,
    required String description,
    required String authorName,
    required CategoryModel category,
    @ImagePathConverter() required String authorAvatar,
    @ImagePathConverter() required String recipeAvatar,
    @Default(false) bool isHotRecipe,
    @DateTimeConverter() required DateTime publishedAt,
    @Default(false) bool isFavorite,
    @Default(0) int prepTime,
    @Default(0) int cookTime,
    @ImagePathConverter() required String videoRecipe,
    @Default(0.0) double calories,
    @Default(0.0) double protein,
    @Default(0.0) double totalFat,
    @Default(0.0) double carbohydrate,
    @Default(0.0) double cholesterol,
    @Default([]) @JsonKey(includeFromJson: false, includeToJson: false) List<IngredientsModel> ingredients,

    @Default([]) @JsonKey(includeFromJson: false, includeToJson: false) List<CookingStepModel> directions,
  }) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);
}
