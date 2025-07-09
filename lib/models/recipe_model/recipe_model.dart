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
    required String title,
    required int duration,
    required String description,
    required String authorName,
    required CategoryModel  category,
    @ImagePathConverter() required String authorAvatar,
    @ImagePathConverter() required String recipeAvatar,
    @Default(false) bool isHotRecipe,
    @DateTimeConverter() required DateTime publishedAt,
    @Default(false) bool isFavorite,
}) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);

}