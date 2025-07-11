import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/recipe_model/recipe_model.dart';
import '../../../providers/repository_providers.dart';
import '../../../providers/shared_preferences_provider.dart';

part 'recipes_recipe_provider.g.dart';

@Riverpod(keepAlive: false)
class RecipesScreenRecipeList extends _$RecipesScreenRecipeList {
  int _page = 1;
  int _limit = 8;
  bool _isLoadingNext = false;
  bool _hasReachedEnd = false;
  List<RecipeModel> _recipes = [];

  @override
  Future<List<RecipeModel>> build() async {
    final repository = ref.watch(recipeRepositoryProvider);
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    final recipesFromServer = await repository.getRecipesForOverview(
      page: _page,
      limit: _limit,
    );

    final List<String> favoriteIds = await sharedPreferences
        .getFavoriteRecipes();

    _recipes = recipesFromServer;

    _recipes = _recipes.map((recipe) {
      return recipe.copyWith(
        isFavorite: favoriteIds.contains(recipe.id.toString()),
      );
    }).toList();

    _hasReachedEnd = _recipes.length < _limit;

    return _recipes;
  }

  Future<void> loadMore() async {
    if (_isLoadingNext || _hasReachedEnd) return;

    _isLoadingNext = true;
    _page++;
    _limit = 9;
    final repository = ref.watch(recipeRepositoryProvider);
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    final recipesFromServer = await repository.getRecipesForOverview(
      page: _page,
      limit: _limit,
    );

    final List<String> favoriteIds = await sharedPreferences
        .getFavoriteRecipes();

    _recipes = [..._recipes, ...recipesFromServer];

    _recipes = _recipes.map((recipe) {
      return recipe.copyWith(
        isFavorite: favoriteIds.contains(recipe.id.toString()),
      );
    }).toList();

    _hasReachedEnd = recipesFromServer.length < _limit;
    _isLoadingNext = false;

    state = AsyncData(_recipes);
  }

  Future<void> toggleFavorite(RecipeModel recipe) async {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);

    await sharedPreferences.toggleFavoriteRecipe(recipe);

    final favoriteIds = await sharedPreferences.getFavoriteRecipes();

    _recipes = _recipes.map((recipe) {
      return recipe.copyWith(
        isFavorite: favoriteIds.contains(recipe.id.toString()),
      );
    }).toList();

    state = AsyncData(_recipes);
  }
}
