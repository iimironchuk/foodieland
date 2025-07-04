import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_recipes_providers.g.dart';

@riverpod
Future<List<RecipeModel>> hotRecipesList(Ref ref) async {
  final repository = ref.watch(recipeRepositoryProvider);

  final hotRecipes = await repository.getHotRecipes();

  return hotRecipes;
}

@riverpod
Future<List<RecipeModel>> recipesList(Ref ref) async {
  final repository = ref.watch(recipeRepositoryProvider);

  final hotRecipes = await repository.getRecipesForOverview(limit: 100);

  return hotRecipes;
}