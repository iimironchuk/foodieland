import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foodieland/models/direction_model/cooking_step_mapper.dart';
import 'package:foodieland/models/ingredients_model/ingredients_mapper.dart';
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
      final data = response.data['data'];
      final ingredientsJson = data['ingredients'] as List<dynamic>;
      final directionsJson = data['directions'] as List<dynamic>;

      final ingredients = IngredientsMapper.fromJsonList(ingredientsJson);
      final directions = CookingStepMapper.fromJsonList(directionsJson);

      final recipe = RecipeModel.fromJson(data);

      return recipe.copyWith(ingredients: ingredients, directions: directions);
    } else {
      throw Exception('Some error with this recipe');
    }
  }

  Future<List<RecipeModel>> getThreeRandomRecipe() async {
    final response = await _dio.get(
      'recipes',
      queryParameters: {
        'populate': {'recipeAvatar': true, 'category': true},
        'pagination[pageSize]': 10,
        'pagination[page]': 1,
      },
    );

    if (response.isSuccess) {
      final recipes = (response.data['data'] as List)
          .map((json) => RecipeModel.fromJson(json as Map<String, dynamic>))
          .toList();

      List<RecipeModel> shuffledRecipes = List<RecipeModel>.from(recipes)
        ..shuffle();

      return shuffledRecipes.take(3).toList();
    } else {
      return [];
    }
  }

  Future<List<RecipeModel>> getOtherRecipesByCategory({
    required String category,
  }) async {
    final response = await _dio.get(
      'recipes',
      queryParameters: {
        'filters[category][title][\$eq]': category,
        'populate': {'recipeAvatar': true, 'category': true},
        'pagination[pageSize]': 4,
        'pagination[page]': 1,
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
