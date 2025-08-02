import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'random_other_recipes_provider.g.dart';

@riverpod
Future<List<RecipeModel>> randomOtherRecipes(Ref ref) async {
  try {
    final repository = ref.watch(recipeRepositoryProvider);

    final recipes = await repository.getRandomRecipe(numberOfRecipes: 4);

    return recipes;
  } catch (e) {
    throw Exception(e);
  }
}
