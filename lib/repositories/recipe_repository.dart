import 'package:dio/dio.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/utils/extensions.dart';

import '../services/api_service.dart';

class RecipeRepository {
  static final RecipeRepository _instance = RecipeRepository._internal();

  factory RecipeRepository() => _instance;

  final Dio _dio = ApiService().dio;

  RecipeRepository._internal();

  Future<List<RecipeModel>> getHotRecipes() async {
    final response = await _dio.get(
      'recipes',
      queryParameters: {'populate': '*', 'filters[isHotRecipe][\$eq]': true},
    );

    if (response.isSuccess) {
      return (response.data['data'] as List)
          .map((json) => RecipeModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      return [];
    }
  }

  Future<List<RecipeModel>> getRecipesForOverview({int limit = 8}) async {
    final response = await _dio.get(
      'recipes',
      queryParameters: {
        'populate': {'recipeAvatar': '*', 'category': '*'},
        'pagination[pageSize]': limit,
      },
    );

    if (response.isSuccess) {
      return (response.data['data'] as List)
          .map((json) => RecipeModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      return [];
    }
  }
}
