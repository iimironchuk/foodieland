import 'package:dio/dio.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/utils/extensions.dart';

import '../services/api_service.dart';

class RecipeRepository {
  static final RecipeRepository _instance = RecipeRepository._internal();

  factory RecipeRepository() => _instance;

  final Dio _dio = ApiService().dio;

  RecipeRepository._internal();
  
  Future<List<RecipeModel>> getRecipesForOverview() async {
    final response = await _dio.get('recipes?populate=recipeAvatar');

    if(response.isSuccess){
      return (response.data['data'] as List)
          .map((json) => RecipeModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else{
      return [];
    }
  }
}
