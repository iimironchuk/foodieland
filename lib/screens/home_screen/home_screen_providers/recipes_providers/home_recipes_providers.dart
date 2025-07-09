import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/providers/repository_providers.dart';
import 'package:foodieland/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_recipes_providers.g.dart';

@riverpod
Future<List<RecipeModel>> hotRecipesList(Ref ref) async {
  final repository = ref.watch(recipeRepositoryProvider);

  final hotRecipes = await repository.getHotRecipes();

  return hotRecipes;
}

@Riverpod(keepAlive: false)
class RecipeList extends _$RecipeList {
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

@riverpod
Future<List<RecipeModel>> otherRecipesList(Ref ref) async {
  final repository = ref.watch(recipeRepositoryProvider);

  final otherRecipes = await repository.getRecipesForOverview(page: 2, limit: 8);

  return otherRecipes;
}
