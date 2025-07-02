import 'package:foodieland/utils/converters/image_path_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_model.g.dart';
part 'recipe_model.freezed.dart';

@freezed
abstract class RecipeModel with _$RecipeModel {
  factory RecipeModel({
    required String title,
    required int duration,
    required String description,
    required String mealType,
    required String authorName,
    @ImagePathConverter() required String authorAvatar,
    @ImagePathConverter() required String recipeAvatar,
    @Default(false) bool isHotRecipe,
}) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);

}