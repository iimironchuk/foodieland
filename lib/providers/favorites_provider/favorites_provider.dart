import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/providers/services_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_provider.g.dart';

@Riverpod(keepAlive: true)
class FavoriteRecipes extends _$FavoriteRecipes {
  Set<String> _favorites = {};

  @override
  Future<Set<String>> build() async {
    final prefs = ref.watch(sharedPreferencesProvider);
    final ids = await prefs.getFavoriteRecipes();
    _favorites = ids.toSet();
    return _favorites;
  }

  Future<void> toggle(RecipeModel recipe) async {
    final prefs = ref.watch(sharedPreferencesProvider);
    await prefs.toggleFavoriteRecipe(recipe);

    final ids = await prefs.getFavoriteRecipes();
    _favorites = ids.toSet();
    state = AsyncData(_favorites);
  }

  bool isFavorite(String recipeId) => _favorites.contains(recipeId);
}

@riverpod
bool isRecipeFavorite(Ref ref, String recipeId) {
  final favoritesAsync = ref.watch(favoriteRecipesProvider);

  return favoritesAsync.maybeWhen(
    data: (favorites) => favorites.contains(recipeId),
    orElse: () => false,
  );
}

final showOnlyFavoritesProvider = StateProvider<bool>((ref) => false);
