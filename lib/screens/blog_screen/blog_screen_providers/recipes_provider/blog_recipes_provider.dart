import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blog_recipes_provider.g.dart';

@riverpod
Future<List<RecipeModel>> threeOtherRecipesBlog(Ref ref) async {
  final repository = ref.watch(recipeRepositoryProvider);

  final recipes = repository.getRandomRecipe(numberOfRecipes: 3);

  return recipes;
}
