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

  Future<List<RecipeModel>> getRecipesForOverview({
    required int page,
    required int limit,
  }) async {
    final response = await _dio.get(
      'recipes',
      queryParameters: {
        'populate': {'recipeAvatar': true, 'category': true},
        'pagination[pageSize]': limit,
        'pagination[page]': page,
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

  Future<RecipeModel> getRecipeWithDetails({required String documentId}) async {
    final response = await _dio.get(
      'recipes/$documentId',
      queryParameters: {
        'populate': {
          'authorAvatar': true,
          'recipeAvatar': true,
          'category': true,
          'videoRecipe': true,
        },
      },
    );

    if (response.isSuccess) {
      return RecipeModel.fromJson(response.data['data']);
    } else {
      throw Exception('Some error with this recipe');
    }
  }
}
