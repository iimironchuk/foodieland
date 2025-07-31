import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/recipe_model/recipe_model.dart';
import '../providers/favorites_provider/favorites_provider.dart';
import '../providers/services_providers.dart';

class ToggleFavoritesHelper {
  static Future<List<RecipeModel>> updateFavorites({
    required List<RecipeModel> recipes,
    required Ref ref,
    required RecipeModel currentRecipe,
  }) async {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);

    await sharedPreferences.toggleFavoriteRecipe(currentRecipe);

    final favoriteIds = await ref.watch(favoriteRecipesProvider.future);
    recipes = recipes.map((recipe) {
      return recipe.copyWith(
        isFavorite: favoriteIds.contains(recipe.id.toString()),
      );
    }).toList();

    return recipes;
  }
}
